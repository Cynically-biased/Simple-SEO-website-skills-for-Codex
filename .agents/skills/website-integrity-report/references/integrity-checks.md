# AI-led integrity inspection reference

The goal is to spot **unintended source damage**, especially after PowerShell
file rewrites or AI-generated edits. Do not execute bundled scanners or alter
project files. Read-only terminal commands for opening/searching files and Git
history are allowed when native file-read tools cannot access content.

## Potential signals

| Signal | Typical investigation | Caution |
| --- | --- | --- |
| `�`, `Ã©`, `â€™` | Compare nearby intended language and UI text | Might be an intentional example |
| Literal `\n` or `\r\n` in markup | Check whether the literal characters leaked from a replacement command | Valid inside some strings |
| Abnormal quote/backtick sequence | Examine PHP/JS string boundaries, escaping and interpolation | Legitimate templates can be complex |
| Broken PHP/HTML tag boundary | Compare adjacent blocks and component usage | Some tags intentionally omit closing tags |
| Unmatched braces or parentheses | Read complete function/block, not isolated line | Not equivalent to parser validation |
| Split/joined lines or huge new line | Look for accidental concatenation or loss of delimiters | Long Tailwind lists are not necessarily broken |
| Here-string remnants (`@'`, `'@`, `@"`) | Check whether PowerShell rewrite delimiters were accidentally written into source | Can appear in intentional documentation |
| Repeated/disappearing blocks | Inspect nearby source and available revision evidence | Repetition can be intentional |
| Conflict marker block | Check `<<<<<<<`, `=======`, `>>>>>>>` together | Documentation may quote examples |
| Inconsistent references after rewrite | Check include paths, enum names, component/data consumers | A mismatch need not be corruption |

## Scope / evidence rules

Inspect all accessible first-party source files in manageable batches; do not
load a whole large repository into context at once. Track which files were
actually read, sampled, inaccessible or excluded. Spot-check referenced code
around suspicious sections. Read-only file-navigation/search tools **and read-only terminal commands**
are fine; do not run packaged scanner scripts or change execution policy.

Viewing decoded text alone **cannot prove valid UTF-8, byte-order marks or
absence of invisible bytes**. Structural suspicion is not proof of root cause.
If the project is too large to inspect fully within resource limits, say which
areas were covered and which were not. Don't silently claim a complete scan.

## Format

1. Brief coverage table: source files discovered, actually inspected, skipped,
   excluded and unavailable (counts only when measured).
2. Findings sorted by severity: `path:line`, evidence, confidence, impact,
   proposed manual correction.
3. Coverage limitations and tests **NOT VERIFIED** (byte-level encoding,
   parser validity, runtime, uninspected files).
4. Summary of confirmed faults, suspected corruption and review-needed items.

**Never fix files inside this skill.** An explicit separate request is needed.
