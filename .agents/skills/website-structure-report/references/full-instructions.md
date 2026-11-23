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

## Strict Tailwind-only architecture policy

- When proposing a structure, recommend Tailwind utilities for styling.
- Do not propose custom CSS stylesheets, `@apply`, or inline CSS.
- A minimal Tailwind entry file and compiled build artifact may exist.
- This report is read-only; never migrate styles during a review.


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

## Mandatory file-naming conformance (read-only)

- Read root `FILE_NAMING.md` for conventions and exceptions. Examine routes,
  web server config, entry points, and references to distinguish public PHP
  pages from implementation PHP files. Never infer routing from a prefix alone.
- Flag vague names like `new.php`, `thing.php`, `test2.php`, and ambiguous
  backups, unless the project's real semantics clearly justify them.
- Website pages (`index.php`, `about.php`, `contact.php`) must not begin with
  `_`; non-page PHP in handlers, components, partials, data, enums and
  helpers must begin with `_`, including nested files.
- Verify declarations and references remain logical even if class names differ
  from filenames (e.g., `enums/_ServiceType.php` defines `ServiceType`).
- Include exact offending file paths, the reason, proposed names, confidence,
  and rename blast radius (includes, autoload maps, routes, links, tests).
- Do not rename, relocate, or edit anything during this report. If there is a
  framework/autoloader convention that conflicts with `_` prefixes, document
  the conflict; never recommend a silently breaking rename.
- Treat existing legacy names as an audit finding, not an automatic fix.

## Required architecture conformance checks (explicit)

Inspect the **relevant existing** pages, form markup, handlers,
components and PHP data files. Use targeted searches and Graphify
relationships; verify each finding directly in the source. Apply
project `AGENTS.md` and `CONTENT_ARCHITECTURE.md` consistently.

1. **Enums:** For each fixed-choice `<select>`, radio group or
   multi-choice checkbox group, identify the choice domain. In a PHP
   8.1+ project, verify a corresponding backed PHP enum under
   `enums/` with one domain per descriptively named file. Multiple
   *different* choice domains require different files; identical
   domains across forms should reuse one enum. Flag unrelated enums
   packed into one file, duplicated choice definitions, mismatched
   options, and hardcoded choice lists when an enum should be used.
   Do not recommend enums for free text or ordinary boolean inputs.
   Verify runtime compatibility before suggesting enum syntax.
2. **Option rendering and validation:** Verify form options come from
   the corresponding enum `::cases()` (or a source derived from it),
   and handlers use `::tryFrom()` or equally safe exhaustive backed
   enum validation. For checkbox arrays, validate **each** submitted
   value; report unchecked, unknown or malformed values when found.
   Distinguish code evidence from behavior requiring runtime tests.
3. **Handlers:** Check that submission processing, HTTP method
   checks, input validation, CSRF protection, output/redirect handling,
   and POST-Redirect-GET where appropriate belong in focused
   `handlers/` PHP files rather than mixed into display templates.
   Assess separation of responsibilities without requiring a handler
   for a website that has no submitted forms.
4. **Components:** Check reusable or substantial UI fragments under
   `components/` (shared layout partials may remain under
   `partials/`). Flag materially duplicated markup where extraction
   simplifies maintenance; do **not** demand components for every
   small piece of one-off HTML. Keep styling as Tailwind utilities.
5. **Data:** Check substantial/reused list-like datasets and repeated
   arrays for appropriate dedicated `data/*.php` files returning PHP
   arrays. Organize by meaningful dataset or category, not every
   value. Flag duplicated data and hard-to-maintain collections,
   while keeping ordinary page copy, SEO text and HTML inside pages.
   Never recommend JSON content extraction or a universal loader.
6. **Footer:** Keep footer markup and content in its PHP footer
   partial rather than extracting it into centralized data arrays.
7. **References:** When recommending splits, check require/include
   paths, enum loading, namespaces/autoloading, handler links, form
   names, shared components and PHP version. Note cross-file risks.
8. **Applicability:** New projects follow these conventions when the
   relevant feature exists. For existing websites, identify legacy
   inconsistencies as recommendations; do not imply the report itself
   authorizes a migration. Do not penalize intentionally absent
   folders or small one-off arrays/components.

For the report, include an **Architecture rules checklist** with rows
`Rule | Status (Pass/Issue/N/A/Unverified) | Evidence (file:line) |
Recommendation`. Include enums (separate files), option generation,
server validation, handlers, components, PHP data arrays, footer and
Tailwind. Record `N/A` where the feature is absent; `Unverified` if
inspection evidence is insufficient. Never assert compliance without
checking the relevant source. Tie confirmed issues to the normal
1–10 structure score only once each, avoiding double penalties.

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

### Architecture rules checklist

Show the required conformance checklist above before proposals.

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

## Quality-first precedence

Quality-first policy: efficiency is a preference, never a quality or scope cap. Expand source inspection, load additional applicable references, revisit earlier decisions, rewrite necessary code, and choose batch sizes as needed for correctness, completeness and maintainability. Perform relevant authorized, non-destructive verification; separate report commands remain manual-only. Creative design has no artificial exploration, variant, complexity, batch or token budget. Preserve user scope, branding requirements, strict Tailwind-only styling, PHP conventions, security, accessibility and permissions. Do not bypass platform limits or require external tools. Explicit standard/deep/full/visibility audit modes remain distinct; disclose incomplete coverage and never treat unverified checks as passing.
