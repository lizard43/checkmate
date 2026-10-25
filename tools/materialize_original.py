#!/usr/bin/env python3
"""Materialize supplied Checkmate ROM devices without changing a single ROM byte.

Payload is zlib-compressed H+G+F+E original Intel 8080 devices.
The source ZIP container is recreated; individual ROM bytes and SHA remain original.
"""
from pathlib import Path
from zipfile import ZipFile,ZIP_DEFLATED
import base64,hashlib,zlib
ROOT=Path(__file__).resolve().parents[1]
encoded=(ROOT/"tools"/"checkmat-original-rom.zlib.b64").read_text().strip()
data=zlib.decompress(base64.b64decode(encoded))
expected="8e5841bedb5c866b8c6cf7c1f6b2c45d441f86eee5863c191df36bbfdac76263"
assert len(data)==4096,(len(data),4096)
assert hashlib.sha256(data).hexdigest()==expected
names=("checkmat.h","checkmat.g","checkmat.f","checkmat.e")
out=ROOT/"roms"/"original"/"checkmat.zip"
out.parent.mkdir(parents=True,exist_ok=True)
with ZipFile(out,"w",ZIP_DEFLATED) as archive:
    for i,name in enumerate(names):
        archive.writestr(name,data[i*1024:(i+1)*1024])
with ZipFile(out) as archive:
    rebuilt=b"".join(archive.read(n) for n in names)
assert rebuilt==data
print("PASS Checkmate original ROM devices",len(data),"sha256",expected)
