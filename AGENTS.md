# Project instructions for Codex

## Mandatory sitemap format: real XML file only

- The sitemap MUST be a real UTF-8 XML file at the website root,
  named `sitemap.xml` and served directly at `/sitemap.xml`.
- Never implement the sitemap as `sitemap.php`, a PHP output script,
  a route that generates XML on request, or an `.htaccess` rewrite
  forwarding `/sitemap.xml` to PHP.
- Include only valid canonical, absolute, indexable URLs that actually
  belong to the site. Use the correct live domain; never publish
  placeholder URLs or fabricated `lastmod` dates.
- When authorized to add, remove, or significantly change a page,
  update the physical `sitemap.xml` in the same edit batch.
- Reference the XML file in `robots.txt` using the public URL.
- Keep the sitemap compliant with the XML sitemap protocol. If the
  project grows, multiple physical XML sitemap files and an XML
  sitemap index are permitted; PHP-generated sitemaps are not.
- Do not run SEO audits or submit sitemaps to Google automatically.
- This policy supersedes the optional PHP sitemap generation example
  retained in `references/integrations-full.md` for provenance.


## Default website development workflow

### Automatic Token-Efficient Development Mode

- For normal website development use `DEVELOPMENT_EFFICIENCY.md`.
- Detect empty/new projects, targeted edits, Tailwind migrations,
  and large refactors before choosing the inspection strategy.
- For empty sites, skip Graphify analysis until meaningful code
  exists. For existing sites, reuse the current graph when useful.
- For large tasks, make small, related edits in bounded batches;
  prioritize shared components, then individual pages.
- Preserve completed work. Avoid re-reading unchanged files or
  rewriting entire files when a smaller edit will do.
- Continue strict Tailwind-only source changes. The policy does
  not permit custom CSS, inline styles, or `@apply`.
- Graphify sync is after relevant authorized edit batches only.
- Do not automatically run tests, SEO audits, structure reports,
  or the on-demand format-code command.



For website development requests, automatically follow:

- `.agents/skills/website-workflow/SKILL.md`
- `.agents/skills/php-website-development/SKILL.md`
- `.agents/skills/website-integrations-seo/SKILL.md`

Use `$website-workflow` to explicitly activate development
standards. Follow them by default for relevant development tasks.

## Strict Tailwind-only styling (mandatory; zero custom CSS)

- Tailwind CSS utilities are the **only allowed styling method** for all
  new and modified website UI, including layout, spacing, typography,
  color, animation, states, responsiveness, and print styling.
- **Never write handwritten CSS declarations or selectors** in `.css`,
  `<style>` blocks, inline `style` attributes, CSS-in-JS, or PHP/JS
  strings. Never create or add custom CSS classes for styling.
- **Never use `@apply`**, `@layer` with custom CSS rules, custom
  selectors, `@font-face`, or handwritten media queries/keyframes.
  Never introduce CSS modules, Sass/SCSS, Less, or another styling system.
- Use Tailwind utility classes directly in `class`/`className` values.
  For interaction states, use Tailwind variants such as `hover:`,
  `focus-visible:`, `disabled:`, `dark:`, and `group-*` as appropriate.
- For responsive layouts, use `sm:`, `md:`, `lg:`, `xl:` and other
  Tailwind variants; do not handwrite media queries.
- Set design tokens through the existing Tailwind configuration or
  the supported Tailwind theme mechanisms. Configuration values are
  not a license to introduce custom selector rules.
- The only permitted CSS source file is a **minimal Tailwind build
  entrypoint** containing the import/directives required by the
  installed Tailwind version; it must not contain custom styling.
  Tailwind-generated CSS output may exist but must never be edited
  manually. Existing third-party/generated CSS is not a template for
  additional custom styles; do not alter it as a styling workaround.
- Do not introduce inline style values through JavaScript or DOM APIs.
  Toggle Tailwind utility classes instead where appropriate.
- Follow the project's installed Tailwind major version: do not mix
  Tailwind v3 directives/configuration with Tailwind v4 syntax.
- Before finishing **an authorized styling change**, inspect the
  changed handwritten source for prohibited CSS and replace any
  introduced instances with Tailwind classes. This is a targeted
  source check, **not** an automatic test, audit, or full-project scan.
- If the exact requirement cannot be achieved with Tailwind utilities
  and supported configuration, **do not silently add custom CSS**.
  Explain the limitation and ask for a different design approach.
- These rules override older, less strict Tailwind advice found in
  preserved `references/` documentation (including exceptions for
  custom CSS and use of `@apply`). Keep reference files unchanged.

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
  Do not author custom CSS; only format Tailwind entry directives when necessary.
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
