---
name: website-format-code
description: >-
  On-demand formatting-only scan and repair of existing website
  source files. Find and safely fix overly long physical lines,
  indentation, and readability issues without changing behavior.
  Never run automatically; do not run tests or SEO audits.
---

# Manual formatting-only edits or read-only --check

- Only run when explicitly requested. `--check` reports findings without edits.
- Format PHP pages, handlers, enums, components, partials and `data/*.php` arrays safely.
- Prefer physical lines <=88 characters (100 maximum where practical), clean indentation and whitespace.
- Never change behavior, symbols, enum choices, file layout, filenames, Tailwind styling or architecture. Do not perform a CSS migration.
- Do not add/remove `_` filename prefixes or update imports/includes; filename
  convention problems belong in `$website-structure-report`, not formatting.
- Make minimal formatting diffs and avoid unrelated files; no automatic audits.
- After edits, allow only targeted, non-mutating PHP/JS syntax checks on changed files when available; no autofix or broad tests.
- Read `references/full-instructions.md` when invoked for detailed safety checks and supported formatting patterns.

## Progressive disclosure

The full previous operational instructions are retained in
`references/full-instructions.md`. Consult **relevant sections** when
needed; for report/formatter invocations, read all necessary audit or
formatting criteria before executing. Do not read unrelated skills.

Root `AGENTS.md` is authoritative for the common invariants.
