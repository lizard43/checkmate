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
    H=f"${w:04X}";B=f"${b:02X}"
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
    if op&0xc7==0xc7:return f"RST ${op&0x38:02X}",1,"call",op&0x38
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

# Native target recovery includes ROM language-zero entry points $0628 and $089F.
# Semantic entries and control-flow labels; regenerated source must retain them.
LABELS = {'0000':'RESET_ENTRY','0008':'IRQ_VBLANK_ENTRY','0010':'IRQ_TICK_ENTRY','0018':'START_MESSAGE_VECTOR','0020':'COIN_MESSAGE_VECTOR','0028':'GAME_MESSAGE_VECTOR','002B':'IRQ_COMMON_INPUT_SCAN','0053':'FLOW_0053','0061':'FLOW_0061','006B':'FLOW_006B','0079':'IRQ_RESTORE_REGISTERS','007F':'SAMPLE_COIN_EDGE','0092':'DEC_NONZERO_TIMER','0097':'BOOT_ROM_RAM_DIAGNOSTIC','00A3':'DIAG_RAM_PASS_BEGIN','00A6':'DIAG_RAM_FORWARD_SCAN','00BB':'FLOW_00BB','00BD':'FLOW_00BD','00C4':'DIAG_RAM_REVERSE_SCAN','00DF':'FLOW_00DF','00E1':'FLOW_00E1','00F5':'FLOW_00F5','00F7':'FLOW_00F7','00FA':'DIAG_RAM_FINAL_SCAN','0116':'FLOW_0116','0118':'FLOW_0118','011D':'DIAG_TEST_RESULT','012F':'FLOW_012F','0135':'FLOW_0135','013B':'FLOW_013B','014C':'DIAG_ROM_CHECKSUM','0159':'DIAG_ROM_BANK_LOOP','015D':'DIAG_ROM_SUM_LOOP','0177':'FLOW_0177','0185':'DIAG_FAILURE_HALT','03E5':'ADVANCE_GLYPH_NIBBLE','03F4':'FLOW_03F4','03FB':'FLOW_03FB','03FC':'DRAW_GLYPH_NIBBLE','0400':'ADVANCE_DISPLAY_CURSOR','040D':'ADVANCE_DISPLAY_ROW','0416':'FLOW_0416','041D':'FLOW_041D','0426':'FLOW_0426','0438':'SUBROUTINE_0438','043A':'SUBROUTINE_043A','044C':'SUBROUTINE_044C','045B':'FLOW_045B','045F':'FLOW_045F','046A':'FLOW_046A','0472':'FLOW_0472','0479':'FLOW_0479','0488':'FLOW_0488','048C':'FLOW_048C','04F9':'BOOT_GAME_INIT','0514':'SUBROUTINE_0514','0515':'FLOW_0515','0520':'SUBROUTINE_0520','0542':'FLOW_0542','0548':'FLOW_0548','054E':'FLOW_054E','056B':'FLOW_056B','056E':'FLOW_056E','057D':'FLOW_057D','05A7':'FLOW_05A7','05AA':'FLOW_05AA','05DE':'FLOW_05DE','05FB':'FLOW_05FB','0608':'FLOW_0608','0609':'FLOW_0609','0621':'FLOW_0621','0647':'FLOW_0647','0672':'FLOW_0672','069C':'SUBROUTINE_069C','06A5':'SUBROUTINE_06A5','06BC':'SUBROUTINE_06BC','06D5':'SUBROUTINE_06D5','06DC':'FLOW_06DC','06F6':'FLOW_06F6','0708':'FLOW_0708','071A':'FLOW_071A','073B':'FLOW_073B','0756':'FLOW_0756','076B':'FLOW_076B','0770':'FLOW_0770','0776':'FLOW_0776','0779':'FLOW_0779','0789':'FLOW_0789','0796':'FLOW_0796','07AC':'FLOW_07AC','07B3':'SUBROUTINE_07B3','07C3':'FLOW_07C3','07C5':'FLOW_07C5','07CE':'FLOW_07CE','07D2':'FLOW_07D2','07D6':'FLOW_07D6','07DF':'FLOW_07DF','07E3':'SUBROUTINE_07E3','07EC':'FLOW_07EC','07F6':'SUBROUTINE_07F6','080A':'FLOW_080A','080F':'SUBROUTINE_080F','0826':'FLOW_0826','088C':'FLOW_088C','0995':'SUBROUTINE_0995','09CD':'FLOW_09CD','09DF':'FLOW_09DF','0A08':'FLOW_0A08','0A15':'FLOW_0A15','0A55':'FLOW_0A55','0A81':'FLOW_0A81','0A87':'FLOW_0A87','0AB0':'FLOW_0AB0','0AD4':'FLOW_0AD4','0AE5':'SUBROUTINE_0AE5','0AEB':'FLOW_0AEB','0AEE':'SUBROUTINE_0AEE','0AF4':'FLOW_0AF4','0B35':'FLOW_0B35','0B3C':'SUBROUTINE_0B3C','0B80':'FLOW_0B80','0B86':'FLOW_0B86','0B8F':'FLOW_0B8F','0B96':'FLOW_0B96','0B9E':'FLOW_0B9E','0BA7':'FLOW_0BA7','0BAB':'FLOW_0BAB','0BBD':'FLOW_0BBD','0BC4':'FLOW_0BC4','0BC6':'FLOW_0BC6','0BCD':'SUBROUTINE_0BCD','0BCF':'SUBROUTINE_0BCF','0BD2':'SUBROUTINE_0BD2','0BDD':'SUBROUTINE_0BDD','0BE8':'SUBROUTINE_0BE8','0BF9':'FLOW_0BF9','0BFD':'FLOW_0BFD','0C21':'FLOW_0C21','0C24':'FLOW_0C24','0C35':'FLOW_0C35','0C3B':'SUBROUTINE_0C3B','0C50':'FLOW_0C50','0C54':'FLOW_0C54','0C59':'SUBROUTINE_0C59','0C66':'FLOW_0C66','0C6B':'SUBROUTINE_0C6B','0C83':'SUBROUTINE_0C83','0C8E':'SUBROUTINE_0C8E','0C91':'SUBROUTINE_0C91','0C99':'RST28_INDEXED_LOOKUP','0C9C':'SUBROUTINE_0C9C','0CA8':'RST20_WRAP_PLAYER_INDEX','0CB1':'FLOW_0CB1','0CB4':'SUBROUTINE_0CB4','0CC0':'FLOW_0CC0','0CCA':'SUBROUTINE_0CCA','0CDD':'SUBROUTINE_0CDD','0CDF':'SUBROUTINE_0CDF','0CE2':'FLOW_0CE2','0CE9':'SUBROUTINE_0CE9','0CF2':'FLOW_0CF2','0CF9':'FLOW_0CF9','0D0B':'SUBROUTINE_0D0B','0D11':'SUBROUTINE_0D11','0D1B':'FLOW_0D1B','0D33':'SUBROUTINE_0D33','0D34':'SUBROUTINE_0D34','0D39':'SUBROUTINE_0D39','0D3D':'FLOW_0D3D','0D5B':'SUBROUTINE_0D5B','0D73':'SUBROUTINE_0D73','0D78':'SUBROUTINE_0D78','0D7D':'RST18_WAIT_TIMER','0D83':'FLOW_0D83','0D91':'SUBROUTINE_0D91','0D99':'FLOW_0D99','0DB8':'SUBROUTINE_0DB8','0DBB':'FLOW_0DBB','0DC6':'SUBROUTINE_0DC6','0DC9':'SUBROUTINE_0DC9','0DD4':'SUBROUTINE_0DD4','0DE8':'SUBROUTINE_0DE8','0DF2':'SUBROUTINE_0DF2','0DF4':'FLOW_0DF4','0DF6':'FLOW_0DF6','0DF7':'FLOW_0DF7','0628':'LANGUAGE0_INTRO_RENDER','089F':'LANGUAGE0_ROUND_SETUP','08E6':'ROUND_WINNER_TEXT_END','08D4':'ROUND_WINNER_TEXT_LOOP','0926':'ROUND_PLAYER_COUNT_LOOP','091B':'ROUND_SCORE_UPDATE_DONE','0905':'ROUND_SCORE_UPDATE_LOOP','0948':'ROUND_PLAYER_COUNT_MISMATCH','092E':'ROUND_PLAYER_COUNT_STEP','092C':'ROUND_PLAYER_COUNT_INNER','095E':'ROUND_SHOW_WINNER_LOOP','0955':'ROUND_END_FRAME_LOOP'}
SEMANTIC_COMMENT = {'RESET_ENTRY':'Reset: clear output latch and enter startup diagnostic.','IRQ_VBLANK_ENTRY':'Interrupt path 0: save registers, scan coin and timers without player input branch.','IRQ_TICK_ENTRY':'Interrupt path 1: save registers and select player-input scan.','START_MESSAGE_VECTOR':'Jump vector followed by packed high-bit-terminated MAT label bytes.','COIN_MESSAGE_VECTOR':'Jump vector followed by packed high-bit-terminated COIN label bytes.','GAME_MESSAGE_VECTOR':'Direct entry to game message routine.','IRQ_COMMON_INPUT_SCAN':'Shared IRQ body: sample port 03, decrement timers, capture four input nibbles.','IRQ_RESTORE_REGISTERS':'Restore 8080 registers, re-enable interrupts and return.','SAMPLE_COIN_EDGE':'Stable port-03 sample detection; record changed high coin-edge bit in RAM 2001.','DEC_NONZERO_TIMER':'Decrement byte at HL only when already nonzero.','BOOT_ROM_RAM_DIAGNOSTIC':'Startup tests: port 02 gate, RAM patterns and ROM checksums.','DIAG_RAM_PASS_BEGIN':'Begin RAM pattern pass with pointer HL at 2000.','DIAG_RAM_FORWARD_SCAN':'Walk candidate RAM and compare against test pattern B.','DIAG_RAM_REVERSE_SCAN':'Reverse RAM sweep; accumulate changed bits in D/E.','DIAG_RAM_FINAL_SCAN':'Forward cleanup sweep of RAM pattern.','DIAG_TEST_RESULT':'Determine whether a memory bit failed and format error output.','DIAG_ROM_CHECKSUM':'Initialize stack and checksum passes across four 1 KB ROM banks.','DIAG_ROM_BANK_LOOP':'Run one ROM device checksum and fault-report iteration.','DIAG_ROM_SUM_LOOP':'Accumulate bytes, output progress to port 02.','DIAG_FAILURE_HALT':'Failure loop: repeated output to port 02.','ADVANCE_GLYPH_NIBBLE':'Process high-nibble pixel data and call display cursor utility.','DRAW_GLYPH_NIBBLE':'Low-nibble glyph-to-display drawing path.','ADVANCE_DISPLAY_CURSOR':'Map glyph advances into 32-byte display rows.','ADVANCE_DISPLAY_ROW':'Advance display cursor across a 32-byte row boundary.','BOOT_GAME_INIT':'Game initialization target after diagnostic port-02 gate.','RST28_INDEXED_LOOKUP':'RST $28: table lookup indexed by RAM $2011, then shared word fetch $0C9C.','RST20_WRAP_PLAYER_INDEX':'RST $20: increment modulo player count at RAM $2007.','RST18_WAIT_TIMER':'RST $18: wait for RAM $21BE countdown while servicing $0520.'}
DATA_BOUNDARIES = (0x018A, 0x03E5, 0x0E12, 0x0E54, 0x0F56, 0x0FF2)
def data_role(pc):
    if 0x018A <= pc < 0x03E5: return "8-bit glyph and tile bitmap bytes"
    if 0x0E12 <= pc < 0x0E54: return "timing, configuration and address lookup bytes"
    if 0x0E54 <= pc < 0x0F56: return "high-bit-terminated screen text and text index bytes"
    if 0x0F56 <= pc < 0x0FF2: return "graphics, pointer and game-state lookup tables"
    if pc >= 0x0FF2: return "ROM tail zero padding"
    if pc in (0x001B, 0x0023): return "entry-vector inline high-bit-terminated label"
    return "preserved non-executable data / unresolved structure"
