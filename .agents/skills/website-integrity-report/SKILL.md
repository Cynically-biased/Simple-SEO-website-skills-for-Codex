---
name: website-integrity-report
description: >-
  Manual, read-only, AI-led inspection of existing project source files for
  corruption, mangled characters and code damage introduced by PowerShell,
  text encoding changes, copy/paste or automated code rewrites. No bundled
  scanner, script execution, new dependencies or file modifications.
---

# Website integrity report — AI inspection, no scanner

Invoke **only** through `$website-integrity-report`. This command asks the
Codex agent to **inspect project files directly**, not to run a packaged
PowerShell scanner. It is an opt-in, read-only report; never run it
implicitly from `$website-workflow` or another audit.

## Required process

1. Discover the project's first-party source files using available file
   browsing/search/read capabilities. Include PHP pages, handlers, enums,
   components, data arrays, HTML, JS, JSON, configuration, templates and
   authored text files. Inspect the whole first-party project in bounded
   batches, rather than merely Git-changed files. List the scope and any
   inaccessible files. Exclude third-party, generated, minified, caches,
   `.git` internals, `.agents` skill files and binary/media files from code
   inspection by default, and name these exclusions.
2. **Do not invoke `scan-integrity.ps1` or any other scanner. Do not run
   PowerShell, shell, PHP, Node, Python or other scripts/commands for this
   report. Do not install utilities or change execution policies.** Use
   Codex's ordinary file-reading, navigation and search capabilities only.
   If file contents cannot be accessed, report incomplete coverage.
3. Examine source for suspicious corruption introduced by past PowerShell
   commands, file encodings, line-based replacements or AI rewrites, including
   broken quoting/backticks, literal escape sequences like `\n` where
   real line breaks belong, malformed interpolation, unintended joined/split
   lines, truncated blocks, duplicate paste fragments, stray here-string
   delimiters, and inconsistencies between affected code and its consumers.
4. Look for replacement glyphs (`�`), likely mojibake (`Ã©`, `â€™`),
   unexpected NUL/control characters *when visible*, odd punctuation in
   identifiers or markup, unresolved merge markers, malformed PHP/HTML/JS,
   missing brackets, suspicious PHP tag boundaries and damaged string
   literals. Inspect nearby context to avoid false positives.
5. Use Git diffs/history **only if already available through read-only
   project tools**, to help identify suspicious rewrites; lack of Git history
   is not itself an issue. Never infer the original intended code solely
   from a strange-looking line.
6. For efficiency, review representative file content and search hits in
   batches, then inspect suspicious locations and their immediate consumers
   more closely. Do not repeatedly reread unchanged files or perform
   unrelated SEO/structure/format/design audits. **Do not claim complete
   line-by-line coverage unless it actually occurred.**
7. Produce the report defined below. Do not modify, reformat, rename,
   delete or repair anything, even if the fix seems obvious.

## Evidence and limits

- Distinguish **confirmed syntactic/text anomalies**, **suspected
  corruption**, and **unverified risks**. A visually odd line is not proof
  that PowerShell or Codex caused it.
- Legitimate accents, multilingual content, emoji, escaped strings,
  intentional fixtures and Tailwind classes are not automatically corrupt.
- Reading displayed text alone cannot reliably establish invalid UTF-8 bytes,
  BOM presence, binary damage or executable correctness. Do not claim such
  checks passed without appropriate evidence; label them **NOT VERIFIED**.
- This is an AI review, not a replacement for `php -l`, a JS parser, runtime
  testing or strict byte-level encoding validation. These checks are outside
  this command's no-script/no-command scope.

## Report output

- Coverage: files and directories reviewed, file types, exclusions, number
  actually inspected, and whether inspection was sampled or complete.
- Findings: severity, confidence, exact `path:line` when known, short excerpt,
  why it appears corrupted, potential impact and suggested *manual* repair.
- Separate **confirmed**, **suspected** and **not verified** findings.
- If nothing suspicious is found, say **"No visible corruption found in
  reviewed files"**, not that the project is proven corruption-free.
- Keep the result concise; expand only for high-severity issues.

Read `references/integrity-checks.md` when evaluating ambiguous findings.
Root `AGENTS.md` still governs token-efficiency and project conventions.
