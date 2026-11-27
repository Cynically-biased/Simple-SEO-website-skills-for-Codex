---
name: php-website-development
description: >-
  Build and maintain mobile-first, SEO-friendly vanilla PHP websites using
  this project's original template, Tailwind CSS, partials, forms, and
  conventions. Use for page creation, PHP/Tailwind work, and repository
  setup.
---


## Shared architecture consistency — mandatory

For PHP website projects, **read root `WEBSITE_ARCHITECTURE.md` before applying this skill** to site structure, PHP pages, partials, handlers, naming, Tailwind assets, routing, integrations or relevant tests. Use the original reference documents under `references/original-template/` as supporting details. **This contract overrides conflicting archived examples** (old PHP 7.4, custom CSS, `@apply`, old handler filenames, dynamic PHP sitemaps, generic page layouts). Preserve the current project's architecture for unrelated work; no automatic migrations. Check relevant generated or assessed results against this contract and disclose unresolved conflicts or unavailable verification. This requirement applies to audit/report skills too; report commands remain read-only and change no files.

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

## Adaptive testing and security (V2 — authoritative)
During development, discover actual features, trust boundaries, data, deployment and risks; apply relevant prevention and verify changed behavior and affected dependencies. Read `SECURITY_TESTING_POLICY.md` for sensitive work or testing. No speculative infrastructure, automatic full audits, mandatory external tools or creative restrictions. Existing tests may run as necessary; create a focused regression test for a reproducible bug when practical and within the requested development scope. Never change production state. Quality-first overrides artificial inspection or test budgets, not authorization or command boundaries.
Graphify is optional: use direct source reads, read-only terminal commands and Git if unavailable. No mandatory scripts or execution-policy bypass. Report blocked checks rather than abandoning unrelated checks. Report-only commands never modify project files; test-create and test-suite may create/update tests and isolated fixtures/config only, not application code. Dependency installs, deployments, real external effects and production active testing require separate authorization. Never print secrets in reports.

## Architecture-specific responsibility

Follow the canonical page skeleton and header metadata variables directly. Default to `partials/_header.php`, `partials/_footer.php`, `public/js/main.js` and isolated POST-Redirect-GET handlers; add extra folders only when needed.
