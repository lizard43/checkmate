#!/usr/bin/env python3
"""ROM-grounded early DNA VM ancestry: Boot Hill vs Checkmate."""
import json,zipfile,hashlib
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
GAME=ROOT.name.lower()
SPEC={"boothill":("boothill.zip",("romh.cpu","romg.cpu","romf.cpu","rome.cpu")),
      "checkmate":("checkmat.zip",("checkmat.h","checkmat.g","checkmat.f","checkmat.e"))}
def w(data,at):return data[at]|data[at+1]<<8
def main():
    archive,files=SPEC[GAME]
    with zipfile.ZipFile(ROOT/"roms"/"original"/archive) as z:
        image=b"".join(z.read(f) for f in files)
    needle=bytes.fromhex("07 4f 06 00 09 7e 23 66 6f e9")
    hits=[i for i in range(len(image)-len(needle)+1) if image[i:i+len(needle)]==needle]
    report={"game":GAME,"sha256":hashlib.sha256(image).hexdigest(),
         "dispatch_tail_hits":hits}
    lines=["# DNA interpreter ancestry: "+GAME,"",
           "Recovered from the original Intel 8080 ROM image.",""]
    if GAME=="boothill":
        assert hits==[0x0F95],hits
        assert image[0x0F85:0x0F95]==bytes.fromhex("2a06207ea7ca9f0f23220620eb215119")
        assert w(image,0x1951)==0xC920
        table=[w(image,0x1951+2*i) for i in range(1,17)]
        assert all(0<=p<0x2000 for p in table)
        report.update({"script_pc_ram":0x2006,"zero_opcode":"frame scheduler",
          "frame_scheduler":0x0F9F,"vector_base":0x1951,
          "valid_opcode_interval":[1,16],"vectors":{format(i,"02X"):p for i,p in enumerate(table,1)}})
        lines.extend(["Boot Hill uses RAM $2006 for its interpreted program counter.",
          "Its $00 opcode immediately enters scheduler $0F9F and does not",
          "dispatch through the vector table. Nonzero opcodes are doubled",
          "and indexed from $1951, giving sixteen executable slots $01–$10.",
          "Slot zero is the invalid target $C920; it is never executed via",
          "the vector table because zero takes the scheduler branch.","",
          "| Opcode | Native handler | First eight original bytes |",
          "|---|---|---|"])
        for i,p in enumerate(table,1):
            lines.append("| $"+format(i,"02X")+" | $"+format(p,"04X")+" | "+image[p:p+8].hex(' ').upper()+" |")
        lines+=["","Native code installs candidate program roots $1A91 and $1AE7",
          "using LD HL and LD ($2006),HL. Each word's argument shape",
          "requires separate handler analysis; it is NOT the 26/28-opcode",
          "later baseball dictionary."]
    else:
        assert hits==[],hits
        report["indexed_vector_signature"]=False
        lines+=["No matching 1976–78 indexed handler-dispatch tail was",
          "found. This is NOT proof of no interpreter: alternate",
          "dispatch and native state tables remain research targets."]
    lines+=["","## Comparison","",
       "| Runtime | Commands | Program representation |",
       "|---|---|---|",
       "| Checkmate | Not established | Native 8080 ROM |",
       "| Boot Hill | 16 callable nonzero slots | $2006 script PC; zero yields |",
       "| Tornado Baseball (1976) | 26 | $2000 script PC; $1A boundary |",
       "| Double Play / Extra Inning | 28 | $2000 script PC; $1C boundary |",
       "| Sea Wolf II TERSE | Direct threaded | Z80 BC fetches 16-bit word address |",
       "","The smaller Boot Hill VM may represent a distinct framework",
       "design. Similar mechanism alone does not prove inherited source."]
    (ROOT/"docs").mkdir(exist_ok=True)
    (ROOT/"docs"/"framework-lineage.json").write_text(json.dumps(report,indent=2)+"\n")
    (ROOT/"docs"/"framework-lineage.md").write_text("\n".join(lines)+"\n")
    print("PASS",GAME,"dispatches",hits,"verified slots",len(report.get("vectors",{})))
if __name__=="__main__":main()
