# DNA interpreter ancestry: checkmate

Recovered from the original Intel 8080 ROM image.

No matching 1976–78 indexed handler-dispatch tail was
found. This is NOT proof of no interpreter: alternate
dispatch and native state tables remain research targets.

## Checkmate's recovered native-service branch

Checkmate uses `RST $18` (timer wait), `RST $20` (player-index wrap), and `RST $28` (indexed 16-bit pointer lookup). Its `$0DE8` helper decodes language-switch bits from input port `$02`, then selects a native address from `$0E3C/$0E44` and executes `JP (HL)` at `$0627/$089E`. Recovered resident paths are `$0628–$0646` and `$089F–$0994`. Alternative entries target the undumped `checkmat.d` language ROM at `$1000–$13FF` (MAME issue 1050). This is a native language selector, not a bytecode command dictionary. See [hard RE](checkmate-hard-re-20261031.md).

## Comparison

| Runtime | Commands | Program representation |
|---|---|---|
| Checkmate | Not established | Native 8080 ROM |
| Boot Hill | 16 callable nonzero slots | $2006 script PC; zero yields |
| Tornado Baseball (1976) | 26 | $2000 script PC; $1A boundary |
| Double Play / Extra Inning | 28 | $2000 script PC; $1C boundary |
| Sea Wolf II TERSE | Direct threaded | Z80 BC fetches 16-bit word address |

The smaller Boot Hill VM may represent a distinct framework
design. Similar mechanism alone does not prove inherited source.
