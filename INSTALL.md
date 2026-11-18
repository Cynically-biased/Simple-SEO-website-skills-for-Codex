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

## Main commands

Development (no automatic tests):

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
