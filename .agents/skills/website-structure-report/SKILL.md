---
name: website-structure-report
description: >-
  On-demand, read-only review of website folders, files,
  source-code responsibilities and dependency structure.
  Use Graphify when available, score maintainability from
  1 to 10, and recommend a safer project organization.
  Never move, rename or modify files.
---

# Manual read-only architecture report

- This is explicitly opt-in and **read-only**: never move/create/refactor files.
- Check handlers, per-domain backed enum files and usage/validation, selective components, beneficial `data/*.php` arrays, footer partial ownership and Tailwind-only styling.
- Audit filename clarity and the `_` prefix on every non-page PHP file;
  page route files stay unprefixed. Classify entry points from routing before
  flagging names; report evidence and potential rename impact only.
  Mention `$website-naming-fix --check` for focused verification or
  `$website-naming-fix` for an explicitly requested safe fix; do not invoke it.
- Identify concrete violations with file/line evidence, applicable/not-applicable statuses and a 1–10 score.
- Read `references/full-instructions.md` when invoked for the complete checklist and report format; inspect only necessary project files.

## Progressive disclosure

The full previous operational instructions are retained in
`references/full-instructions.md`. Consult **relevant sections** when
needed; for report/formatter invocations, read all necessary audit or
formatting criteria before executing. Do not read unrelated skills.

Root `AGENTS.md` is authoritative for the common invariants.
