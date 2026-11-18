---
name: website-test-report
description: >-
  Run an explicit, read-only website quality review and return a
  scored report from 1 to 10 with actionable issues and locations.
  Never modify project files or automatically fix any finding.
---

# Manual read-only code-quality report

- This is explicitly opt-in and **read-only**: never edit, repair, format, sync or regenerate anything.
- Inspect the relevant files and report evidenced issues with file/line, impact and suggested fix.
- Provide a transparent overall 1–10 score and note unknown/unverified checks.
- Never run this automatically during `$website-workflow`.
- Read `references/full-instructions.md` when this report is invoked to preserve its complete scoring/output requirements; read only applicable project sources.

## Progressive disclosure

The full previous operational instructions are retained in
`references/full-instructions.md`. Consult **relevant sections** when
needed; for report/formatter invocations, read all necessary audit or
formatting criteria before executing. Do not read unrelated skills.

Root `AGENTS.md` is authoritative for the common invariants.
