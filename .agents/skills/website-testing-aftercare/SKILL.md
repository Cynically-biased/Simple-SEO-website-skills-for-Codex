---
name: website-testing-aftercare
description: >-
  Manually diagnose and test PHP websites only when explicitly asked.
  Use for navigation bugs,
  forms, clean URLs, styling, SEO, schema validation, PHP/session errors,
  accessibility issues and responsive regression testing.
---

# Website testing and aftercare

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
