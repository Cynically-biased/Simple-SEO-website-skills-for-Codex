## Visual QA V3: PowerShell / Codex CLI (no plugin)

`$website-design-report` uses an installed **Microsoft Edge or Google Chrome**
headlessly from the Windows terminal. It does **not** depend on the Codex
desktop browser, Computer Use, Playwright, Selenium or an added skill/plugin.

The skill uses direct headless Edge/Chrome commands from `.agents/skills/website-design-report/references/cli-headless-execution.md` rather than a `.ps1` script.
Codex discovers a safe local website preview, captures at most three distinct
page templates at mobile-width and desktop widths by default, and visually
reviews screenshots **only if the CLI session has image-reading support**.
If no installed browser or image inspection is available, it marks visual
checks unverified, rather than inventing results.

```text
$website-design-report
$website-design-report --deep
$website-design-report --regression
```

A local PHP server must be available or safe to start; screenshot captures use
temporary Windows files outside the project. `--deep` and `--regression` keep
their existing capabilities subject to terminal browser limitations (basic
headless screenshots alone do not exercise complex interactive states).
All audits remain manual-only, read-only for project files and token-bounded.

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
| `$website-seo-report` | Efficient source-based SEO audit; provisional 1–10 score with coverage | No |
| `$website-seo-report --full` | Rendered and live technical SEO verification when accessible | No |
| `$website-seo-report --visibility` | Observed Search Console/Bing visibility and optional competitor evidence | No |
| `$website-design-report` | Efficient visual/theme consistency audit of representative pages | No |
| `$website-design-report --deep` | Expanded page, viewport, interaction and journey audit | No |
| `$website-design-report --regression` | Compare changed pages with approved screenshots when available | No |
| `$website-structure-report` | Folder/code architecture review | No |
| `$website-cleanup-report` | Efficient unused **and used-but-unnecessary** code audit | No |
| `$website-cleanup-report --deep` | Deeper referenced-code and architecture necessity review | No |
| `$website-naming-fix --check` | Audit naming and underscore rules | No |
| `$website-naming-fix` | Safely rename noncompliant files and update references | Yes, safe renames only |
| `$website-integrity-report` | AI review for suspicious code corruption, rewrite damage and symbols | No |
| `$website-format-code` | Reformat existing source code | Yes, formatting only |
| `$website-format-code --check` | Report formatting problems | No |

The test, SEO, structure, cleanup and design reports are **on-demand**,
not automatically run after development. They identify confirmed findings, provide evidence
and recommend changes without applying fixes.

## What is included

- **PHP website development:** vanilla PHP, Tailwind CSS, HTML,
  JavaScript, shared partials, forms, responsive design and security.
- **SEO and integrations:** metadata, Google Analytics 4,
  Search Console, XML sitemaps, robots.txt, Schema.org and privacy.
- **Website testing and aftercare:** forms, mobile navigation,
  responsive layouts, server issues, accessibility and handoff checks.
- **Visual Design QA:** optional rendered-page theme consistency, image and
  content fit, visual defects, responsive behavior and regression checks.
- **Code formatting:** source-level line breaks and indentation;
  aim for 88 characters per line without changing behavior.
- **Graphify guidance:** targeted graph queries, reuse of existing
  analysis and synchronization after authorized source changes.
- **Original reference materials:** detailed source documentation
  retained inside the relevant skills' `references/` directories.

The package has twelve website skills under `.agents/skills/`.
**Graphify itself is a separate official installation** and is not
bundled in this repository.

## Website integrity report (AI-led, manual, read-only)

Run `$website-integrity-report` in **Codex chat** to ask the agent to inspect
first-party project source files for suspicious corruption introduced by
PowerShell rewrites, text encoding mistakes, copy/paste, or AI code changes.
It looks for mangled symbols, visible mojibake, accidental literal escape
sequences, broken strings or tags, suspicious cut-off blocks, merge markers
and unexpected changes in referenced code.

**No bundled PowerShell scanner is used.** The agent reads source through
Codex file tools or read-only terminal commands (`Get-Content`, `Select-String`,
Git history) without changing the project. The report lists what was inspected and any gaps; it cannot prove
byte-level encoding validity or runtime syntax correctness without verified byte-level or parser evidence. No files are
modified or repaired.

```text
$website-integrity-report
```

## Skill reliability fixes

