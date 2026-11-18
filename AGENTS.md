# Codex project rules — concise entry point

## Scope and token-efficient execution

- Follow the user's requested task; do not run unrelated reviews or build extras.
- Classify tasks as new-site, targeted edit, CSS migration, large refactor,
  formatting, or manual audit before deciding what context to load.
- Prefer narrow searches, minimal diffs, and existing context. Do not dump
  entire directories or rewrite unchanged files to save analysis effort.
- Read only the relevant `SKILL.md`; follow its links to detailed references
  only for the specific work being performed. Do not preload every skill.
- For a new/empty project, skip Graphify indexing until meaningful source
  exists. For existing projects, use the current graph only when dependency
  relationships materially help; verify against source if stale.
- After meaningful changed-code batches, sync affected graph data if supported;
  never start watchers or full reindexes automatically.
- Keep summaries concise: changed files, important checks, unresolved items.

## Mandatory site conventions

- Styling: **Tailwind utility classes only**. Zero custom CSS, inline styles,
  `<style>` tags or `@apply`. Keep any required Tailwind entry point minimal;
  do not edit generated CSS. Do not silently migrate legacy styles.
- Sitemap: a **real static `/sitemap.xml`**, never `sitemap.php` or a PHP
  endpoint. Include canonical, indexable URLs and maintain meaningful,
  truthful `<lastmod>` values where supported. Reference from `robots.txt`.
- Keep ordinary PHP page text, metadata and HTML on the page. Extract only
  beneficial, repeated/editable arrays into focused `data/*.php` files;
  **never** establish a JSON content architecture. Keep footer in its partial.
- For PHP 8.1+ fixed-choice form fields, use distinct backed enum files in
  `enums/`, one per choice domain; generate UI choices from enum cases and
  validate submitted values via enum parsing in `handlers/`.
- Put form processing, input validation, CSRF protection and redirects in
  focused handlers. Use `components/` only for genuine reuse/complexity.
- Preserve semantics and readable physical source lines (prefer <=88 chars,
  practical maximum 100). Do not reformat unrelated code.

## Explicit command boundaries

- `$website-workflow`: develop/change site; task-scoped, batched edits.
- `$website-test-report`, `$website-seo-report`, `$website-structure-report`:
  **opt-in, read-only**. Never run these automatically or fix findings.
- `$website-cleanup-report`: **opt-in, read-only**. Identify possible unused
  files, folders, code, assets and dependencies; never delete or modify.
- `$website-format-code`: **opt-in**, formatting-only; `--check` is read-only.
  Never refactor architecture or alter runtime behavior during formatting.

## Detailed references (read only when relevant)

- `CONTENT_ARCHITECTURE.md`: PHP arrays, enums, handlers and components.
- `DEVELOPMENT_EFFICIENCY.md`: batching, work types and Graphify sync.
- `GRAPHIFY.md`, `GRAPHIFY_EFFICIENCY.md`, `GRAPHIFY_SYNC.md`:
  consult only when Graphify operations are actually needed.
- The invoked skill's `references/full-instructions.md` contains its
  complete prior detailed rules. Read targeted sections when needed.
- `references/AGENTS-full-previous.md` preserves earlier expanded rules
  for reference; this concise AGENTS.md takes precedence for routing.
