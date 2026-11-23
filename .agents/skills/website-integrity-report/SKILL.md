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
2. Read **actual source content**, not merely search-index references. Prefer
   Codex file browsing and reading. If that interface is unavailable, use
   **read-only terminal commands** such as PowerShell `Get-Content -LiteralPath`,
   `Select-String`, `Get-ChildItem`, `git diff`, `git show`, `git grep`, or
   equivalent shell reads. Reading files in the terminal does **not** require
   enabling PowerShell script execution. Do not invoke bundled `.ps1` scanner
   scripts, change execution policies, install tools, or execute source files.
   If no legitimate source-reading method is available, report incomplete
   coverage and do not pretend the index alone proves code integrity.
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
5. Use Git diffs/history through read-only project tools **or read-only
   terminal commands**, to help identify suspicious rewrites; lack of Git history
   is not itself an issue. Never infer the original intended code solely
   from a strange-looking line.
6. For efficiency, enumerate every eligible first-party file, then use
   targeted searches and bounded reads to assess each one; inspect suspicious
   locations and immediate consumers more closely. For an explicit full-project
   command, do not silently sample and imply complete coverage: count eligible,
   inspected, excluded, inaccessible and sampled files separately. Do not repeatedly reread unchanged files or perform
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
- This is primarily an AI review, not a substitute for byte-level validation
  or runtime testing. Optional **non-mutating** `php -l` or `node --check`
  may corroborate a specific suspicious file when installed and authorized;
  avoid app execution and tools that write project artifacts. Report unrun
  parser/encoding checks as NOT VERIFIED.

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

## Quality-first precedence

Quality-first policy: efficiency is a preference, never a quality or scope cap. Expand source inspection, load additional applicable references, revisit earlier decisions, rewrite necessary code, and choose batch sizes as needed for correctness, completeness and maintainability. Perform relevant authorized, non-destructive verification; separate report commands remain manual-only. Creative design has no artificial exploration, variant, complexity, batch or token budget. Preserve user scope, branding requirements, strict Tailwind-only styling, PHP conventions, security, accessibility and permissions. Do not bypass platform limits or require external tools. Explicit standard/deep/full/visibility audit modes remain distinct; disclose incomplete coverage and never treat unverified checks as passing.
