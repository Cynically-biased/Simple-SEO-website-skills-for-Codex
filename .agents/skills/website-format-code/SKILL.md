---
name: website-format-code
description: >-
  On-demand formatting-only scan and repair of existing website
  source files. Find and safely fix overly long physical lines,
  indentation, and readability issues without changing behavior.
  Never run automatically; do not run tests or SEO audits.
---


## Shared architecture consistency — mandatory

For PHP website projects, **read root `WEBSITE_ARCHITECTURE.md` before applying this skill** to site structure, PHP pages, partials, handlers, naming, Tailwind assets, routing, integrations or relevant tests. Use the original reference documents under `references/original-template/` as supporting details. **This contract overrides conflicting archived examples** (old PHP 7.4, custom CSS, `@apply`, old handler filenames, dynamic PHP sitemaps, generic page layouts). Preserve the current project's architecture for unrelated work; no automatic migrations. Check relevant generated or assessed results against this contract and disclose unresolved conflicts or unavailable verification. This requirement applies to audit/report skills too; report commands remain read-only and change no files.

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

## Quality-first precedence

Quality-first policy: efficiency is a preference, never a quality or scope cap. Expand source inspection, load additional applicable references, revisit earlier decisions, rewrite necessary code, and choose batch sizes as needed for correctness, completeness and maintainability. Perform relevant authorized, non-destructive verification; separate report commands remain manual-only. Creative design has no artificial exploration, variant, complexity, batch or token budget. Preserve user scope, branding requirements, strict Tailwind-only styling, PHP conventions, security, accessibility and permissions. Do not bypass platform limits or require external tools. Explicit standard/deep/full/visibility audit modes remain distinct; disclose incomplete coverage and never treat unverified checks as passing.

## Architecture-specific responsibility

Respect established page skeleton, metadata variables, header/footer ownership and Tailwind utility markup. Do not convert pages into a different architecture when formatting.
