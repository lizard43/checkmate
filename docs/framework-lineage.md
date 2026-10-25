# DNA interpreter ancestry: checkmate

Recovered from the original Intel 8080 ROM image.

No matching 1976–78 indexed handler-dispatch tail was
found. This is NOT proof of no interpreter: alternate
dispatch and native state tables remain research targets.

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
