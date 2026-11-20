---
name: website-test-report
description: >-
  Run an explicit, read-only website quality review and return a
  scored report from 1 to 10 with actionable issues and locations.
  Never modify project files or automatically fix any finding.
---

# Manual website testing and scoring

Invoke this skill only with `$website-test-report` or when the
user explicitly asks for this specific scored audit.

## Non-negotiable rules

- Never trigger this skill after ordinary coding tasks.
- Never edit, add, delete, reformat, stage, commit, or deploy files.
- Never run auto-fix tools (`--fix`, formatters, autofix linters).
- Do not generate or update snapshots, baselines or lockfiles.
- Prefer static, read-only inspection before running commands.
- Only execute tests that can safely be run without writing to
  the repository or changing application state.
- Some test runners write caches, reports or snapshots by default.
  Do not run those unless configured for provably read-only use.
- Never submit real forms, send email, alter databases, access
  production credentials or perform live destructive actions.
- If a check requires browser access, server startup, credentials or writes,
  determine whether a previously authorized **isolated, non-production** check
  can run without modifying project files or real app state. Temporary test
  artifacts may be placed outside the project when explicitly safe, isolated
  and disposable. Never run tests that submit real forms, email, payments or
  modify databases. Otherwise mark the check **NOT RUN** and explain why.
- Never claim to have run a test that was not executed.
- Report suggested fixes in text only; ask permission separately
  before any future repair, and do not apply repairs in this run.

## Reference material

Read when relevant:

- `../website-testing-aftercare/SKILL.md`
- `../website-testing-aftercare/references/testing-full.md`
- `../php-website-development/SKILL.md`
- `../website-integrations-seo/SKILL.md`
- `../website-integrations-seo/references/integrations-full.md`

Keep the source checklists intact. Check only features that exist
in the project, and distinguish unsupported from failing checks.

## Audit workflow

1. Identify the project scope, its entry points, language versions,
   routes, handlers, CSS, JavaScript and available test scripts.
2. Establish the requested scope: targeted by default; if the user explicitly
   asks for the entire project, enumerate all eligible first-party source and
   track inspected, excluded and not-verified files without silently sampling.
3. Inspect for PHP/JS bugs, unsafe output, user-input handling,
   forms, redirects, sessions, authentication, and error handling.
4. Assess navigation, responsive breakpoints, accessibility,
   performance basics, SEO metadata, sitemap, schema and privacy
   only where the code provides evidence.
5. Run safe, read-only checks only where possible. List the exact
   commands executed, including failures and unrun checks.
6. Record each verified issue with severity, file path, line(s),
   evidence, impact and a proposed fix **without changing code**.
7. Provide the score, the rubric breakdown and limitations.

## Score from 1 to 10

Start at **10.0** and deduct for confirmed, non-duplicate issues:

- Critical: -3.0 each (serious exploit or core feature unusable)
- High: -1.5 each (major functional or security defect)
- Medium: -0.7 each (meaningful flaw with limited impact)
- Low: -0.2 each (minor bug, accessibility or maintainability)

Clamp the final score to **1.0–10.0** and round to one decimal.
Count the same root problem once, not once per occurrence.
Apply severity only with evidence, not guesses. A higher score
indicates fewer confirmed defects *within the inspected scope*.

If the codebase cannot be inspected sufficiently, give a
**provisional score** only if justified, explicitly state the
limited coverage, and never imply an untested website is perfect.
If there is almost no evidence, state **Score unavailable**
instead of inventing a number, and say how to enable scoring.

Interpretation (guidance, not a guarantee):

- 9.0–10.0: Excellent in the reviewed scope
- 7.0–8.9: Good; improvements needed
- 5.0–6.9: Moderate issues
- 3.0–4.9: Poor; major fixes recommended
- 1.0–2.9: Critical condition

## Required response layout

### Website quality report (read-only)

**Score:** X.X/10 (or provisional / unavailable)
**Scope:** paths/pages/features reviewed
**Confidence:** high / medium / low, with why
**File changes:** none

**Confirmed issues**

| Severity | File:line | Problem | Impact | Suggested fix |
| --- | --- | --- | --- | --- |
| High | `file.php:42` | Specific issue | Impact | Advice only |

Sort findings Critical, High, Medium, Low.
Do not invent a line number if unavailable.
For each issue, cite observable evidence or command output.

**Score calculation**
Show the starting 10.0 score, deductions by severity and result.

**Checks executed / NOT RUN**
Report exact commands and results, and explicitly list important
checks not run (e.g. browser, database, email, Lighthouse, live SEO).

**Priority order**
Give the top three fixes to do first, but **do not implement them**.

**Summary**
One paragraph explaining the rating, its limitations and
whether another audit is recommended after the user fixes issues.

## Source formatting

This report never edits code. If the user later requests fixes,
use `AGENTS.md` to write physical source line breaks, ideally
88 characters per line. Never silently apply fixes during audit.

## Graphify-first targeted inspection

Follow `../../../GRAPHIFY_EFFICIENCY.md` and the official installed
`$graphify` skill. Reuse an existing relevant graph, query only
likely affected files and verify results against current source.
Avoid repeated queries and whole-project code dumps.

This command is read-only: never rebuild/refresh an on-disk
index or run tools that write files. If no usable graph exists,
inspect relevant source files directly; for full-project requests, enumerate
and cover each eligible file where practical, reporting any coverage gaps.
Do not silently claim the full project was inspected.
