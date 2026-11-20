---
name: website-integrity-report
description: >-
  Manual, read-only whole-project code and text integrity audit. Detect invalid
  UTF-8, suspicious corrupted symbols, mojibake, conflict markers, bad line
  endings, broken source syntax and other evidence of damaged files. Uses a
  bundled deterministic PowerShell scanner and targeted inspection only.
---

# Website integrity report (manual, read-only)

Invoke **only** via `$website-integrity-report`. Do not run on normal
`$website-workflow`, formatting, cleanup, test, SEO or design operations.

## Scope and procedure

1. Scan the entire first-party project source tree, not just Git-changed files.
   Exclude `.git`, `node_modules`, `vendor`, `.agents`, build outputs, generated,
   minified, caches and binary/media contents by default; **list exclusions**.
   Do not assume excluded files have been inspected. Include app PHP, HTML,
   JavaScript, JSON, CSS/config, templates and text resources as appropriate.
2. On Windows PowerShell, prefer the bundled scanner:
   `powershell -NoProfile -File .agents/skills/website-integrity-report/scripts/scan-integrity.ps1 -Root .`
   It is read-only, creates no project artifacts, and uses installed `php`/
   `node` if available. If execution is restricted or tools are unavailable,
   report this; do not install software, bypass permissions or fabricate checks.
3. Review **only flagged files and limited nearby context**, confirm whether
   anomalies are real, and distinguish true corruption from legitimate Unicode
   (Dutch accents, CJK text, emojis), intentional test fixtures or examples.
4. Report severity, confidence, exact `path:line`, evidence, risk and safe
   remediation guidance. Summarize files scanned, files excluded and checks
   skipped. Do **not** change any project file, Git state, dependencies, cache
   or configuration. Do not automatically apply fixes, even for obvious issues.

## Checks and limits

- Strict UTF-8 validation (including BOM handling), U+FFFD replacement
  characters, unusual controls/NUL in text, suspicious mojibake (`Ã©`, `â€™`
  etc.), mixed line endings and inconsistent BOMs. Report likely encoding
  anomalies as **suspected**, not certain, when the original encoding is unknown.
- Git conflict markers and suspicious unfinished fragments, noting that
  heuristic checks can have false positives.
- PHP syntax with `php -l`, JavaScript syntax with `node --check` where those
  commands are installed; JSON parse validation. HTML structure and complex
  runtime correctness are not reliably proven by the basic scanner.
- Binary/media data: classify by file type/signature and skip text decoding;
  do not claim full binary integrity or source semantics were verified.
- Never confuse legitimate emoji, accented text, Tailwind class characters,
  minified code or a deliberately non-UTF-8 file with confirmed corruption.
- Limit model context: deterministic, full-project scanning first; only
  suspicious findings go to deeper model-based analysis. Avoid Graphify
  indexing and costly full-project AI rereads.

Read `references/integrity-checks.md` only if needed for ambiguous findings.
Root `AGENTS.md` governs the global read-only and token-efficiency rules.