- Integrity: when the file-reading UI fails, inspect source using permitted
  read-only terminal commands; never rely on index references alone.
- Visual QA: use direct headless Edge/Chrome terminal commands rather than a
  `.ps1` file, avoiding Windows script execution-policy blocks.
- Format: permit focused read-only PHP/JS syntax verification after edits.
- Test: permit safe authorized isolated tests with temporary artifacts outside
  the repository, but no production side effects.
- Whole-project audits: enumerate all eligible files and disclose coverage.
- Historical examples never override current Tailwind, sitemap or PHP rules.

## Structure checks and formatting boundaries

`$website-structure-report` explicitly audits the architecture rules:
one PHP backed enum file per distinct fixed-choice field domain;
options and handler validation derived from enums; isolated form
handlers; selectively reused components; appropriate `data/*.php`
array files; and footer ownership. It reports evidence, applicability
and a 1–10 score, **without changing files**.

`$website-format-code` formats existing PHP enums, handlers,
components, partials, data arrays and pages safely. Its `--check`
variant is read-only. **Formatting never performs architectural
refactoring**, creates enums, or relocates code; use a separate
explicit development request for those changes. Both commands
remain opt-in and do not run automatically.

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

Run a visual theme and design-quality review (no fixes):

```text
$website-design-report
```

For an in-depth audit or approved-baseline comparison, use
`$website-design-report --deep` or `$website-design-report --regression`.
Both modes remain read-only; screenshots or browser access are necessary
for verified visual findings.

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
│       ├── website-cleanup-report/
│       ├── website-naming-fix/
│       ├── website-design-report/
│       └── website-format-code/
├── .vscode/
│   └── settings.json
├── AGENTS.md
├── GRAPHIFY.md
├── GRAPHIFY_EFFICIENCY.md
├── GRAPHIFY_SYNC.md
├── DESIGN_SYSTEM_TEMPLATE.md
├── FILE_NAMING.md
├── CONTENT_ARCHITECTURE.md
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

## Advanced SEO report (read-only)

Run `$website-seo-report` in Codex to request a deeper audit of
Google crawl/indexing signals, the physical `sitemap.xml`,
truthful `<lastmod>` metadata, page titles, meta descriptions,
search-result snippet candidates, content relevance, linking,
schema and mobile/performance signals. The report offers a
1–10 score with evidence, per-page suggestions, file locations
and verification limits; it **never changes website files**.

`<lastmod>` is optional, but should be accurate when used.
Google ignores sitemap `<priority>` and `<changefreq>`; this
audit does not reward them. Actual rankings, displayed Google
results and field performance cannot be guaranteed or inferred
solely from the codebase.


## Modular centralized website content

New websites follow [CONTENT_ARCHITECTURE.md](CONTENT_ARCHITECTURE.md).
Ordinary page content, markup and SEO metadata remain in the PHP page.
Only repeated or substantial editable arrays are moved into modular
PHP files such as `data/_services.php` or `data/_faqs.php` when helpful.
No JSON content files are required. Footer content stays in its
existing footer partial.

## Form enums and reusable components

Fixed-choice form fields use separate PHP 8.1+ string-backed enums under
`enums/` (one file per distinct choice set). Form controls derive their
options from `cases()`, and handlers validate submissions with
`tryFrom()`; validate each multi-select entry. Reuse components only where
helpful; ordinary page HTML stays in its page. See `AGENTS.md` and
`CONTENT_ARCHITECTURE.md`.


## Token-Efficient Mode V2

- Root `AGENTS.md` is now a concise rules index. Detailed earlier rules
  remain in `references/AGENTS-full-previous.md`.
- Core skills use concise `SKILL.md` entry points; its original full
  instructions remain under that skill's `references/full-instructions.md`.
- Codex should load only the relevant skill and on-demand reference sections.
- Development uses minimal-diff edits, targeted reads, conditional Graphify,
  small batches, relevant checks and short completion summaries.
- See `TOKEN_EFFICIENT_MODE_V2.md` for policy and caveats.
- All manual-only audit and format boundaries are unchanged.

## Logical file naming (new)

- Give every new file a descriptive, responsibility-based name.
- Public PHP pages use names like `contact.php` without a leading `_`.
- Non-page PHP files use a leading `_`: `handlers/_contact-submit.php`,
  `components/_service-card.php`, `enums/_ServiceType.php`,
  `data/_services.php`. See `FILE_NAMING.md`.
