# Install and use the complete Codex website workflow

## Install in your project

1. Extract the ZIP file.
2. Copy `AGENTS.md` into the project root. If one already exists,
   merge the new instructions instead of overwriting it.
3. Copy the **entire** `.agents/` folder into the project root,
   including its `skills/` subfolders and all `references/`.
4. Optionally copy `.vscode/settings.json` for a visible 88-column
   guide. It is not needed for source-code formatting.
5. Install the **official Graphify Codex skill** using the steps
   below (the ZIP includes the integration guidance, not the Python
   Graphify executable).
6. Restart Codex and open this project.

## Install Graphify on Windows (PowerShell)

Graphify is a separate Python CLI and official Codex skill. Installing
this ZIP alone does **not** install Graphify itself. The package adds
an integration that invokes the official skill automatically.

1. Check `uv` (install if needed):

```powershell
uv --version
winget install astral-sh.uv
```

Only run `winget` if `uv` is missing. Restart PowerShell if needed.

2. Install Python 3.12, then Graphify (the same procedure used on
   Windows to avoid building Tree-sitter locally):

```powershell
uv python install 3.12
uv tool install graphifyy --python 3.12
uv tool update-shell
```

If it is already installed, skip the install or use `uv tool upgrade
 graphifyy` when you intentionally want to upgrade.

3. Open a **new** PowerShell window and verify:

```powershell
graphify --help
```

If `graphify` isn't found in the current shell, run:

```powershell
$env:PATH = "$env:USERPROFILE\.local\bin;$env:PATH"
graphify --help
```

Or run the executable directly:

```powershell
& "$env:USERPROFILE\.local\bin\graphify.exe" --help
```

4. Navigate to the website project (use **its real path**):

```powershell
cd "C:\path\to\your-website"
```

5. Register the official **project-scoped** Graphify skill for Codex:

```powershell
graphify install --project --platform codex
```

This should create `.agents/skills/graphify/SKILL.md` and any shipped
reference files. It may also add Graphify instructions to `AGENTS.md`.
**Keep both instruction sets**: merge them if one overwrites the other.
Do not replace the `AGENTS.md` containing your website workflow.

6. Restart Codex. Verify that both `$graphify` and
   `$website-workflow` can be discovered in this project. Then invoke:

```text
$website-workflow
Build/update my website following all project standards.
```

The workflow checks Graphify for existing reusable codebase context
first, then develops the site. It does not rebuild the graph
automatically on every command. **It does not run automatic tests**.

For Graphify by itself, invoke `$graphify` in Codex. For separate
quality, SEO or formatter checks, use their own manual commands.

Official instructions:
https://github.com/Graphify-Labs/graphify

### Graphify notes

- Graphify is local codebase graphing, not a code-review engine.
- Running it can create `graphify-out/` and graph report files.
  Check the official documentation and repository `.gitignore`
  before committing generated artifacts.
- The official Graphify installer must run on the actual project,
  because its skill may include version-specific references.
- If the official install changes files unexpectedly, review the
  diff and reconcile it before proceeding.
- Optional parallel Graphify extraction for Codex may require
  an additional Codex feature setting. It is not required merely
  to run the core skill.

## Unrestricted creative design

`$website-workflow` automatically applies `$website-creative-design` for design
work. No artificial creative budget, concept count, prescribed aesthetic or
page batch limit. Necessary design changes take priority over usage savings.
Strict Tailwind-only and PHP standards remain. No visual-audit skill is included.


## Main commands

Development (relevant safe verification; audits manual):

```text
$website-workflow
```

Manual quality review (scored 1–10, read-only):

```text
$website-test-report
```

Manual SEO audit (scored 1–10, read-only):

```text
$website-seo-report
```

Existing code formatting (on demand, formatting edits only):

```text
$website-format-code
```

Find formatting issues without editing anything:

```text
$website-format-code --check
```

**Neither report command changes any files.** It reports
confirmed issues, suggested fixes and which checks could not run.

## Development command

Type this in the Codex chat:

```text
$website-workflow
```

Or add a task:

```text
$website-workflow
Build the requested pages, apply the relevant SEO and security
requirements, without running tests or automatically fixing issues.
```

