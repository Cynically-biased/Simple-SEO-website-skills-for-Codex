# Codex Website Skills — Graphify-First Workflow

A reusable set of Codex skills for developing, reviewing and maintaining
PHP websites with **strict Tailwind-only styling**, JavaScript, SEO,
and structured code.

The package uses **Graphify-first project inspection** where the official
Graphify skill is available. It aims to avoid repeated full-codebase reads,
but does **not guarantee token savings** or prevent every coding mistake.

## Commands

Use these commands in the **Codex chat**, not in PowerShell.

| Command | Purpose | Changes project source? |
| --- | --- | --- |
| `$website-workflow` | Develop and modify websites | Yes, when requested |
| `$website-test-report` | Quality review with a 1–10 score | No |
| `$website-seo-report` | SEO review with a 1–10 score | No |
| `$website-structure-report` | Folder/code architecture review | No |
| `$website-format-code` | Reformat existing source code | Yes, formatting only |
| `$website-format-code --check` | Report formatting problems | No |

The test, SEO and structure reports are **on-demand**, not automatically
run after development. They identify confirmed findings, provide evidence
and recommend changes without applying fixes.

## What is included

- **PHP website development:** vanilla PHP, Tailwind CSS, HTML,
  JavaScript, shared partials, forms, responsive design and security.
- **SEO and integrations:** metadata, Google Analytics 4,
  Search Console, XML sitemaps, robots.txt, Schema.org and privacy.
- **Website testing and aftercare:** forms, mobile navigation,
  responsive layouts, server issues, accessibility and handoff checks.
- **Code formatting:** source-level line breaks and indentation;
  aim for 88 characters per line without changing behavior.
- **Graphify guidance:** targeted graph queries, reuse of existing
  analysis and synchronization after authorized source changes.
- **Original reference materials:** detailed source documentation
  retained inside the relevant skills' `references/` directories.

The package has eight website skills under `.agents/skills/`.
**Graphify itself is a separate official installation** and is not
bundled in this repository.

## Installation in a website project

1. Download or clone this repository.
2. Copy `AGENTS.md`, the complete `.agents/` directory and the
   `GRAPHIFY*.md` guidance files into your website project's root.
3. If the website already has an `AGENTS.md`, **merge** its instructions
   instead of overwriting existing project rules.
4. Optionally copy `.vscode/settings.json` to display an
   88-column guideline in VS Code. Actual code formatting is
   controlled by the skills, not by editor word wrap.
5. Install the official Graphify skill in the website project
   using the steps below.
6. Restart Codex and open the website project directory.

See [INSTALL.md](INSTALL.md) for the full instructions.

### Install Graphify on Windows

Prerequisites: PowerShell and `uv`. If `uv` is not installed:

```powershell
winget install astral-sh.uv
```

Then install Graphify using Python 3.12:

```powershell
uv python install 3.12
uv tool install graphifyy --python 3.12
uv tool update-shell
```

Open a **new PowerShell window** and check:

```powershell
graphify --help
```

If PowerShell cannot find it in the current window:

```powershell
$env:PATH = "$env:USERPROFILE\.local\bin;$env:PATH"
graphify --help
```

From the **website project's directory**, register the official
Graphify Codex skill:

```powershell
graphify install --project --platform codex
```

The installer may write its own skill and instructions. Preserve
the website workflow's `AGENTS.md` rules when merging changes.

Graphify documentation:
[Graphify on GitHub](https://github.com/Graphify-Labs/graphify)

## Usage examples

Start or continue a website project:

```text
$website-workflow
Build a responsive services page using the project standards.
```

Request a code-quality report (no fixes):

```text
$website-test-report
Review the project, score its quality from 1 to 10, and list issues.
```

Request a search-visibility audit (no fixes):

```text
$website-seo-report
Review Googlebot crawlability, indexing and on-page SEO.
```

Check organization and code relationships (no changes):

```text
$website-structure-report
Recommend improvements to the project folder and file structure.
```

Inspect formatting without modifying files:

```text
$website-format-code --check
```

Apply formatting-only source edits:

```text
$website-format-code
```

## Graphify synchronization and efficiency

The workflow first attempts to reuse a suitable existing code graph,
queries only relevant files and relationships, and checks findings
against actual source code.

After an **authorized source-edit batch**, it instructs Codex to use
the official Graphify workflow to update graph information if needed,
rather than rebuild everything after every small edit.

- Read-only audit commands do not refresh indexes or change source.
- No persistent background watcher is started automatically.
- If Graphify is unavailable, Codex must disclose the fallback.
- If synchronization fails, the graph must be treated as potentially
  stale until verified or updated.
- These are **instructions to Codex**, not a guaranteed background
  synchronization service or guaranteed token-usage reduction.

See [GRAPHIFY.md](GRAPHIFY.md),
[GRAPHIFY_EFFICIENCY.md](GRAPHIFY_EFFICIENCY.md) and
[GRAPHIFY_SYNC.md](GRAPHIFY_SYNC.md).

## Suggested repository structure

```text
.
├── .agents/
│   └── skills/
│       ├── php-website-development/
│       ├── website-integrations-seo/
│       ├── website-testing-aftercare/
│       ├── website-workflow/
│       ├── website-test-report/
│       ├── website-seo-report/
│       ├── website-structure-report/
│       └── website-format-code/
├── .vscode/
│   └── settings.json
├── AGENTS.md
├── GRAPHIFY.md
├── GRAPHIFY_EFFICIENCY.md
├── GRAPHIFY_SYNC.md
├── INSTALL.md
└── README.md
```

## Important limitations

- A score is an evidence-based review, not proof that code is safe
  or that a website will rank highly in Google.
- Actual Graphify integration and incremental updates must be
  verified in the target Codex project.
- The PHP website conventions come from the supplied template.
  Adapt them when a project's actual framework or requirements differ.
- Review before committing private client information or secrets.

## Tailwind-only styling (strict)

**No custom CSS is permitted for new or modified styling:** no `<style>`
blocks, inline CSS, custom selectors/classes, `@apply`, handwritten
media queries or alternative CSS frameworks. Use Tailwind utilities
directly in markup. A minimal Tailwind entry file and generated
Tailwind output are allowed; never manually edit build output.

Legacy source documentation is retained unchanged, but this stricter
policy takes precedence over its older custom-CSS exceptions.

## Automatic Token-Efficient Development Mode

`$website-workflow` automatically selects a development approach:

- **New project:** skip unnecessary Graphify analysis and build
  requested features in small batches.
- **Existing project:** reuse the graph and read relevant files.
- **Tailwind migration:** convert shared components first and
  then individual pages, without repeatedly rewriting finished
  pages or introducing custom CSS.
- **Large refactor:** split work by dependency boundaries.

It avoids repeated source reads and unnecessary Graphify rebuilds,
but **does not guarantee lower Codex usage**. Manual tests and
SEO/structure reports remain opt-in.

See [DEVELOPMENT_EFFICIENCY.md](DEVELOPMENT_EFFICIENCY.md).

## Sitemap policy (mandatory)

All projects must use a **real, UTF-8 `sitemap.xml` file** at
the site root. Never use `sitemap.php` or a route/rewrite that
generates a sitemap dynamically with PHP. Update the XML file
when indexable pages change. The `$website-seo-report` command
checks this requirement without editing the project.
