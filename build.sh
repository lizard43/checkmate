#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
GAME="$(basename "$PWD")"
ZMAC="${ZMAC:-./tools/zmac}"
if [[ ! -x "$ZMAC" ]]; then
  echo "zmac v1.3 not executable; supply ZMAC=/path/to/zmac" >&2
  exit 2
fi
mkdir -p src/zout roms/build
python3 tools/materialize_original.py
python3 tools/recover_8080.py "$GAME"
python3 tools/framework_lineage.py
python3 tools/memory_map.py
"$ZMAC" -c -o "roms/build/$GAME.bin" -x "src/zout/$GAME.lst" "src/$GAME.asm"
python3 tools/verify_rom.py