The master skill first invokes the official Graphify skill and
then applies the standards from the development skills.
The root `AGENTS.md` also instructs Codex to follow them by
**default**, including when you do not type the command.

## Confirm installation

Ask Codex:

```text
Read AGENTS.md and the website-workflow skill. Confirm that
the original seven website skills and their references are present.
Also confirm the official graphify skill is installed separately.
List the workflow and formatting rules. Do not modify files.
```

## Project folder layout

```text
project/
├── AGENTS.md
├── .agents/
│   └── skills/
│       ├── graphify/           (official installer adds this)
│       │   └── SKILL.md
│       ├── website-workflow/
│       │   └── SKILL.md
│       ├── website-test-report/
│       │   └── SKILL.md
│       ├── website-seo-report/
│       │   └── SKILL.md
│       ├── website-format-code/
│       │   └── SKILL.md
│       ├── php-website-development/
│       │   ├── SKILL.md
│       │   └── references/
│       ├── website-integrations-seo/
│       │   ├── SKILL.md
│       │   └── references/
│       └── website-testing-aftercare/
│           ├── SKILL.md
│           └── references/
└── .vscode/  (optional)
```

## Source-code formatting (not editor wrapping)

The updated `AGENTS.md` and all five existing skills plus the SEO report skill require Codex to
insert **real newline characters into the code it writes**.
It must aim for 88 characters per line (100 when practical),
including multiline HTML attributes, Tailwind class lists,
PHP statements and JavaScript expressions.

This works with any code editor and does **not** require `.vscode`.
The optional VS Code ruler only shows the target width; it does
not hide or visually wrap long lines.

To verify, ask Codex:

```text
$website-workflow
Check that the source files you changed have actual line breaks.
Fix safely breakable lines over 100 characters. Do not enable
word wrap as a substitute, and do not reformat unrelated files.
```

## Important

The original content and examples in the reference documents
remain included. The master skill coordinates development without automatic tests;
it does not remove or replace any of their requirements.

## Run a scored quality review when you choose

Open the project in Codex and send:

```text
$website-test-report
Review my entire project. Give a quality score from 1 to 10,
list confirmed bugs with file/line locations and fixes to make.
Do not edit or fix any files.
```

The score is an evidence-based estimate for inspected code,
not proof of security or production readiness. Checks requiring
write access or unavailable environments are reported as NOT RUN.

## SEO report command

Open a project in Codex and type:

```text
$website-seo-report

Audit the project for search engine SEO, report a quality
score from 1 to 10 and prioritize improvements. Do not
modify any files or automatically fix issues.
```

This command checks available source evidence and clearly
labels live Google indexing, ranking and Search Console data
that cannot be verified. It never runs after ordinary coding.

## Reformat existing code only when requested

Send Codex:

```text
$website-format-code

Scan my current source files for long physical lines and
unreadable code layout. Safely reformat existing source
without changing behavior, and list any lines left unfixed.
Do not run tests, audits or auto-fix logic.
```

To preview issues without modifying code, use:

```text
$website-format-code --check
```

The skill does **not** run after every code edit.


## Manual website structure review

After the official Graphify Codex skill is installed for this
project, restart Codex and run:

```text
$website-structure-report
```

The report explains the current project folders and file
responsibilities, finds organization concerns, gives a scored
1–10 assessment, and proposes a safer directory layout with a
migration plan. It **never edits or moves files**.

Graphify is also consulted during the following **manual** tasks:

```text
$website-test-report
$website-seo-report
$website-format-code --check
$website-format-code
```

The first three commands above are read-only. Normal formatting
may edit only source formatting. These commands reuse existing
Graphify graph data when available; a read-only report does not
silently generate/refresh an index on disk. If Graphify cannot be
used, Codex should inspect the project directly and say so.

### Confirm the Graphify installation

From PowerShell, inside the project folder:

```powershell
graphify --help
graphify install --project --platform codex
```

Run the second command only if the official project skill has
not already been installed. If `graphify` is not found, try a
new PowerShell window after `uv tool update-shell`.

The official Graphify install may touch `AGENTS.md`; preserve
this package's instructions by merging changes if needed.

## Graphify-first, token-efficient mode

All website commands follow `GRAPHIFY_EFFICIENCY.md`:

