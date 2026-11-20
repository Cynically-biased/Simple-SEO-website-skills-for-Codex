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

## Creative freedom and design intent

- For new sites and user-requested redesigns, use **Creative Freedom V2**:
  design for the brand, audience and purpose instead of defaulting to a generic
  template. New sites default to an **expressive** visual direction; ordinary
  edits preserve the existing appearance unless a redesign is requested.
- Technical standards govern **implementation**, not permissible colors,
  layouts, typography, compositions or tasteful animations. For an explicitly
  requested redesign, necessary design changes take precedence over minimal
  diffs within the requested scope; avoid unrelated rewrites and extra concepts.
- `$website-workflow` uses `website-creative-design` guidance on design tasks.
  No automatic visual audit, browser control, image generation or third-party
  plugins. Read detailed creative references only when relevant.

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
- Name files for what they contain and do. PHP files that serve as website
  pages/routes use descriptive names without a prefix (`contact.php`).
  Every non-page PHP implementation file must start with `_`
  (`components/_service-card.php`, `handlers/_contact.php`,
  `enums/_ServiceType.php`, `data/_services.php`). In `$website-workflow`,
  classify and verify filenames for every new or
  renamed file before task completion; repair safe naming errors in the
  touched set, without scanning unrelated files. Never rename or
  reorganize existing files unless explicitly requested.
- Preserve semantics and readable physical source lines (prefer <=88 chars,
  practical maximum 100). Do not reformat unrelated code.

## Explicit command boundaries

- `$website-workflow`: develop/change site; task-scoped, batched edits.
- `$website-test-report`, `$website-seo-report`, `$website-structure-report`:
  **opt-in, read-only**. Never run these automatically or fix findings.
- `$website-seo-report` has default efficient, `--full` rendered/live, and
  `--visibility` search-data modes. Never silently run deep/live modes;
  report missing evidence instead of inventing verified search results.
- `$website-cleanup-report` and `--deep`: **opt-in, read-only**. Identify unused and referenced-but-unnecessary code; never auto-fix. Identify possible unused
  files, folders, code, assets and dependencies; never delete or modify.
- `$website-naming-fix`: **opt-in**, check and safely fix descriptive naming,
  page filenames versus `_`-prefixed non-page PHP. `--check` is read-only;
  never risk route/autoload/deployment breakage or rename uncertain files.
- `$website-integrity-report`: **opt-in, read-only** full-project source integrity scan. Have the AI review first-party source for suspicious PowerShell/rewrite damage, mangled symbols and broken code using native file reads or read-only terminal commands; no bundled scanner or automatic repair. State coverage limitations. No repairs or other audits.
- `$website-format-code`: **opt-in**, formatting-only; `--check` is read-only.
  Never refactor architecture or alter runtime behavior during formatting.

## Tool access, project-wide coverage and historical rules

- If the file-reading UI is unavailable, use authorized **read-only terminal**
  commands to inspect actual source (`Get-Content`, `Select-String`, `git diff`,
  `git show`, equivalents). Do not mistake PowerShell commands for executing
  blocked `.ps1` scripts. Never change execution policy or bypass permissions.
- Explicit full-project audits must enumerate eligible first-party files and
  disclose files inspected, skipped or excluded. Batch efficiently, but never
  silently replace a requested full scan with a small sample.
- After authorized formatter edits, focused non-mutating syntax verification
  (`php -l`, `node --check`) is allowed. Read-only test reports may run
  authorized isolated checks, with disposable artifacts outside the repository,
  if they do not modify production or project state.
- Historical reference examples may use old custom CSS, JSON content or PHP
  sitemap practices. Current root conventions supersede contradictory examples.

## Detailed references (read only when relevant)

- `CONTENT_ARCHITECTURE.md`: PHP arrays, enums, handlers and components.
- `FILE_NAMING.md`: descriptive filenames and `_` prefix for non-page PHP files.
- `DEVELOPMENT_EFFICIENCY.md`: batching, work types and Graphify sync.
- `GRAPHIFY.md`, `GRAPHIFY_EFFICIENCY.md`, `GRAPHIFY_SYNC.md`:
  consult only when Graphify operations are actually needed.
- The invoked skill's `references/full-instructions.md` contains its
  complete prior detailed rules. Read targeted sections when needed.
- `references/AGENTS-full-previous.md` preserves earlier expanded rules
  for reference; this concise AGENTS.md takes precedence for routing.
