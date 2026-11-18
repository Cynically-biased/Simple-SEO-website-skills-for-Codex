# Project instructions for Codex

## Default website development workflow

For website development requests, automatically follow:

- `.agents/skills/website-workflow/SKILL.md`
- `.agents/skills/php-website-development/SKILL.md`
- `.agents/skills/website-integrations-seo/SKILL.md`

Use `$website-workflow` to explicitly activate development
standards. Follow them by default for relevant development tasks.

## Graphify-first and token-efficient inspection

- Follow `GRAPHIFY_EFFICIENCY.md` for **every** website command.
- Use the official installed `$graphify` skill when available.
- Reuse an existing relevant graph; refresh only when stale.
- For **authorized source edits**, follow `GRAPHIFY_SYNC.md`:
  batch one incremental update after relevant changes, and
  verify success before relying on refreshed graph information.
- Query only relevant dependencies and inspect targeted source.
- Report graph availability, coverage and any direct-inspection
  fallback. Do not claim guaranteed savings in Codex usage.
- No automatic tests, audits, scans or formatting passes.
- Graph synchronization after an authorized edit is permitted
  maintenance, not an automatic test or audit.

## Manual structure review (strictly opt-in)

- `$website-structure-report` analyzes folders, file roles,
  source relationships and opportunities for improved structure.
- Use Graphify if available and suitable for read-only inspection.
- Report a 1–10 maintainability score, evidence, proposed tree,
  tradeoffs and a migration plan; **never edit project files**.
- Do not run this review automatically during development.

## Graphify in manual review and formatting commands

- `$website-test-report`, `$website-seo-report`,
  `$website-structure-report`, and `$website-format-code`
  (including `--check`) apply `GRAPHIFY_EFFICIENCY.md`.
- Reuse the official graph where relevant and verify against
  source. Never silently scan all files or repeatedly reindex.
- Read-only reviews cannot create/refresh graph indexes.
- Formatting may edit source formatting only; after an
  authorized edit it may synchronize Graphify as documented
  in `GRAPHIFY_SYNC.md` (no other source changes).
- If Graphify cannot answer a query, disclose the limitation.

## Manual SEO report (strictly opt-in)

- Run `$website-seo-report` only when the user requests it.
- Do not automatically score, audit or test SEO after coding.
- SEO reviews are read-only and report 1–10 scores, evidence,
  prioritized improvements and unavailable checks.
- Do not make fixes, edit files, or change Google services
  during the SEO report.
- Implementing SEO in requested development work is allowed;
  the standalone SEO audit must never auto-run.

## Manual source formatting (strictly opt-in)

- `$website-format-code` scans existing code for readability and
  fixes **only safe formatting**, including actual line breaks.
- It is explicitly invoked, never automatically run after coding.
- It may edit files only when invoked normally; it must preserve
  functionality, source strings, styles and unrelated changes.
- `$website-format-code --check` reports violations read-only.
- After a normal formatting edit, synchronize affected graph
  data once, if supported and authorized; see `GRAPHIFY_SYNC.md`.
- Neither mode runs code tests, SEO audits or quality scoring.
- Formatting guidance for newly written code still applies under
  the default development instructions below.

## Testing is strictly opt-in

**Do not automatically run tests, audits, lint commands, browser
checks, scoring, security scans or review workflows after edits.**

- Only run a test or audit if the user expressly requests it.
- `$website-test-report` is the manual, read-only code review.
- `$website-seo-report` is the manual, read-only SEO audit.
- `$website-structure-report` is the manual, read-only architecture review.
- Ordinary `$website-workflow` requests must not trigger testing.
- Do not turn review findings into code changes unless the user
  separately requests fixes in a later instruction.
- When testing is not requested, finish with a brief change summary.
- Do not claim code was tested or verified if it was not.
- Preflight inspection needed to understand a task is allowed;
  do not treat it as an automatic testing phase.
- If explicitly asked to test without `$website-test-report`, follow
  the user's test request, with its specified write permissions.

## Repository rules

- Inspect existing conventions and `theme.html` if present.
- Do not overwrite working files just to match a template.
- Keep the original full documents under `references/` intact.
- Company templates contain placeholders, not verified facts.
- Use the project's actual PHP, Tailwind, JavaScript and Apache
  configuration rather than inventing tools or dependencies.
- Implement relevant SEO, analytics, Schema.org, accessibility,
  privacy and security requirements when authorized.
- Never invent business credentials or enable tracking without
  appropriate configuration and consent.

## Physical source-code line breaks (mandatory)

- **Write actual newline characters in source files.** Do not rely on
  editor soft wrap, `Alt+Z`, `.vscode` settings, or visual wrapping.
- Aim for 88 characters per source line; use 100 as a practical upper
  limit for hand-written code. Check the physical lines before finishing.
- Format HTML tags with one attribute per line when needed. For long
  Tailwind classes, break the `class` value at whitespace across
  multiple source lines; keep every class in the same order.
- Format PHP arrays, function calls, conditions and method chains at
  valid syntax boundaries. Use readable indentation consistently.
- Format JS/TS expressions, objects and calls across actual lines.
  Format CSS declarations on separate lines; wrap selector lists.
- Do not concatenate code into a long single line or minify editable
  source files. Generated and vendor assets may remain minified.
- Preserve runtime behavior, whitespace-sensitive content, string
  literals, URLs, regexes, and language syntax. When an unbreakable
  token exceeds 100 characters, keep it intact and explain only if
  relevant; never make invalid code to meet a width target.
- Keep changes scoped: apply these rules to code you create or edit,
  without reformatting unrelated files unless asked.
- **Before finishing, inspect long physical lines** in changed
  hand-written source files and fix safely breakable lines.
