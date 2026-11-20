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
- For a new site, establish one distinctive, brand-appropriate creative
  direction (expressive by default) then implement the requested page/component;
  skip empty-project Graphify. Consult `website-creative-design/SKILL.md`
  for new page design or explicitly requested redesigns, but do not load it
  for unrelated code fixes, formatting or audits.
- On existing-site routine edits, preserve current layout, colors and theme.
  For an explicit redesign, allow necessary cross-file layout and component
  changes inside the requested scope; minimal-diff rules must not degrade
  requested design quality. Do not produce multiple full design concepts by
  default or invoke visual audits/browser checks automatically.
- For an existing site, inspect only relevant files and dependencies; use Graphify when useful and current.
- For large tasks, batch by shared component or page, track completed units, make minimal diffs and avoid revisiting finished sections.
- Preserve strict Tailwind-only rules; real `sitemap.xml`; PHP arrays/enums/handlers/components conventions in root `AGENTS.md`.
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