1. Find the official Graphify skill in the project.
2. Reuse an existing relevant graph rather than rebuilding it.
3. Run scoped graph queries and inspect only relevant source.
4. Avoid duplicate scans and full graph output.
5. For read-only audits and formatter `--check`, do not create or
   update graph files. Report missing or stale graph information.
6. Ask before a costly full-project scan not explicitly requested.

Graphify is an optimization aid, not a guaranteed reduction in
Codex usage. A complete audit may still need wider inspection.

To check the instructions without editing code, ask Codex:

```text
Read AGENTS.md and GRAPHIFY_EFFICIENCY.md. Explain how
$website-workflow, $website-test-report, $website-seo-report,
$website-structure-report and $website-format-code reuse Graphify.
Do not change any files.
```


## Synchronize Graphify after changes (new)

`$website-workflow` and `$website-format-code` now follow
`GRAPHIFY_SYNC.md` after authorized code edits. They batch edits,
refresh only relevant changed graph data using the official
Graphify skill's supported incremental procedure, and report
whether the graph is current, stale, or unavailable.

The official Graphify skill documents an incremental `--update`
workflow. Invoke it through Codex as part of the editing task,
using the instructions shipped with your installed version:

```text
$website-workflow
Update the requested website feature. After editing, use the
installed Graphify skill to incrementally synchronize changed
files. Do not run tests or SEO audits.
```

Do **not** assume this package runs a persistent Windows watcher.
This is instruction-driven synchronization within an active Codex
editing task, not an external filesystem service. For continuous
watching outside Codex, consult the official Graphify documentation
and install its optional watcher support separately if desired.

Read-only commands (`$website-test-report`,
`$website-seo-report`, `$website-structure-report`, and
`$website-format-code --check`) must never update the graph.
If it is stale, they inspect current source and disclose this.

Graphify's actual update feature depends on the installed version,
project indexing state, available permissions, and supported files.
The source code remains authoritative.

## Strict Tailwind CSS policy

This package enforces **Tailwind utilities only** in `AGENTS.md` and
the relevant skills. Codex must not write custom CSS, `<style>` blocks,
inline `style` attributes, `@apply`, or custom styling classes. Only
a minimal Tailwind source entrypoint and compiled CSS output may exist.
Compiled output is generated by the Tailwind build, never edited.
The existing full reference files are preserved as source material,
but the strict root policy takes precedence over their old exceptions.

When using a pre-existing site with handwritten CSS, Codex should
report it instead of silently rewriting unrelated files. A separate,
authorized migration task is needed to convert legacy CSS to Tailwind.

## Quality-first efficiency

Efficiency is a preference, not a cap. Expand inspection, refactoring and safe
verification as needed. Avoid only redundant or unrelated work. Dedicated
report commands stay manual-only and read-only. See `DEVELOPMENT_EFFICIENCY.md`
and `TOKEN_EFFICIENT_MODE_V2.md` for the updated policy.


## Static XML sitemap requirement

This project mandates a **real `sitemap.xml` file** in the
website root. The SEO and website workflow skills never create
`sitemap.php` or rewrite `/sitemap.xml` to a PHP endpoint.
When adding or changing indexable pages, keep this XML file
accurate; the manual SEO report checks for violations.

The detailed original SEO reference is preserved in the archive.
Its optional dynamic PHP sitemap example is overridden by the
new mandatory policy in `AGENTS.md` and the active skills.

## Advanced SEO audit

To run the extended, read-only Google search visibility audit:

```text
$website-seo-report
```

The skill reads its bundled
`.agents/skills/website-seo-report/references/advanced-seo-audit.md`.
It checks the static XML sitemap, optional but accurate
`<lastmod>` values, titles, descriptions, snippet candidates,
indexability and relevant technical SEO signals. It reports
issues and suggested wording but makes no edits.


## Selective PHP arrays for new websites

- Include `CONTENT_ARCHITECTURE.md` in the project root.
- Keep normal page copy, SEO metadata and markup in PHP page files.
- Only extract repeated or substantial editable lists into focused
  PHP files such as `data/_services.php` and `data/_faqs.php`.
- Do not create website content JSON files or universal JSON loaders.
- Keep footer content in `partials/_footer.php`.
- Existing sites are not migrated unless the user asks.
- See `CONTENT_ARCHITECTURE.md` for examples and security rules.

