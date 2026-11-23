# Selective PHP Array Architecture for Codex

## Purpose

Keep ordinary website content and HTML in the PHP page where it is
shown. Extract **only genuinely useful arrays** into focused PHP files:
reusable collections across pages or multiple substantial groups of
items that are easier to maintain separately.

**No JSON content architecture.** Do not create `data/content.json`,
`data/pages/*.json`, or a universal content loader.

## Example structure (create only what is needed)

```text
project-root/
├── data/
│   ├── _services.php
│   ├── _faqs.php
│   └── services/
│       └── _roofing.php
├── partials/
│   ├── _header.php
│   └── _footer.php
├── index.php
├── about.php
├── services.php
└── sitemap.xml
```

The `data/` directory is **optional** until useful arrays exist.
Do not create empty folders or files. Keep footer content in its
existing PHP partial, not in a `data/` array file.

See `FILE_NAMING.md` for the mandatory leading `_` on all non-page
PHP files, including data arrays, handlers, components and enums.

## What belongs where?

| Content | Recommended location |
| --- | --- |
| Hero heading, page paragraphs, sections, HTML | The relevant PHP page |
| Page title and meta description | The relevant PHP page |
| A single small list used once | The relevant PHP page |
| Repeated service cards across multiple pages | `data/_services.php` |
| Frequently edited FAQs or testimonials | `data/_faqs.php` |
| Category-specific repeated listings | `data/_<category>.php` |
| Multiple complex groups in one category | `data/<category>/_*.php` |
| Footer text and links | `partials/_footer.php` |

Avoid overengineering: extracting an array must make editing easier,
not add extra files or indirection.

## Example reusable PHP array

`data/_services.php`:

```php
<?php

return [
    [
        'slug' => 'roof-repair',
        'title' => 'Roof repair',
        'description' => 'Example service description.',
    ],
    [
        'slug' => 'roof-inspection',
        'title' => 'Roof inspection',
        'description' => 'Example service description.',
    ],
];
```

In a page that displays those cards:

```php
<?php

$services = require __DIR__ . '/data/_services.php';
?>

<section>
    <?php foreach ($services as $service): ?>
        <article>
            <h2>
                <?= htmlspecialchars(
                    $service['title'],
                    ENT_QUOTES,
                    'UTF-8'
                ) ?>
            </h2>
        </article>
    <?php endforeach; ?>
</section>
```

Use Tailwind classes for actual styling in accordance with the
project's strict Tailwind policy. The snippet demonstrates loading
only; it is not a complete page template.

## Extraction decision rules

1. Is this content naturally a list of similarly structured items?
2. Is the same dataset needed on multiple pages, or are there several
   substantial arrays that are more maintainable when separated?
3. Will moving it reduce duplication and simplify future changes?
4. If not, leave the content or array in the original PHP page.
5. Never move an entire page's HTML or ordinary copy into an array.

Use descriptive file names based on their actual responsibility.
Prefer one file per sensible dataset, not one file per array item.

## PHP safety and maintenance

- `require` array files using known, fixed `__DIR__`-based paths.
- Never accept a request parameter as an include path.
- Check array keys/types where needed, and escape rendered values.
- Do not store secrets, credentials or private data in public arrays.
- Where possible keep `data/` outside the document root; otherwise
  deny direct HTTP access to PHP data files at the server level.
- Relevant safe syntax and page verification is allowed; do not run unsafe scripts or modify production state.

## Workflow and compatibility

- New websites: use this structure only when reusable arrays exist.
- Existing websites: keep their layout unless the user asks for
  targeted extraction or migration.
- When adding shared items, update the relevant PHP data file only.
- Keep the static physical `sitemap.xml` policy unchanged.
- Reuse Graphify context when useful and synchronize changed code
  according to the existing project instructions.
- Testing, SEO and structure reports remain manual and read-only.
- This document supersedes previous JSON-content architecture rules.
  Original bundled references are retained for historical context.

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

