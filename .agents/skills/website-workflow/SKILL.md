---
name: website-workflow
description: >-
  Master workflow for building and changing PHP websites.
  Apply development, adaptive security and SEO standards; Graphify optional.
  Perform appropriate non-destructive verification.
  Dedicated audit reports are explicit and read-only.
  Use when asked to build or change a site or apply the complete
  development workflow. For audits use website-test-report or website-seo-report.
---


## Shared architecture consistency — mandatory

For PHP website projects, **read root `WEBSITE_ARCHITECTURE.md` before applying this skill** to site structure, PHP pages, partials, handlers, naming, Tailwind assets, routing, integrations or relevant tests. Use the original reference documents under `references/original-template/` as supporting details. **This contract overrides conflicting archived examples** (old PHP 7.4, custom CSS, `@apply`, old handler filenames, dynamic PHP sitemaps, generic page layouts). Preserve the current project's architecture for unrelated work; no automatic migrations. Check relevant generated or assessed results against this contract and disclose unresolved conflicts or unavailable verification. This requirement applies to audit/report skills too; report commands remain read-only and change no files.

# Build/change website

- Categorize the request: new site, existing targeted edit, Tailwind migration, or large refactor.
- For new sites, pages and redesigns, consult `website-creative-design/SKILL.md`.
  Explore freely without artificial budgets, direction counts or batch limits.
  Preserve the design for unrelated routine edits. Skip empty-project indexing.
- Inspect as much relevant source and dependencies as necessary; use Graphify
  when helpful. Expand scope of inspection, revisit files and rewrite code when
  needed for quality. Choose sensible batch sizes; no mandatory page-by-page cap.
- Preserve strict Tailwind-only rules; real `sitemap.xml`; PHP arrays/enums/handlers/components conventions in root `AGENTS.md`.
- For created/modified public routes, keep URL slugs, internal links,
  canonicals, redirects and static sitemap consistent; avoid unrelated URL
  migrations. Internal PHP filenames are not automatically public URLs.
  Consult the focused SEO URL reference only for routing/SEO tasks.
- **Mandatory naming gate for every created or renamed file**: before writing,
  classify the file as a public PHP page/route versus non-page implementation;
  choose a descriptive responsibility-based name. Public page PHP filenames
  are unprefixed; **all new non-page PHP filenames start with `_`**, including
  handlers, enums, components, data arrays, includes and partials.
- Before completing the task, check **only created/renamed/touched filenames**
  for naming compliance, plus any changed references; fix safe naming mistakes
  within that task. Never silently rename unrelated pre-existing files.
- Consult root `FILE_NAMING.md` for exceptions (routes, autoloading,
  deployment). If an essential filename conflicts with the convention, report
  the conflict and avoid breaking it; do not invent a workaround.
- Do **not** automatically invoke `$website-naming-fix` or its project-wide
  scan. That command is available when the user explicitly requests a
  naming migration; routine development remains task-scoped.
- Do not automatically invoke full test-suite, security, SEO, architecture or cleanup audits. Relevant task verification is required.
- Run all relevant authorized verification, including broader tests when needed; no unsolicited audit reports.
- Read `DEVELOPMENT_EFFICIENCY.md` only when a task requires batching/migration details.
- Read `CONTENT_ARCHITECTURE.md` when implementing arrays, handlers, enums or components.
- Read the relevant section of `references/full-instructions.md` for detailed implementation or standards, not the entire file by default.

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

On newly created PHP pages enforce `$page_title`, `$meta_description`, optional `$schema_json`, the exact shared header/footer contract and safe `__DIR__` includes. Check this structure before finishing. On project edits use the same contract without restructuring unrelated files.
