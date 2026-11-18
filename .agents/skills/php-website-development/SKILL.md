---
name: php-website-development
description: >-
  Build and maintain mobile-first, SEO-friendly vanilla PHP websites using
  this project's original template, Tailwind CSS, partials, forms, and
  conventions. Use for page creation, PHP/Tailwind work, and repository
  setup.
---

# PHP website development

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


## Token-efficient editing guidance

- Follow the repository-root `DEVELOPMENT_EFFICIENCY.md`.
- For a new site, create requested sections incrementally;
  do not generate every possible page or graph an empty project.
- For CSS-to-Tailwind conversions, migrate shared components
  first, followed by one page or closely related group per batch.
- Reuse existing PHP/Tailwind patterns and avoid broad rewrites.
- Preserve the strict no-custom-CSS policy in every batch.
- Never auto-run testing, SEO reviews or formatting passes.