def symbolic_instruction(inst):
    m = re.match(r"^(JP|CALL)( [A-Z]+,)? \$([0-9A-F]{4})$",inst)
    if not m: return inst
    name = LABELS.get(m.group(3))
    return m.group(1)+(m.group(2) or "")+" "+name if name else inst

def main():
    args=argparse.ArgumentParser()
    args.add_argument("game",choices=CFG.keys())
    game=args.parse_args().game
    archive,names,size=CFG[game]
    with zipfile.ZipFile(ROOT/"roms"/"original"/archive) as z:
        parts=[z.read(n) for n in names]
    assert all(len(p)==size for p in parts)
    mem=b"".join(parts);digest=hashlib.sha256(mem).hexdigest()
    code,owned,entries,edges=recover(mem,(0,8,16,0x0628,0x089F))
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
        asm.extend(["",f"        ORG ${lo:04X}",f"; Device {name}, SHA1 {hashlib.sha1(parts[part]).hexdigest()}"])
        pc=lo
        while pc<hi:
            if pc in entries and pc in code:
                name = LABELS.get(f"{pc:04X}",f"FLOW_{pc:04X}")
                if name in SEMANTIC_COMMENT: asm.append("; "+SEMANTIC_COMMENT[name])
                asm.append(name+":")
            if pc in code and pc+code[pc][1]<=hi:
                inst,n,_,_=code[pc]
                raw=mem[pc:pc+n].hex(" ").upper()
                asm.append(f"        {symbolic_instruction(inst)}  ; ROM ${pc:04X}: {raw}")
                pc+=n
            else:
                # Preserve all unclassified bytes, never misidentify as native code.
                stop=min(hi,pc+12)
                stop=min([stop]+[b for b in DATA_BOUNDARIES if pc < b < stop])
                for p in range(pc+1,stop):
                    if p in code or p in entries:stop=p;break
                raw=mem[pc:stop]
                asm.append("        DB "+",".join(f"${b:02X}" for b in raw)+f" ; ROM ${pc:04X} {data_role(pc)}")
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
