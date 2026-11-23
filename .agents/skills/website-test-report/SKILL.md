---
name: website-test-report
description: >-
  Run an explicit, read-only website quality review and return a
  scored report from 1 to 10 with actionable issues and locations.
  Never modify project files or automatically fix any finding.
---

# Manual read-only code-quality report

- This is explicitly opt-in and **read-only**: never edit, repair, format, sync or regenerate anything.
- Inspect relevant files (or all eligible first-party files for an explicit project-wide audit); report coverage and evidenced issues with file/line, impact and suggested fix.
- Permit safe, authorized non-mutating lint/tests and isolated temporary artifacts outside the project; never change application or production state.
- Provide a transparent overall 1–10 score and note unknown/unverified checks.
- Never run this automatically during `$website-workflow`.
- Read `references/full-instructions.md` when this report is invoked to preserve its complete scoring/output requirements; read only applicable project sources.

## Progressive disclosure

The full previous operational instructions are retained in
`references/full-instructions.md`. Consult **relevant sections** when
needed; for report/formatter invocations, read all necessary audit or
formatting criteria before executing. Do not read unrelated skills.

Root `AGENTS.md` is authoritative for the common invariants.

## Quality-first precedence

Quality-first policy: efficiency is a preference, never a quality or scope cap. Expand source inspection, load additional applicable references, revisit earlier decisions, rewrite necessary code, and choose batch sizes as needed for correctness, completeness and maintainability. Perform relevant authorized, non-destructive verification; separate report commands remain manual-only. Creative design has no artificial exploration, variant, complexity, batch or token budget. Preserve user scope, branding requirements, strict Tailwind-only styling, PHP conventions, security, accessibility and permissions. Do not bypass platform limits or require external tools. Explicit standard/deep/full/visibility audit modes remain distinct; disclose incomplete coverage and never treat unverified checks as passing.
