#!/usr/bin/env python3
"""Native Intel 8080 RE from original Midway ROM devices.
All native instruction starts are reached from reset/IRQ vectors. Unclassified
bytes remain DB, never silently converted into unverified instructions.
"""
import argparse,hashlib,json,re,zipfile
from pathlib import Path
from collections import deque,Counter

ROOT=Path(__file__).resolve().parents[1]
CFG={"boothill":("boothill.zip",("romh.cpu","romg.cpu","romf.cpu","rome.cpu"),2048),
     "checkmate":("checkmat.zip",("checkmat.h","checkmat.g","checkmat.f","checkmat.e"),1024)}
REG="B C D E H L (HL) A".split()
PAIR=("BC","DE","HL","SP")
STACK=("BC","DE","HL","AF")
COND=("NZ","Z","NC","C","PO","PE","P","M")
ARITH=("ADD A,","ADC A,","SUB ","SBC A,","AND ","XOR ","OR ","CP ")
ILLEGAL={8,16,24,32,40,48,56,0xcb,0xdd,0xed,0xfd,0xd9}
def decode(mem,pc):
    op=mem[pc];b=mem[pc+1] if pc+1<len(mem) else 0
    w=b+((mem[pc+2] if pc+2<len(mem) else 0)<<8)
    H=f"\${w:04X}";B=f"\${b:02X}"
    if op in ILLEGAL:return None,1,"data",None
    if 0x40<=op<=0x7f:
        return ("HALT",1,"stop",None) if op==0x76 else (f"LD {REG[op>>3&7]},{REG[op&7]}",1,"next",None)
    if 0x80<=op<=0xbf:return ARITH[op>>3&7]+REG[op&7],1,"next",None
    if op&0xcf==1:return f"LD {PAIR[op>>4&3]},{H}",3,"next",None
    if op&0xcf==3:return f"INC {PAIR[op>>4&3]}",1,"next",None
    if op&0xcf==11:return f"DEC {PAIR[op>>4&3]}",1,"next",None
    if op&0xcf==9:return f"ADD HL,{PAIR[op>>4&3]}",1,"next",None
    if op&0xc7==4:return f"INC {REG[op>>3&7]}",1,"next",None
    if op&0xc7==5:return f"DEC {REG[op>>3&7]}",1,"next",None
    if op&0xc7==6:return f"LD {REG[op>>3&7]},{B}",2,"next",None
    if op in (0x22,0x2a,0x32,0x3a):
        return {0x22:f"LD ({H}),HL",0x2a:f"LD HL,({H})",0x32:f"LD ({H}),A",0x3a:f"LD A,({H})"}[op],3,"next",None
    if op&0xc7==0xc0:return "RET "+COND[op>>3&7],1,"next",None
    if op==0xc9:return "RET",1,"stop",None
    if op&0xc7==0xc2:return "JP "+COND[op>>3&7]+","+H,3,"branch",w
    if op==0xc3:return "JP "+H,3,"jump",w
    if op&0xc7==0xc4:return "CALL "+COND[op>>3&7]+","+H,3,"call",w
    if op==0xcd:return "CALL "+H,3,"call",w
    if op&0xcf==0xc1:return "POP "+STACK[op>>4&3],1,"next",None
    if op&0xcf==0xc5:return "PUSH "+STACK[op>>4&3],1,"next",None
    if op&0xc7==0xc7:return f"RST \${op&0x38:02X}",1,"call",op&0x38
    if op&0xc7==0xc6:return ARITH[op>>3&7]+B,2,"next",None
    if op==0xd3:return f"OUT ({B}),A",2,"next",None
    if op==0xdb:return f"IN A,({B})",2,"next",None
    single={0:"NOP",2:"LD (BC),A",10:"LD A,(BC)",0x12:"LD (DE),A",0x1a:"LD A,(DE)",
            7:"RLCA",15:"RRCA",0x17:"RLA",0x1f:"RRA",0x27:"DAA",0x2f:"CPL",0x37:"SCF",
            0x3f:"CCF",0xe9:"JP (HL)",0xf9:"LD SP,HL",0xeb:"EX DE,HL",
            0xe3:"EX (SP),HL",0xf3:"DI",0xfb:"EI"}
    if op in single:return single[op],1,"stop" if op==0xe9 else "next",None
    return None,1,"data",None

