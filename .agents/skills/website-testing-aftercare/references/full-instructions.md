---
name: website-testing-aftercare
description: >-
  Manually diagnose and test PHP websites only when explicitly asked.
  Use for navigation bugs,
  forms, clean URLs, styling, SEO, schema validation, PHP/session errors,
  accessibility issues and responsive regression testing.
---

# Website testing and aftercare

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

Read `references/testing-full.md` for the complete uploaded aftercare
and testing instructions, including all causes, fixes and checklists.
Do not omit a topic solely because this summary is brief.

## Manual activation only

This skill provides the diagnostic checklist and background.
**Never invoke it automatically after code changes.**
Use it when `$website-test-report` is invoked, or the user
explicitly asks for testing. For `$website-test-report`, perform
read-only inspection and reporting: **never apply the fixes** in
this guide, even if the source document says to fix them.

## Diagnostic workflow

1. Reproduce the issue and record its affected URL/viewport.
2. Find the likely cause in the source guide and verify it against
   the current code instead of applying fixes speculatively.
3. Record the smallest appropriate proposed correction.
4. Run safe, read-only checks where feasible and permitted.
5. Record findings, evidence, and limitations. Do not edit files.

## All original troubleshooting areas

- Mobile menu: duplicate listeners, opening/closing, links and
  overlay cleanup; `aria-expanded`, Escape and focus handling.
- Forms: mail/SMTP, validation state, POST-redirect-GET,
  session flashes, success/error messages and resubmission.
- Clean URLs: Apache `mod_rewrite`, `.htaccess`, redirect loops,
  exclusions for `/handlers/` and physical-file conditions.
- Layout: CSS cache invalidation, mobile/tablet/desktop widths,
  sticky footers and equal-height card layouts.
- SEO: JSON-LD syntax, meta description behavior and absolute URLs
  for Open Graph images.
- PHP/server: error logs, blank pages, include paths and sessions.
- Accessibility: focus management, form error announcements,
  `aria-describedby` and `aria-invalid`.

## Handoff checks

Use every checkbox in `references/testing-full.md`, including:
PHP warnings, menus, forms/email, clean URLs, browser console,
375/768/1024/1440px layouts, image alt text, Schema.org validation,
unique metadata, short-page footer placement, 404 page, favicon,
HTTPS and mixed-content issues.

- Follow the source's additional breakpoints for diagnosing layout:
  320, 375, 640, 768, 1024 and 1280px.
- Only run safe checks after explicit test invocation. If a
  command may modify the project, do not run it; mark untested.
- Do not claim successful email delivery or browser verification
  without actually testing those actions.
- Describe suggested fixes but do not apply any change.

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

## Quality-first precedence

Quality-first policy: efficiency is a preference, never a quality or scope cap. Expand source inspection, load additional applicable references, revisit earlier decisions, rewrite necessary code, and choose batch sizes as needed for correctness, completeness and maintainability. Perform relevant authorized, non-destructive verification; separate report commands remain manual-only. Creative design has no artificial exploration, variant, complexity, batch or token budget. Preserve user scope, branding requirements, strict Tailwind-only styling, PHP conventions, security, accessibility and permissions. Do not bypass platform limits or require external tools. Explicit standard/deep/full/visibility audit modes remain distinct; disclose incomplete coverage and never treat unverified checks as passing.

## Adaptive testing and security (V2 — authoritative)
During development, discover actual features, trust boundaries, data, deployment and risks; apply relevant prevention and verify changed behavior and affected dependencies. Read `SECURITY_TESTING_POLICY.md` for sensitive work or testing. No speculative infrastructure, automatic full audits, mandatory external tools or creative restrictions. Existing tests may run as necessary; create a focused regression test for a reproducible bug when practical and within the requested development scope. Never change production state. Quality-first overrides artificial inspection or test budgets, not authorization or command boundaries.
Graphify is optional: use direct source reads, read-only terminal commands and Git if unavailable. No mandatory scripts or execution-policy bypass. Report blocked checks rather than abandoning unrelated checks. Report-only commands never modify project files; test-create and test-suite may create/update tests and isolated fixtures/config only, not application code. Dependency installs, deployments, real external effects and production active testing require separate authorization. Never print secrets in reports.
