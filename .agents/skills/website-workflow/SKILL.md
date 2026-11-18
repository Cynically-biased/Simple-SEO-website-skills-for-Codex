---
name: website-workflow
description: >-
  Master workflow for building and changing PHP websites.
  Apply development and SEO standards, starting with Graphify.
  Do not run tests automatically.
  Testing is an explicit, separate read-only skill.
  Use when asked to build or change a site or apply the complete
  development workflow. For audits use website-test-report or website-seo-report.
---

# Build/change website

- Categorize the request: new site, existing targeted edit, Tailwind migration, or large refactor.
- For a new site, implement the requested page/component first; skip empty-project Graphify.
- For an existing site, inspect only relevant files and dependencies; use Graphify when useful and current.
- For large tasks, batch by shared component or page, track completed units, make minimal diffs and avoid revisiting finished sections.
- Preserve strict Tailwind-only rules; real `sitemap.xml`; PHP arrays/enums/handlers/components conventions in root `AGENTS.md`.
- Do not run test, SEO, architecture or cleanup reports unless separately requested.
- Use targeted local checks, no automatic full project audit.
- Read `DEVELOPMENT_EFFICIENCY.md` only when a task requires batching/migration details.
- Read `CONTENT_ARCHITECTURE.md` when implementing arrays, handlers, enums or components.
- Read the relevant section of `references/full-instructions.md` for detailed implementation or standards, not the entire file by default.

## Progressive disclosure

The full previous operational instructions are retained in
`references/full-instructions.md`. Consult **relevant sections** when
needed; for report/formatter invocations, read all necessary audit or
formatting criteria before executing. Do not read unrelated skills.

Root `AGENTS.md` is authoritative for the common invariants.