def recover(mem,roots):
    q=deque(roots);code={};owned={};entries=set(roots);edges=[]
    while q:
        pc=q.popleft()
        for _ in range(4096):
            if pc not in range(len(mem)) or pc in owned:break
            asm,size,kind,target=decode(mem,pc)
            if asm is None or pc+size>len(mem) or any(pc+i in owned for i in range(size)):break
            code[pc]=(asm,size,kind,target)
            for i in range(size):owned[pc+i]=pc
            if target is not None:
                edges.append({"source":pc,"target":target,"type":kind})
                if target<len(mem):q.append(target);entries.add(target)
            if kind in ("stop","jump"):break
            pc+=size
    return code,owned,entries,edges

def main():
    args=argparse.ArgumentParser()
    args.add_argument("game",choices=CFG.keys())
    game=args.parse_args().game
    archive,names,size=CFG[game]
    with zipfile.ZipFile(ROOT/"roms"/"original"/archive) as z:
        parts=[z.read(n) for n in names]
    assert all(len(p)==size for p in parts)
    mem=b"".join(parts);digest=hashlib.sha256(mem).hexdigest()
    code,owned,entries,edges=recover(mem,(0,8,16))
    signatures=[]
    dispatch_tail=bytes.fromhex("07 4F 06 00 09 7E 23 66 6F E9")
    for i in range(len(mem)-len(dispatch_tail)):
        if mem[i:i+len(dispatch_tail)]==dispatch_tail:
            base=(mem[i-2]|mem[i-1]<<8) if mem[i-3]==0x21 else None
            signatures.append({"tail":i,"vector_base":base})
    (ROOT/"src").mkdir(exist_ok=True);(ROOT/"docs").mkdir(exist_ok=True)
    asm=["; Original "+game+" Intel 8080 ROM, source reconstructed from original bytes.",
         "; Native instruction mnemonics are executable; uncertain regions retain DB.",
         "; Original byte offsets are preserved; zmac v1.3 must rebuild exactly."]
    for part,name in enumerate(names):
        lo=part*size;hi=lo+size
        asm.extend(["",f"        ORG \${lo:04X}",f"; Device {name}, SHA1 {hashlib.sha1(parts[part]).hexdigest()}"])
        pc=lo
        while pc<hi:
            if pc in entries and pc in code:asm.append(f"NATIVE_{pc:04X}:")
            if pc in code and pc+code[pc][1]<=hi:
                inst,n,_,_=code[pc]
                raw=mem[pc:pc+n].hex(" ").upper()
                asm.append(f"        {inst}  ; ROM \${pc:04X}: {raw}")
                pc+=n
            else:
                # Preserve all unclassified bytes, never misidentify as native code.
                stop=min(hi,pc+12)
                for p in range(pc+1,stop):
                    if p in code or p in entries:stop=p;break
                raw=mem[pc:stop]
                asm.append("        DB "+",".join(f"\${b:02X}" for b in raw)+f" ; ROM \${pc:04X} unclassified")
                pc=stop
    (ROOT/"src"/(game+".asm")).write_text("\n".join(asm)+"\n")
    report={"game":game,"cpu":"Intel 8080","rom_size":len(mem),"sha256":digest,
            "devices":[{"name":n,"base":i*size,"size":size,"sha1":hashlib.sha1(p).hexdigest()}
                       for i,(n,p) in enumerate(zip(names,parts))],
            "native_instruction_count":len(code),"native_byte_count":len(owned),
            "edges":edges,"indexed_dispatch_signatures":signatures}
    (ROOT/"docs"/"recovery.json").write_text(json.dumps(report,indent=2)+"\n")
    print(game,"native 8080 instructions",len(code),"code bytes",len(owned),
          "indexed dispatches",signatures)
if __name__=="__main__":main()
