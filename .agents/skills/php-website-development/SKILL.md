---
name: php-website-development
description: >-
  Build and maintain mobile-first, SEO-friendly vanilla PHP websites using
  this project's original template, Tailwind CSS, partials, forms, and
  conventions. Use for page creation, PHP/Tailwind work, and repository
  setup.
---

# PHP website development

## First steps

1. Inspect the repository and existing website before changing code.
2. Read `references/original-claude-guidelines.md` in full. It is
   the authoritative source for the uploaded website-template rules.
3. Consult `references/company-template.md` when gathering company
   information. Its placeholder details are *not real company facts*.
4. Consult `references/original-gitlab-readme.md` for the supplied
   GitLab onboarding and CI/CD information.
5. Check `theme.html` for visual direction, if it exists.

## Implement the complete source workflow

- Preserve the template's directory structure and naming rules:
  root PHP pages, `partials/`, `handlers/`, `diensten/`, `public/`,
  `.htaccess`, `company.md`, `integrations.md`, and `theme.html`.
- Use the page template with page title, meta description and
  optional page-specific JSON-LD before the header include.
- Use a shared header/footer for SEO tags, navigation and scripts.
- Follow POST-redirect-GET with session-based flash messages for
  forms. Validate input, escape output and redirect with `exit`.
- Keep clean URLs, handler exclusions, security headers and HTTPS.
- Use Tailwind utility classes and compiled output, respecting the
  uploaded template's build workflow and responsive breakpoints.
- Keep JavaScript in `public/js/main.js` and initialize listeners
  once inside `DOMContentLoaded`.
- Include semantic HTML, alt text, useful titles, descriptions and
  applicable Schema.org markup.
- Follow the uploaded checklists for new pages, new forms and deploy.
- If the repository differs from the template, report differences
  and adapt carefully rather than blindly rewriting configuration.

## Readable code policy

- Target an 88-character line width; use 100 as a soft maximum.
- Keep indentation consistent: 4 spaces for PHP/JS, 2 for HTML/CSS
  when compatible with the surrounding code.
- Break long HTML opening tags across lines, one attribute per line
  where useful, especially for long Tailwind class lists.
- Divide long class lists at spaces *inside* the attribute; preserve
  the classes and their order. Do not truncate classes.
- Break long method chains, PHP arrays, arguments and conditional
  expressions at syntax-safe boundaries.
- Never split an identifier, URL, literal or regex unsafely just to
  satisfy a width limit; correctness takes precedence.
- Do not minify hand-edited source files or generate horizontal
  scrolling walls of markup. Build output may stay minified.

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

## Completion (no automatic testing)

- Do not run PHP lint, CSS builds, browser checks or tests unless
  the user explicitly asks for testing.
- Report changed files and state that tests were not run.
- For an optional scored read-only audit use `$website-test-report`.
