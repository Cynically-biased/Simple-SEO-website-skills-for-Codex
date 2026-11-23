---
name: website-workflow
description: >-
  Master workflow for building and changing PHP websites.
  Apply development and SEO standards, starting with Graphify.
  Perform appropriate non-destructive verification.
  Dedicated audit reports are explicit and read-only.
  Use when asked to build or change a site or apply the complete
  development workflow. For audits use website-test-report or website-seo-report.
---

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
- Do not run test, SEO, architecture, cleanup unless
  separately requested.
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