## Form enums and reusable components

Fixed-choice form fields use separate PHP 8.1+ string-backed enums under
`enums/` (one file per distinct choice set). Form controls derive their
options from `cases()`, and handlers validate submissions with
`tryFrom()`; validate each multi-select entry. Reuse components only where
helpful; ordinary page HTML stays in its page. See `AGENTS.md` and
`CONTENT_ARCHITECTURE.md`.

## Architecture-aware manual commands

After installing, `$website-structure-report` explicitly checks
PHP enum-per-choice-domain separation and form validation, handlers,
components, modular PHP data arrays and the footer exception. It
only reports findings; it never fixes them. `$website-format-code`
formats files in all these folders without refactoring their
structure, and `$website-format-code --check` makes no edits.
Neither command runs automatically.


## Quality-first efficiency

Efficiency is a preference, not a cap. Expand inspection, refactoring and safe
verification as needed. Avoid only redundant or unrelated work. Dedicated
report commands stay manual-only and read-only. See `DEVELOPMENT_EFFICIENCY.md`
and `TOKEN_EFFICIENT_MODE_V2.md` for the updated policy.


## New on-demand cleanup command

After installing the complete `.agents/skills/` folder and restarting Codex,
run `$website-cleanup-report` to inspect potentially unused files, folders,
code, assets and dependencies. It is **read-only**: nothing is deleted or
modified. Review its evidence and approve any subsequent cleanup separately.

## Logical file naming (new)

- Give every new file a descriptive, responsibility-based name.
- Public PHP pages use names like `contact.php` without a leading `_`.
- Non-page PHP files use a leading `_`: `handlers/_contact-submit.php`,
  `components/_service-card.php`, `enums/_ServiceType.php`,
  `data/_services.php`. See `FILE_NAMING.md`.
- The structure report checks naming issues; the cleanup report does not
  assume badly named files are unused; the formatter never renames files.
- Existing project files are **not** renamed automatically.

## Naming enforcement

Keep `FILE_NAMING.md` in the project root along with `AGENTS.md`, and install
`.agents/skills/website-naming-fix/` with the other project skills. Restart
Codex to discover the command. The development workflow automatically checks
new/touched filenames, but does not rename unrelated files. To migrate an
existing website, invoke `$website-naming-fix --check` (read-only) and then
`$website-naming-fix` (safe fixes, blocked risks reported).

## SEO audit commands (optional, never automatic)

- `$website-seo-report` — efficient source and available local render checks.
- `$website-seo-report --full` — deep rendered/live checks when authorized.
- `$website-seo-report --visibility` — actual search data when connected or
  supplied; otherwise an evidence-gap report.

SEO modes are strictly read-only. Source code alone cannot verify rankings,
indexation, measured performance or displayed Google snippets.


## Cleanup Report V2 commands

`$website-cleanup-report` = targeted and efficient cleanup review.

`$website-cleanup-report --deep` = broader review of actively referenced but
unnecessary code, duplicate behavior and overengineered architecture.

Both commands are optional, read-only, and never delete or rewrite code.

## Manual AI source integrity review

Run `$website-integrity-report` in Codex chat after installation. It asks
Codex to read first-party project files and investigate suspected damage from
PowerShell rewrites, accidental character encoding changes, broken line
breaks, malformed text, conflicts or incomplete source. **No PowerShell
script, scanner, executable, software installation or execution-policy change
is required.** It is read-only and reports the files actually inspected.
Byte-level encoding validity and parser/runtime correctness remain unverified
by this AI-only review.

## Reliability update

Codex may read source with read-only terminal commands. No change to Windows execution policy is needed. See `SKILL_RELIABILITY_UPDATE.md`.

## SEO URL and architecture enhancements (V3)

Use the existing `$website-seo-report`, `--full` or `--visibility` commands.
No additional plugins, commands or scripts are needed. The SEO audit now
checks public route inventories, navigation and internal link discoverability,
canonical/sitemap/redirect consistency, and rendered PHP output when it can
be verified. The local standard mode remains efficient and read-only;
`--full` only accesses authorized rendered/live environments.
Read `website-seo-report/references/seo-url-architecture-v3.md` for scope
and evidence requirements. Keep your existing static `sitemap.xml` policy.
