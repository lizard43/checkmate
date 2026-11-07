# Engineering rules — original software first (mandatory)

- **Original source, original language, original interpreter, native compiler/XC and runtime are authoritative** wherever present; preserve algorithms, control flow, DATA, graphics and project semantics.
- **Complete native build:** load complete original-style source through original language tools. TERSE source screens, dictionary, definition parsing and allocation belong to original TERSE loader/XC, not host JavaScript.
- **Host-tool boundary:** Node.js/Python/shell may start tools, transport source unchanged, package real compiler output and independently verify. They must not parse original-language definitions, synthesize word maps, assign word addresses, compile substitute code, generate gameplay, replace art, or rewrite execution tokens.
- **Hardware-only adapters:** Z80/other machine code is for necessary hardware differences, explicitly traced to original routines and documented. Preserve original behavior; never invent alternatives just because they are easier.
- **Mandatory hard stop:** before any alternate compiler, parser, toolchain, translation or unapproved workaround, document the exact original-method obstacle and obtain explicit user approval. No assistant may self-authorize.
- **Evidence:** source audit, actual original compiler build, binary comparison, MAME/emulator execution and physical hardware are distinct. Do not claim tests/stages passed without execution. Test success does not waive architecture rules.
- **Documentation:** keep README project/build oriented. Approved stages in docs/SPRINT-PLAN.md and debts/deviations in docs/TECHNICAL-DEBT.md. Preserve existing work.
- **PR gate:** state original source/toolchain, changes, hardware justification, approvals, tests actually run and outstanding work. Block unapproved architectural deviations regardless of successful compilation.
