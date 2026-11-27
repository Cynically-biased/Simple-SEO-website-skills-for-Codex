---
name: website-testing-aftercare
description: >-
  Manually diagnose and test PHP websites only when explicitly asked.
  Use for navigation bugs,
  forms, clean URLs, styling, SEO, schema validation, PHP/session errors,
  accessibility issues and responsive regression testing.
---


## Shared architecture consistency — mandatory

For PHP website projects, **read root `WEBSITE_ARCHITECTURE.md` before applying this skill** to site structure, PHP pages, partials, handlers, naming, Tailwind assets, routing, integrations or relevant tests. Use the original reference documents under `references/original-template/` as supporting details. **This contract overrides conflicting archived examples** (old PHP 7.4, custom CSS, `@apply`, old handler filenames, dynamic PHP sitemaps, generic page layouts). Preserve the current project's architecture for unrelated work; no automatic migrations. Check relevant generated or assessed results against this contract and disclose unresolved conflicts or unavailable verification. This requirement applies to audit/report skills too; report commands remain read-only and change no files.

# Manual diagnostic/aftercare guidance

- Activate only on an explicit testing or aftercare request; no automatic testing.
- Diagnose only the supplied symptoms and related files; be evidence-based.
- Do not introduce custom CSS, inline styles or unrelated changes.
- Read `references/full-instructions.md` for relevant diagnostic procedures and `references/testing-full.md` only for needed original detail.

## Progressive disclosure

The full previous operational instructions are retained in
`references/full-instructions.md`. Consult **relevant sections** when
needed; for report/formatter invocations, read all necessary audit or
formatting criteria before executing. Do not read unrelated skills.

Root `AGENTS.md` is authoritative for the common invariants.

## Quality-first precedence

Quality-first policy: efficiency is a preference, never a quality or scope cap. Expand source inspection, load additional applicable references, revisit earlier decisions, rewrite necessary code, and choose batch sizes as needed for correctness, completeness and maintainability. Perform relevant authorized, non-destructive verification; separate report commands remain manual-only. Creative design has no artificial exploration, variant, complexity, batch or token budget. Preserve user scope, branding requirements, strict Tailwind-only styling, PHP conventions, security, accessibility and permissions. Do not bypass platform limits or require external tools. Explicit standard/deep/full/visibility audit modes remain distinct; disclose incomplete coverage and never treat unverified checks as passing.

## Adaptive testing and security (V2 — authoritative)
During development, discover actual features, trust boundaries, data, deployment and risks; apply relevant prevention and verify changed behavior and affected dependencies. Read `SECURITY_TESTING_POLICY.md` for sensitive work or testing. No speculative infrastructure, automatic full audits, mandatory external tools or creative restrictions. Existing tests may run as necessary; create a focused regression test for a reproducible bug when practical and within the requested development scope. Never change production state. Quality-first overrides artificial inspection or test budgets, not authorization or command boundaries.
Graphify is optional: use direct source reads, read-only terminal commands and Git if unavailable. No mandatory scripts or execution-policy bypass. Report blocked checks rather than abandoning unrelated checks. Report-only commands never modify project files; test-create and test-suite may create/update tests and isolated fixtures/config only, not application code. Dependency installs, deployments, real external effects and production active testing require separate authorization. Never print secrets in reports.

## Architecture-specific responsibility

Use original `references/original-template/TESTING.md` for navigation/form/routing/SEO/mobile aftercare, translating legacy CSS examples to Tailwind; never use production debug display or live email tests without authorization.
