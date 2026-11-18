---
name: website-structure-report
description: >-
  On-demand, read-only review of website folders, files,
  source-code responsibilities and dependency structure.
  Use Graphify when available, score maintainability from
  1 to 10, and recommend a safer project organization.
  Never move, rename or modify files.
---

# Website structure report (read-only)

Run only when asked with `$website-structure-report` or when the
user explicitly requests a website architecture/structure review.
This is an advisory report, not an automatic refactoring step.

## Graphify-first, bounded inspection

Follow `../../../GRAPHIFY_EFFICIENCY.md` and read the installed
`$graphify` skill. Reuse a sufficiently current graph and query
folder/file relations, callers, routes and shared components only
as relevant. Confirm findings against current source.

This report is strictly read-only: do not build or refresh indexes.
If Graphify is missing or stale, inspect targeted files, identify
coverage gaps and avoid pretending to have a complete graph.
Only propose structure changes; never apply them.

## Examine project organization and contents

- Inventory meaningful top-level folders and major files; explain
  each folder's purpose from actual code and configuration.
- Inspect entry points, pages, routing, PHP includes/partials,
  handlers, forms, CSS/Tailwind, JS, assets, configuration,
  schemas, and any build tools actually present.
- Map duplicated responsibilities, oversized files, tight
  coupling, circular dependencies, scattered shared logic,
  dead or unclear files, inconsistent naming, and mixed concerns.
- Identify files that are sensibly organized; avoid needless moves.
- Inspect references affected by prospective moves: PHP paths,
  web URLs, imports, stylesheet/script paths, .htaccess, sitemap,
  asset links, tests, deployments, CI and hosting conventions.
- Respect the existing PHP and Tailwind guidelines, actual
  project architecture, and relevant AGENTS.md instructions.
- Distinguish verified issues, tentative risks, and preferences.
- Do not assume a large framework or MVC rewrite is required.

## Scoring

Give a 1.0-10.0 **structure/maintainability** score, not a claim
about runtime correctness, performance, security, or SEO.

Start at 10.0 and deduct only confirmed, distinct issues:

- Critical: -2.5 (e.g., organization that prevents safe maintenance).
- High: -1.2 (e.g., pervasive duplicated tightly coupled code).
- Medium: -0.5 (e.g., inconsistent modular boundaries).
- Low: -0.2 (e.g., minor naming inconsistencies).

Clamp to 1.0-10.0 and show deductions. Never penalize features
that are not applicable. If inspection is too limited for a
credible score, mark it **Provisional** or **Unavailable**.

## Required report

### Website structure review

- **Score:** X.X/10, provisional, or unavailable
- **Scope:** inspected files and directories
- **Graphify:** used / unavailable / stale, with evidence
- **Files changed:** none

### Current file map

Show a concise tree of the actual relevant project structure
and describe the responsibilities and important relationships.

### Findings

Use a table: Severity | File:line | Evidence | Why it matters |
Recommended organization. Do not invent line numbers.

### Proposed improved structure

Show a concrete example directory tree tailored to this project.
Map existing files to proposed locations and give a reason for
important changes. Mark optional suggestions as optional.

### Safe migration order

Describe ordered steps for future implementation, expected
reference updates, possible breakages, and checks needed afterward.
This is **advice only**; do not perform the migration.

### Unverified items and score calculation

List unavailable checks or insufficient evidence and show scores.

## Strict non-modification rules

- Never edit, move, delete, rename, reformat, generate, commit,
  deploy, or change project files while producing this report.
- Never invoke testing, SEO audits, linters, formatters, servers,
  or write-producing commands just for this report.
- Do not install or update Graphify or its dependencies.
- If a tool needs a new on-disk graph/index, do not run it without
  separate user authorization; report the limitation instead.
- Recommend changes in prose only, not applied patches.
