#!/usr/bin/env python3
import hashlib,zipfile
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1];game=ROOT.name
choices={"boothill":("boothill.zip",("romh.cpu","romg.cpu","romf.cpu","rome.cpu"),2048),
         "checkmate":("checkmat.zip",("checkmat.h","checkmat.g","checkmat.f","checkmat.e"),1024)}
archive,names,size=choices[game]
with zipfile.ZipFile(ROOT/"roms"/"original"/archive) as z:
    original=[z.read(x) for x in names]
assert all(len(x)==size for x in original)
reference=b"".join(original)
rebuilt=ROOT/"src"/"zout"/(game+".cim")
assert rebuilt.exists(),f"Missing assembled image: {rebuilt}"
actual=rebuilt.read_bytes()
assert len(actual)==len(reference),(len(actual),len(reference))
for i,(a,b) in enumerate(zip(actual,reference)):
    assert a==b, "First ROM byte mismatch at CPU ${:04X}: {:02X} != {:02X}".format(i,a,b)
for name,part in zip(names,original):
    print("PASS",name,len(part),"SHA1",hashlib.sha1(part).hexdigest())
print("PASS exact",game,len(reference),"SHA256",hashlib.sha256(reference).hexdigest())

# Export rebuilt, verified ROM devices and emulator archive.
from zipfile import ZIP_DEFLATED,ZipFile
out=ROOT/"roms"/"build";out.mkdir(parents=True,exist_ok=True)
(out/(game+".bin")).write_bytes(actual)
for j,name in enumerate(names):
    (out/name).write_bytes(actual[j*size:(j+1)*size])
with ZipFile(out/(game+".zip"),"w",compression=ZIP_DEFLATED) as packed:
    for name in names:packed.write(out/name,arcname=name)
print("PASS rebuild artifacts",out)
