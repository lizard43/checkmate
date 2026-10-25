#!/usr/bin/env python3
from pathlib import Path
from zipfile import ZipFile
import hashlib,html
ROOT=Path(__file__).resolve().parents[1];game=ROOT.name
config={"boothill":("boothill.zip",("romh.cpu","romg.cpu","romf.cpu","rome.cpu"),2048),
        "checkmate":("checkmat.zip",("checkmat.h","checkmat.g","checkmat.f","checkmat.e"),1024)}
archive,names,size=config[game]
with ZipFile(ROOT/"roms"/"original"/archive) as z:rom=[z.read(n) for n in names]
blocks=[(n,i*size,(i+1)*size-1,hashlib.sha1(part).hexdigest()) for i,(n,part) in enumerate(zip(names,rom))]
blocks.extend([("Work RAM (candidate board space)",0x2000,0x23ff,"Hardware decode unverified"),
               ("Display RAM (candidate board space)",0x2400,0x3fff,"Check board schematics")])
width=910;height=110+94*len(blocks)
svg=['<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 {} {}">'.format(width,height),
 '<rect width="100%" height="100%" fill="#101820"/>',
 '<text x="26" y="44" font-family="monospace" font-size="22" fill="#e8eff4">'+html.escape(game.upper())+' / 8080 memory map</text>']
md=["# "+game+" original memory map","","ROM ranges follow original device order.",
    "RAM and display ranges are provisional pending board schematic confirmation.","",
    "| Address | Device / region | Provenance |","|---|---|---|"]
for i,(name,lo,hi,sha) in enumerate(blocks):
    y=65+94*i
    svg+=['<rect x="26" y="{}" width="850" height="76" fill="{}" stroke="#557187" stroke-width="1"/>'.format(y,"#1c3b50" if i<4 else "#293643"),
          '<text x="41" y="{}" fill="#f5fafc" font-family="monospace" font-size="17">${:04X}-${:04X}  {}</text>'.format(y+29,lo,hi,html.escape(name)),
          '<text x="41" y="{}" fill="#a5bfcd" font-family="monospace" font-size="13">{}</text>'.format(y+53,html.escape(sha[:50]))]
    md.append("| ${:04X}–${:04X} | {} | {} |".format(lo,hi,name,sha))
svg.append("</svg>")
(ROOT/"docs"/"memory-map.svg").write_text("\n".join(svg)+"\n")
(ROOT/"docs"/"memory-map.md").write_text("\n".join(md)+"\n")
