---
name: website-integrations-seo
description: >-
  Set up and verify GA4 analytics, Search Console, sitemaps, robots.txt,
  Schema.org JSON-LD, GDPR-aware consent, and prelaunch SEO integrations for
  a small PHP website. Use for tracking, indexing, structured data and launch
  checks.
---

# Website integrations and SEO

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


## Source of truth

Read `references/integrations-full.md` as needed. It contains the
**entire uploaded integrations guide** including examples, checklists,
implementation stages, troubleshooting, links and privacy guidance.
The examples use placeholders; never deploy those as real values.

## Required coverage

1. GA4: measurement ID, header placement, automatic/custom events,
   contact forms, CTA/phone/email events, DebugView and validation.
2. XML sitemap: page inventory, static or dynamic PHP generation,
   `.htaccess` routing, priorities, change frequencies and upkeep.
3. `robots.txt`: sitemap declaration and exclusions, if applicable.
4. Google Search Console: verification, sitemap submission,
   indexing checks, Core Web Vitals and periodic monitoring.
5. Structured data: Organization, conditional LocalBusiness,
   WebSite/SearchAction only for real site search, Service,
   BreadcrumbList and ContactPage, as applicable.
6. Prepare structured data for validation with Rich Results Test
   and Schema.org validator when testing is explicitly requested.
   Avoid malformed or conflicting JSON-LD.
7. Follow the source guide's four implementation phases:
   pre-launch, launch week, post-launch and ongoing maintenance.
8. Include the guide's troubleshooting steps, links, maintenance
   ownership/contact placeholders and review information.
9. Address GDPR, privacy policies and consent before enabling
   nonessential tracking. Do not assume analytics consent.

## Important implementation checks

- Keep IDs, addresses, dates, URLs, schema descriptions and contact
  information accurate; ask for real values when necessary.
- Do not assume analytics events are active. Verify events only
  when the user explicitly requests testing.
- Emit form-success tracking on a genuine completed submission,
  and avoid accidental duplicate events.
- Confirm the actual site-search feature works before adding a
  SearchAction; schema does not create site search on its own.
- Use only truthful structured data and current SEO conventions;
  the source is a project template, not a guarantee of rich results.
- Keep code readable (88-character target) while preserving valid
  XML, PHP, JavaScript and JSON syntax.
- Report configured items, placeholders and outstanding work.
  Do not test automatically; use `$website-test-report` on request.

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