- The structure report checks naming issues; the cleanup report does not
  assume badly named files are unused; the formatter never renames files.
- Existing project files are **not** renamed automatically.

## Strict filename enforcement and repair

Every `$website-workflow` task now validates the names of newly created or
renamed files before completion. PHP page routes have descriptive unprefixed
names; PHP implementation files use a descriptive `_`-prefixed basename.

To inspect a whole existing project **without changing anything**:

```text
$website-naming-fix --check
```

To check and repair the whole first-party project **when safe**:

```text
$website-naming-fix
```

The fix command updates relevant file references and performs targeted
verification. Changes with uncertain routing, URLs, autoloading or deployment
impact are reported as blocked, **not renamed blindly**. No files are
deleted, and no unrelated formatting or architecture refactor is performed.
See `FILE_NAMING.md` for full rules.

## Three-mode SEO audit (manual, read-only)

The default SEO command examines local metadata, the physical XML sitemap,
content and important pages efficiently. `--full` adds rendered PHP and
live URLs, structured-data and optional performance checks where access
is available. `--visibility` uses authorized first-party search metrics,
with optional evidence-backed competitor research when requested. No mode
creates fixes or reports rankings without evidence. Every report states
page coverage, verification gaps and score confidence. See
`.agents/skills/website-seo-report/references/seo-audit-modes-v2.md`.


## Cleanup Report V2 (on demand only)

Run `$website-cleanup-report` for efficient detection across ten categories,
including referenced but unnecessary code, redundant functions, duplicate
functionality, excessive abstractions, dependency bloat, obsolete features,
pointless JavaScript, and unnecessary file splitting. Run
`$website-cleanup-report --deep` for more thorough behavior tracing and
architecture simplification analysis. Both are strictly read-only and require
file/line evidence, confidence, risk and manual verification recommendations.
Neither runs automatically during development.

## Visual Design QA (11th skill)

Run manually in Codex:

```text
$website-design-report
$website-design-report --deep
$website-design-report --regression
```

- Standard: efficient theme, visual flaw, content-image relevance, desktop/
  mobile and cross-page consistency check using representative pages.
- Deep: important routes, responsive states, interaction patterns, visual
  accessibility signals and key visitor journeys.
- Regression: changed routes vs **approved existing** matching screenshots.
  Without an approved baseline it reports **NOT COMPARABLE**, not an invented
  visual comparison.

All modes are **read-only, manual-only**. They do not edit files, capture/save
project screenshots, invoke auto-fixes, run unrelated audits or start expensive
whole-project scans. They require real rendered page/screenshot evidence for
confident visual judgments. If browser/screenshot access is unavailable, the
report labels checks NOT VERIFIED. `DESIGN_SYSTEM_TEMPLATE.md` is an optional
reference for a separately user-approved, project-specific `DESIGN_SYSTEM.md`.
The normal `$website-workflow` does only a lightweight changed-page design-fit
check, not the full design report. See the skill's `references/` for details.

## One-command Visual QA V2 — CLI headless browser first

Run `$website-design-report` without extra setup instructions. The skill
attempts to discover the existing PHP site/preview, uses Codex's **native
browser tools if they are actually available**, and otherwise checks existing
screenshots. If no reliable rendered evidence is accessible, it reports
`VISUAL NOT VERIFIED` rather than claiming to have inspected the appearance.

- **Default**: up to three representative page templates at mobile and
  desktop sizes; reuses available visual evidence and existing theme rules.
- **`--deep`**: more important routes, tablet layouts, interactions and
  visitor journeys, with stated coverage and limitations.
- **`--regression`**: changed pages/components against existing approved,
  comparable baselines; no invented before/after captures.
- **All modes**: manual-only, read-only for site source, no Windows desktop
  takeover, no external Playwright/plugin installation, concise findings with
  evidence and Tailwind-only suggestions.

CLI screenshot capture requires an installed Edge/Chrome browser and permission to run terminal commands. Actual visual evaluation also requires Codex CLI image inspection.
An in-app browser may be visible; the skill cannot make it invisibly run
headless or guarantee access to a Windows `localhost` from a cloud browser.
See `.agents/skills/website-design-report/references/cli-headless-execution.md`.
