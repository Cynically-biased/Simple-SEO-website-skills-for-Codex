---
name: website-structure-report
description: >-
  On-demand, read-only review of website folders, files,
  source-code responsibilities and dependency structure.
  Use Graphify when available, score maintainability from
  1 to 10, and recommend a safer project organization.
  Never move, rename or modify files.
---


## Shared architecture consistency — mandatory

For PHP website projects, **read root `WEBSITE_ARCHITECTURE.md` before applying this skill** to site structure, PHP pages, partials, handlers, naming, Tailwind assets, routing, integrations or relevant tests. Use the original reference documents under `references/original-template/` as supporting details. **This contract overrides conflicting archived examples** (old PHP 7.4, custom CSS, `@apply`, old handler filenames, dynamic PHP sitemaps, generic page layouts). Preserve the current project's architecture for unrelated work; no automatic migrations. Check relevant generated or assessed results against this contract and disclose unresolved conflicts or unavailable verification. This requirement applies to audit/report skills too; report commands remain read-only and change no files.

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

## Quality-first precedence

Quality-first policy: efficiency is a preference, never a quality or scope cap. Expand source inspection, load additional applicable references, revisit earlier decisions, rewrite necessary code, and choose batch sizes as needed for correctness, completeness and maintainability. Perform relevant authorized, non-destructive verification; separate report commands remain manual-only. Creative design has no artificial exploration, variant, complexity, batch or token budget. Preserve user scope, branding requirements, strict Tailwind-only styling, PHP conventions, security, accessibility and permissions. Do not bypass platform limits or require external tools. Explicit standard/deep/full/visibility audit modes remain distinct; disclose incomplete coverage and never treat unverified checks as passing.

## Adaptive security integration
Check public/private separation and hosting access risks; underscore prefix is not access control. Consult root SECURITY_TESTING_POLICY.md as relevant; preserve command boundaries.

## Architecture-specific responsibility

For a relevant architecture audit, explicitly evaluate page/header/footer metadata contract, mandatory directory purposes, `__DIR__` paths, optional folders, Tailwind entry/output and live routing. Evidence-based, read-only.
