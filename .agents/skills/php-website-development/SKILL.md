---
name: php-website-development
description: >-
  Build and maintain mobile-first, SEO-friendly vanilla PHP websites using
  this project's original template, Tailwind CSS, partials, forms, and
  conventions. Use for page creation, PHP/Tailwind work, and repository
  setup.
---

<!-- Design guidance: website-creative-design defines creative direction on
new site/redesign tasks. PHP architecture determines implementation, not the
visual palette, layout or editorial composition. Existing designs are
preserved for routine fixes. -->

# PHP/Tailwind implementation

- Implement the requested PHP feature without changing unrelated pages.
- Keep ordinary page markup/text in PHP; extract reusable arrays only when helpful.
- Use focused `handlers/`, distinct enums for fixed-choice domains, selective `components/` and footer partial.
- Use Tailwind classes only; no custom CSS or `@apply`. Follow root `AGENTS.md`.
- For forms/security, PHP compatibility and source formatting, consult relevant sections of `references/full-instructions.md`.

## Progressive disclosure

The full previous operational instructions are retained in
`references/full-instructions.md`. Consult **relevant sections** when
needed; for report/formatter invocations, read all necessary audit or
formatting criteria before executing. Do not read unrelated skills.

Root `AGENTS.md` is authoritative for the common invariants.

## File names (mandatory)

- Use logical, descriptive filenames reflecting actual purpose.
- Public PHP website pages are unprefixed; non-page PHP files in `data/`,
  `components/`, `handlers/`, `enums/` and `partials/` start with `_`.
- Read root `FILE_NAMING.md` when creating new files; do not auto-rename
  existing ones or break includes, URLs, routing or autoloading.

## Quality-first precedence

Quality-first policy: efficiency is a preference, never a quality or scope cap. Expand source inspection, load additional applicable references, revisit earlier decisions, rewrite necessary code, and choose batch sizes as needed for correctness, completeness and maintainability. Perform relevant authorized, non-destructive verification; separate report commands remain manual-only. Creative design has no artificial exploration, variant, complexity, batch or token budget. Preserve user scope, branding requirements, strict Tailwind-only styling, PHP conventions, security, accessibility and permissions. Do not bypass platform limits or require external tools. Explicit standard/deep/full/visibility audit modes remain distinct; disclose incomplete coverage and never treat unverified checks as passing.
