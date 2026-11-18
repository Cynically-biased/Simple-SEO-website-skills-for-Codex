---
name: website-workflow
description: >-
  Master workflow for building and changing PHP websites.
  Apply development and SEO standards, starting with Graphify.
  Do not run tests automatically.
  Testing is an explicit, separate read-only skill.
  Use when asked to build or change a site or apply the complete
  development workflow. For audits use website-test-report or website-seo-report.
---

# Complete website workflow

> **Mandatory naming override:** Follow root `FILE_NAMING.md` and
> `AGENTS.md`: descriptive filenames; prefix every non-page PHP file with
> `_`, never prefix PHP website pages. Any older unprefixed filenames in
> examples in this reference are historical and must not be copied as-is.
> Existing files are not renamed automatically.

## Form choice enums and handlers (mandatory)

- In PHP 8.1+ projects, represent every form field with a fixed set of
  named choices (e.g. service type, contact preference, budget tier,
  request category) with a **separate backed PHP enum**.
- Create `enums/` when the first such choice field is needed. Use one
  descriptive enum per distinct choice domain, e.g.
  `enums/_ServiceType.php`, `enums/_ContactPreference.php` and
  `enums/_BudgetRange.php`. **Never combine unrelated choice enums in one
  file.** Multiple choice fields mean separate enum files when they
  represent different domains; reuse one enum across forms if the
  choices are genuinely the same.
- Use `enum Name: string` with stable machine-readable string values;
  optionally expose a `label(): string` method for display text.
- Populate HTML `<select>`, radio groups, and checkbox groups from the
  enum's `cases()` so form options and server-side validation cannot
  drift apart. Escape labels and values when rendering HTML.
- In `handlers/`, validate each submitted value with the matching
  enum's `tryFrom()` (or equivalent safe validation), including every
  item submitted for multi-select checkboxes. Reject invalid or
  unexpected values; never trust options posted by the browser.
- Keep submission handling, CSRF checks, field validation and redirects
  in focused handlers. Keep HTML markup in pages/components; enum
  classes describe choices only and do not contain form rendering.
- Do not create enums for unconstrained free text or ordinary yes/no
  booleans when a simple boolean is appropriate. Do not create empty
  `enums/` folders when the site has no fixed-choice forms.
- PHP enums require PHP 8.1+. Confirm the project's runtime before
  adding them; if older, flag the incompatibility instead of silently
  introducing syntax the project cannot run.
- For an existing project, apply this structure to newly added or
  expressly refactored forms; avoid unrelated bulk migrations.

## Reusable components (selective)

- Use `components/` for genuinely reused or substantial HTML/PHP
  components, such as cards, form fields, or FAQ items. Do not extract
  one-off or tiny markup solely to create files.
- Keep component markup in PHP, use Tailwind utility classes only, and
  pass explicit typed or validated values where practical.
- Keep site-wide header/footer partials in `partials/`, with footer
  content outside the centralized `data/` PHP-array system.

## Selective PHP array organization (mandatory for new websites)

- Follow the repository-root `CONTENT_ARCHITECTURE.md`.
- Keep ordinary page copy, headings, paragraphs, SEO tags, and HTML
  directly in each PHP page or its existing template/partial.
- Do **not** extract entire pages or all website content into data files.
- Do **not** create `content.json`, page JSON files, or a generic
  content-loading system for website copy.
- Use small, focused PHP files returning arrays only when appropriate:
  repeated cards, service/product lists, FAQ entries, testimonials,
  team members, menus, or multiple substantial editable arrays.
- Store reusable arrays under `data/` in descriptive PHP files, e.g.
  `data/_services.php`, `data/_faqs.php`, or `data/services/_roofing.php`.
  Group related arrays logically; do not create files unnecessarily.
- When several pages share a category dataset, maintain one source
  array and reuse it rather than duplicating the same entries.
- If data appears once and extraction makes editing harder, keep the
  array directly in the related PHP page.
- Load array files with explicit `require` paths rooted at `__DIR__`.
  Never construct include paths from unchecked user input. Escape
  output in the appropriate HTML context.
- Keep footer content in the existing footer partial; do not move it
  into the centralized array directory.
- Do not store secrets or sensitive information in these PHP arrays.
  Prevent direct web access to the data directory where practical.
- Do not reorganize existing websites unless explicitly requested.
  For migrations, preserve behavior and update only relevant files.
- Do not automatically run quality, SEO, or structure audits.
- This rule overrides older JSON-content examples in preserved
  original reference files; the reference files remain unchanged.

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


## Search appearance and sitemap metadata during development

- Write descriptive, unique page titles and meta descriptions.
  They are candidate Google search snippets, not guarantees.
