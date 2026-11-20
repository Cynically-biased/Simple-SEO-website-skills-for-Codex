---
name: website-format-code
description: >-
  On-demand formatting-only scan and repair of existing website
  source files. Find and safely fix overly long physical lines,
  indentation, and readability issues without changing behavior.
  Never run automatically; do not run tests or SEO audits.
---

# Format existing website code on demand

## Strict styling preservation

- The project uses Tailwind utilities exclusively: do not create CSS,
  inline styles, `@apply`, or custom CSS classes while formatting.
- This formatter is formatting-only. Do not silently migrate legacy CSS
  to Tailwind, remove third-party CSS, or alter a site's appearance.
- Report existing non-Tailwind styling violations as out of scope;
  change them only if the user explicitly requests a separate migration.
- Apply the strict Tailwind policy in root `AGENTS.md` to any code
  formatting you perform. Keep generated CSS untouched.


Run only when the user explicitly invokes `$website-format-code`
(or clearly requests an equivalent project-wide reformat).
This is a formatting *repair* skill, not a development skill.

## Required behavior

1. Inspect the repository and identify human-edited website source:
   PHP, HTML, CSS, JS/TS, Vue/JSX where present, and Tailwind markup.
2. Find physical source lines exceeding 100 characters and prefer
   88-character lines where valid. Also identify inconsistent
   indentation, huge single-line tags, and unreadable class lists.
3. Safely **edit only formatting** of affected existing source
   files: insert actual newline characters and indentation at
   syntactically safe boundaries. Avoid unnecessary rewrites.
4. Keep every Tailwind utility in its original order. Split long
   class attributes at whitespace only when HTML semantics and
   rendering are preserved. Use multiline attributes as needed.
5. For PHP, JS/TS and CSS, split arrays, arguments, object literals,
   chained expressions, selectors and declarations at valid
   syntax boundaries. Preserve working line endings when possible.
6. Keep a list of all affected file paths, numbers of lines
   repaired, and any overlong lines that cannot safely be split.
7. Summarize the formatting changes. Do not give a code quality
   score, a testing report, or an SEO audit.

## Explicit formatting coverage for project architecture

Treat the following as human-edited PHP source and include them within
requested scan scope (unless excluded by the user):

- `enums/*.php`: format backed enum case declarations, methods,
  attributes and readable line breaks without changing case names,
  backed values, order, namespacing or enum semantics.
- `handlers/*.php`: format request parsing, method checks, CSRF,
  validation, `::tryFrom()` usage, redirects and function calls
  without changing control flow, security behavior or responses.
- `components/*.php` and `partials/*.php`: format PHP/HTML boundaries,
  long attributes and Tailwind class lists safely, preserving markup,
  rendering and component interfaces.
- `data/**/*.php`: format nested arrays, keyed entries, arguments and
  indentation without changing keys, values, order, return types or
  paths. Single small arrays in pages are equally valid.
- PHP pages/templates: keep ordinary copy and HTML in the page;
  only fix whitespace/line breaks and preserve escaped output.

The formatter **does not enforce architecture by modifying it**.
Do not extract inline arrays, create/remove enum or handler files,
replace hardcoded form choices, consolidate components, move footer
content, change PHP versions or split a file into multiple files.
If structural violations are spotted, list them briefly as
**out-of-scope architecture findings** and recommend the read-only
`$website-structure-report`; do not silently repair them. The
formatting report must distinguish formatting problems from
structural problems. Keep edits narrowly scoped to changed files.

For `$website-format-code --check`, inspect these same source categories
and report formatting only with **no writes whatsoever**, including
no Graphify refresh or formatting configuration changes.

## Hard safety boundaries

- **Never** change app logic, expression meaning, conditions,
  variable names, dependencies, imports, configuration values,
  copy, behavior, or styles solely to shorten source lines.
- Do not rewrite or reflow string literals, multiline text,
  template literals, encoded payloads, SQL, regular expressions,
  URLs, integrity hashes, or whitespace-sensitive content unless
  it is demonstrably semantics-preserving.
- Exclude generated/minified files, vendor/, node_modules/,
  .git/, dist/, build/, cache files, and lock files by default.
- Do not reformat README, Markdown, binary/image assets, or
  unrelated non-source files unless the user explicitly asks.
- Respect existing formatter configuration if present; do not
  install new tools or use formatters that change semantics.
- Do not run unrelated tests, browser audits, servers, scoring or deployment.
  After a formatting edit, **allow focused, non-mutating syntax verification**
  on files that changed (e.g. `php -l path/to/file.php`, `node --check
  path/to/file.js` when supported). Do not run autofix linters, wide tests,
  build pipelines, or tools that generate project artifacts. Skip verification
  if unavailable and state that it was not run. `--check` remains read-only.
- Do not stage, commit, push, or publish files.
- If a line cannot safely be split, **leave it unchanged** and
  report its file and line number rather than risking breakage.
- Preserve existing uncommitted user changes and do not replace
  files from templates.

## Completion report

Use this structure:

### Formatting summary
- Files scanned: N
- Files reformatted: N
- Long lines safely corrected: N
- Remaining overlong lines: N

### Reformatted files
- `path/to/file.php`: affected lines and type of formatting

### Lines left unchanged
- `path/to/file.php:123`: reason a safe line break was not possible

### Out-of-scope architecture observations (if any)

List suspected enum/handler/component/data organizational problems
without changing them, or state none observed. For a complete
architecture audit, request `$website-structure-report`.

### Notes
- Only layout/whitespace formatting changed.
- No full tests or SEO audits were run; list any targeted, read-only syntax checks and results.
- If unable to safely guarantee a change is formatting-only,
  restore the affected part and report it as unchanged.

## Optional scan-only mode

When the user says `$website-format-code check only` or
`$website-format-code --check`, list violations and suggested
formatting edits **without writing any files**. This is an
option of the same command, not automatic testing.

## Graphify-first targeted inspection

Follow `../../../GRAPHIFY_EFFICIENCY.md` and the official installed
`$graphify` skill. Reuse an existing relevant graph, query only
likely affected files and verify results against current source.
Avoid repeated queries and whole-project code dumps.

`--check` must not write anything. Normal formatting can edit
formatting in selected source files only. After authorized edits,
follow `../../../GRAPHIFY_SYNC.md` to synchronize affected graph
information once if supported and permitted; this is not a code
change or automatic test. `--check` never refreshes Graphify.
Use targeted source inspection if the graph is unavailable.
