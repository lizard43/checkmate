# Checkmate hard reverse engineering: native framework and interpreter lineage

Research revision: v20261031-0001. Evidence: original 4 × 1 KB Intel 8080 ROMs, `src/checkmate.asm`, `docs/recovery.json`; comparison: Boot Hill revision v20261031-0004.

## 1. Executable entry paths

| Address | Recovered behavior |
|---|---|
| $0000 | Reset vector: clears A, writes output port $01, branches to $0097 |
| $0008 | Interrupt entry: saves AF/BC/DE and sets B=0 before common scan |
| $0010 | Alternate interrupt entry: saves AF/BC/DE and sets B=1 |
| $002B | Common interrupt input path; saves HL, samples coin edge, decrements nonzero timers, reads input ports $00 and $01 |
| $0079 | Restores registers, enables interrupts and returns |
| $007F | Double-samples input port $03; stores stable sample at RAM $2000 and coin edge at $2001 |
| $0092 | Decrements byte at HL only if nonzero |
| $0097 | Reset-time ROM/RAM diagnostic and initialization path |
| $014C | ROM checksum path, reads sequential ROM bytes and calls $0400 for failure presentation |
| $0185 | Diagnostic halt/output loop |
| $03E5–$0400 | Character/glyph nibble processing and display cursor arithmetic |
| $04F9 | Main initialization target after input port $02 bit 7 check |

These names describe confirmed instruction effects. Naming game-level roles beyond the observed inputs/outputs requires tracing their callers, so other entries are distinguished as `SUBROUTINE_XXXX` or `FLOW_XXXX` rather than pretending that every operation has been semantically recovered.

## 2. Interpreter test — Checkmate compared with Boot Hill

Boot Hill has a genuine bytecode interpreter: its dispatcher at $0F85 reads the script pointer from RAM $2006, fetches a byte, branches on zero to the frame scheduler $0F9F, doubles nonzero opcode indices, and jumps through a 16-entry native handler table beginning at $1951. Its ten-byte dispatcher tail at $0F95 is `07 4F 06 00 09 7E 23 66 6F E9`.

Checkmate contains **no occurrence of that ten-byte sequence** in its 4 KB program ROM. Its recovered interrupt path is a direct native polling/timer routine, not the Boot Hill opcode-fetch path. Checkmate's broad ROM data regions are visibly bitmap graphics, display messages, compact configuration bytes and native lookup tables. They are not evidence of a 16-word bytecode dictionary.

This is a concrete architectural distinction: Boot Hill's reusable feature is an explicit **script PC + indexed handler vectors + frame handoff** interface. The corresponding interface has not emerged in Checkmate's current recovered code. Pointer tables or scheduler state in Checkmate must not automatically be called interpreter words.

## 3. DNA framework progression

| Stage | Mechanism established | Interpreter interface |
|---|---|---|
| Checkmate | Native 8080 interrupt entry, polling/timers, drawing routines, ROM artwork and tables | No Boot Hill-style indexed dispatcher detected |
| Boot Hill | Native scheduler coupled to small bytecode VM | $2006 interpreted PC, zero-opcode handoff, 16 nonzero dictionary vectors |
| Sea Wolf / Tornado Baseball | Shared 8080 indexed-dispatch tail is found in the comparative Boot Hill audit | Tornado has a 26-word dictionary |
| Double Play / Extra Inning | Same dispatcher tail preserved; command vocabulary expanded | 28-word dictionary; $2000 script PC |
| Sea Wolf II | Z80 TERSE native production system | Different direct-threaded word execution model |

The reusable engineering pattern to trace forward is **frame-controlled execution of compact commands whose handlers are native CPU code**, followed by richer game vocabularies. The Boot Hill-to-baseball byte-level dispatcher match is stronger than the relationship to Checkmate's native routines. Do not equate independently named commands or claim identical handler semantics without matching bodies and operand decoding.

## 4. Raw-data classification and evidence

* $018A–$03E4: recognizable fixed-width glyph/tile bitmap bytes; retained as DB, not disassembled as opcodes.
* $0E12–$0E53: compact numeric/configuration/address bytes; pointer membership still needs individual consumer tracing.
* $0E54–$0F55: game-message text with high-bit-terminated character encodings and interleaved text offsets. Visible examples include PLAYER, WINS, GAME OVER, YOU HAVE CREDIT, and CHECKS OUT.
* $0F56–$0FF1: pointer/graphics/state lookup tables, not executable word handlers by default.
* $0FF2–$0FFF: trailing zero-filled ROM padding.
* $001B and $0023: inline encoded labels after JP vectors.
* Other isolated DB regions: preserved original bytes, documented as unresolved/non-executable rather than guessed instructions.

The assembler intentionally retains DB for **genuine data**. Eliminating DB by coercing bitmap/text to instructions would corrupt the reverse engineering. Splits at the major data-region boundaries are generated consistently during rebuild.

## 5. Source quality and next evidence-driven pass

This revision removes `NATIVE_XXXX` labels and `unclassified` comments from the generated checked-in assembly, introduces 28 individually named entries, and distinguishes additional callable subroutines from internal flow labels. It does **not** claim that all 186 entry paths are fully named or all data tables individually decoded.

The generator now retains labels/data roles on regeneration. Original byte values and code instruction encodings are unchanged in the edited source. A fresh zmac byte-exact rebuild and detailed audit of remaining `SUBROUTINE_XXXX`, `FLOW_XXXX`, and mixed pointer tables remain necessary before calling this a complete hard-RE cleanup.

## 6. ROM-level verification

Expected baseline: 4,096 bytes, SHA-256 `8e5841bedb5c866b8c6cf7c1f6b2c45d441f86eee5863c191df36bbfdac76263`. Run `bash build.sh` using the repository's bundled zmac and compare the four regenerated bank images with the original ROMs. No GitHub Actions should be added or changed in this work.