- Maintain `sitemap.xml` when indexable pages change. Add
  accurate `<lastmod>` when meaningful change dates are known;
  never fabricate them. Do not add `<priority>` or
  `<changefreq>` for assumed Google SEO benefits.
- Do **not** launch the comprehensive `$website-seo-report`
  automatically. It remains a manual read-only command.

## Automatic development mode selection

**Before Graphify kickoff**, read `../../../DEVELOPMENT_EFFICIENCY.md`
(or the repository-root equivalent) and classify the task:

1. **New / empty project:** skip initial Graphify indexing and
   analysis. Build only the requested small section first.
2. **Existing project:** reuse a relevant current graph to scope
   direct file inspection and targeted edits.
3. **Custom CSS to Tailwind migration:** work in bounded batches;
   convert shared elements first, then individual pages. Avoid
   rewriting completed pages and maintain strict Tailwind-only CSS.
4. **Large refactor:** split at dependency boundaries and avoid
   wholesale replacement when targeted changes are possible.

For all types, complete the task in manageable related batches,
reuse source context, and synchronize Graphify only once after
relevant editing batches when supported. Manual audits stay manual.



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


This is the single entry point for the project website standards.
Invoke with `$website-workflow` followed by the task.

## Graphify kickoff (existing projects only)

For existing projects, follow the installed `$graphify` skill
and `../../../GRAPHIFY_EFFICIENCY.md`. For an empty/new
project, skip this kickoff until useful source exists.
The user does not need to invoke `$graphify` separately.

1. Discover and read the official Graphify skill; do not assume
   that Graphify is present because this package is installed.
2. **Reuse a relevant, sufficiently current graph** before any
   rebuild. Query only the routes, files and dependencies relevant
   to the requested work. Read just the necessary code spans.
3. Refresh or build a graph only if relevant results are missing
   or stale, the official skill supports it, and writes are allowed.
   Avoid full re-indexing when incremental updates suffice.
4. If no suitable graph is available, use targeted repository
   inspection; explain the fallback rather than claiming success.
   Ask before a disproportionately expensive full-project scan.
5. Never install Graphify, modify Codex settings, or run unrelated
   code-quality, testing or SEO reports automatically.

Graphify helps navigate a project; it does **not** guarantee less
Codex token usage. Prefer small, verified context over raw dumps.

## Required source skills

Use the following sibling skills for development:

1. `../php-website-development/SKILL.md`
2. `../website-integrations-seo/SKILL.md`
3. `../website-testing-aftercare/SKILL.md` (reference only;
   do not execute diagnostic steps unless testing is requested)

Their `references/` folders contain the original, full guidance.
Read the reference material relevant to each phase. Do not omit
applicable requirements from the original documents.

## Process for every task

1. **After mode selection and any applicable Graphify kickoff,
   inspect** relevant project instructions,
   the design reference and targeted code; avoid whole-repo dumps.
2. **Plan** a concise checklist of changes and checks. Distinguish
   requested work from features that do not apply to this site.
3. **Develop** using the original PHP/Tailwind conventions where
   the project supports them. Do not invent company data.
4. **Integrate** applicable SEO, analytics, sitemap, robots,
   Schema.org, accessibility, security and privacy requirements.
   Obtain real identifiers and consent requirements before use.
5. **Synchronize Graphify after changes.** Follow
   `../../../GRAPHIFY_SYNC.md` after authorized source edits.
   Batch changes; update only if needed, using the installed
   Graphify skill's documented incremental procedure. Verify
   success or mark the graph stale; never silently trust it.
6. **Do not test automatically.** Do not execute audits, linters,
   tests, browser checks, or quality scoring by default.
7. **Report** changed files, graph freshness and any outstanding
   work. State that tests were not run unless requested.

For a narrowly scoped task, inspect all three skill scopes but
only implement the applicable requirements. Do not add tracking,
forms or entire pages unless requested or required by the task.
Do not claim tests passed unless they were explicitly run.

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
  Do not write or format custom CSS declarations.
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

## Priorities and safety

- Respect the user's specific request and existing project code.
- Follow root `AGENTS.md` and any more specific instructions.
- Original source requirements remain available in references;
  this master skill coordinates them rather than replacing them.
- Never publish placeholder contact details or credentials.
- Ask for missing production IDs or secrets instead of guessing.
- Do not test or audit after coding unless the user requests it.
- Use `$website-test-report` for a separate code-quality review.
- Use `$website-seo-report` for a separate SEO quality audit.
- Never run either report automatically after development.
- Begin with the installed Graphify skill on explicit invocations;
  reuse the graph and avoid needless reindexing.

## Existing-code formatting command

- `$website-format-code` is the separate on-demand command for
  repairing physical line lengths in existing source code.
- `$website-format-code --check` only reports violations.
- Never launch either during ordinary development automatically.
