# Checkmate: Native Services, Language Dispatch, and DNA Lineage

**Revision:** v20261031-0002. Source: original Checkmate four 1 KB Intel 8080 ROM devices and `src/checkmate.asm`. Baseline SHA-256: `8e5841bedb5c866b8c6cf7c1f6b2c45d441f86eee5863c191df36bbfdac76263`.

## Finding: native dispatch, not a game-bytecode VM

Checkmate's known 4 KB program does not contain the Boot Hill / Sea Wolf / baseball indexed-bytecode dispatcher tail `07 4F 06 00 09 7E 23 66 6F E9`. A deeper audit nevertheless found **two native indirect jump destinations** previously marked as `DB`: `$0628–$0646` and `$089F–$0994`. These add **277 executable bytes and 124 native instructions** to the recovered assembly. They are selected by the **language configuration bits**, not an interpreted instruction stream.

Checkmate's native framework provides compact services through three `RST` vectors and a shared indexed 16-bit pointer fetch. These are the meaningful callable “words” of its service layer, not a demonstrated language interpreter.

## Recovered RST service vocabulary

| One-byte call | ROM vector | Native target | Role |
|---|---|---|---|
| `RST $18` | `$0018` | `$0D7D` | Store A into countdown RAM `$21BE`, service `$0520` until the counter becomes zero, then return; 8 uses in recovered source |
| `RST $20` | `$0020` | `$0CA8` | Compare (HL) against player count `RAM[$2007]`; increment it or wrap to 1; 7 uses |
| `RST $28` | `$0028` | `$0C99` | Fetch current player index `RAM[$2011]` into A, then enter `$0C9C` shared indexed word lookup; 11 uses |

**Shared indexed word helper, `$0C9C`:** doubles the index in A, adds it to the table base in HL, loads a little-endian pointer into HL, preserves DE, and returns. The *caller* either dereferences the selected object, renders it or jumps. There is no interpreter PC, token fetch, operand consumption, and redispatch loop in this service.

## Language-selector ABI and exact tables

Both paths use selector `$0DE8`:

```asm
$0DE8  IN A,($02)
$0DEA  RLCA
$0DEB  RLCA
$0DEC  RLCA
$0DED  AND $03      ; original port-$02 bits 5–6
$0DEF  JP $0C9C     ; return selected 16-bit native address in HL
```

| Table | Native JP site | Choice 0 (resident) | Choice 1 | Choice 2 | Choice 3 |
|---|---|---|---|---|---|
| `$0E3C` | `$0627` | `$0628` | `$1000` | `$1003` | `$1006` |
| `$0E44` | `$089E` | `$089F` | `$1009` | `$100C` | `$100F` |

The destinations at `$1000–$100F` belong to Checkmate's **undumped fifth ROM `checkmat.d`** mapped at `$1000` with size `$0400`. The historic MAME issue describes this as a **language ROM**, with German, French and Spanish options, consistent with the DIP-switch selection. These are not unidentified dictionary vectors. Evidence: https://mametesters.org/view.php?id=1050.

### First selected native path: `LANGUAGE0_INTRO_RENDER`, $0628–$0646 (31 bytes)

Renders the packed PLAYER text at `$0E54` and WINS text at `$0E5A` using `$0DBB` and `$044C`, draws the selected player's numeral derived from `RAM[$2007]`, then falls through into `$0647`. A 31-byte instruction sequence previously stored as raw `DB` is now native assembly.

### Second selected path: `LANGUAGE0_ROUND_SETUP`, $089F–$0994 (246 bytes)

The reconstructed English-language round/result routine:
- `$089F–$08D3`: configures screen output, renders game messages and selects table-driven text via `RST $28`.
- `$08D4–$08E5`: loops over null-terminated result text; calls `RST $18` to pace output.
- `$08E6–$0925`: clears current state and updates scoring; `$0915–$0917` increments with `DAA`, so score arithmetic is BCD-oriented.
- `$0926–$0954`: iterates state/player-position entries and calls display helpers.
- `$0955–$098A`: loops through winner/result entries, `RST $20` player-index increment, `$0C9C` word-pointer fetch and timing.
- `$098B–$0994`: clears display using `$0D11` and returns.

The recovery generator now seeds both indirect native entry points rather than limiting traversal to reset/interrupt entry points. The extra branch destinations inside this routine have named loop/flow labels.

## Interpreter comparison and chronology

| Feature | Checkmate (1977) | Boot Hill / Sea Wolf / baseball |
|---|---|---|
| Script PC and command fetch | No corresponding interpreter path recovered | Boot Hill: RAM `$2006`, byte fetch and zero-token frame yield; later games have game-specific program pointers |
| Tables | Two four-way **language-specific native entry tables** | Boot Hill 16 nonzero command handlers; Tornado Baseball 26; Double Play / Extra Inning 28 |
| Indirect call | `$0C9C` word-pointer fetch, `JP (HL)` at `$0627/$089E` | Indexed bytecode handlers selected from script tokens |
| Service ABI | `RST $18/$20/$28` with native handlers | Interpreter words with variable inline operands and native handler execution |

The similarity is **reuse of compact native services, pointer vectors, and 8080 dispatch idioms**, not a proven common command set. The known byte-exact Boot Hill dispatcher tail also appears in Sea Wolf, Tornado Baseball, Double Play and Extra Inning; Checkmate instead exposes a parallel native-services architecture. Its RST call surface is a worthwhile architectural antecedent to compare with Astrocade's later BIOS conventions, without asserting identical implementation.

**Provenance:** Jamie Fenton discusses her early DNA work on Checkmate and 280 ZZZAP in a first-person interview: https://www.artic.edu/pdf/static/download-collection.publications.digital-publications-sections.show-16.pdf. Checkmate therefore provides a direct 1977 Fenton/DNA case study alongside the evolution of interpreted games.

## Data and build integrity

Bitmap tiles and glyphs `$018A–$03E4`, high-bit-terminated text starting at `$0E54`, non-language lookup data, and padding must remain genuine data. The two identified code ranges must **not** remain `DB`. Unknown `checkmat.d` bytes must not be synthesized.

Re-run `bash build.sh` with the existing bundled **zmac v1.3** and compare all rebuilt banks to their originals; original fixture SHA-256 above. **This connector-based pass did not execute the local zmac roundtrip**. Additional semantic renaming and individual table-consumer tracing are still needed. No GitHub Actions were added.
