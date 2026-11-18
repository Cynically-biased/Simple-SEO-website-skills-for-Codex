# Logical File Names — Mandatory Website Workflow Rule

## Objective

Name files according to their actual responsibilities so developers can
understand their purpose without opening them. Apply this to **newly created
files** and names explicitly requested for change. Do not perform unsolicited
repository-wide renames, especially during a format or audit command.

## PHP page versus non-page rule

- **Website page PHP:** files that are direct, intended website page/routes,
  such as `index.php`, `about.php`, `contact.php`, `roof-repair.php`. Their
  names describe the page subject and **must not** begin with `_`.
- **Non-page PHP:** any PHP source used to implement a site rather than
  represent a page must have a **leading `_` in the basename**, even in
  nested folders. This includes data, handlers, enums, components, partials,
  includes, utility functions, configuration PHP, and mailer logic.
- Use one clear purpose per file. Prefer lowercase `kebab-case` names for
  page and non-class helper filenames. For class/enum files, preserve the
  PHP type's recognizable name after the prefix: `_ServiceType.php`,
  `_ContactPreference.php` (declared enums remain `ServiceType`, etc.).
- Avoid names like `file.php`, `temp.php`, `new2.php`, `misc.php`,
  `helper-final.php`, and misleading type/category names.

## Examples

```text
website/
├── index.php                    # public page
├── about.php                    # public page
├── contact.php                  # public page
├── roof-repair.php              # public page
├── components/
│   ├── _service-card.php         # not a page
│   └── _contact-form.php        # not a page
├── partials/
│   ├── _header.php              # not a page
│   └── _footer.php              # not a page
├── handlers/
│   └── _contact-submit.php      # processing, not a page
├── enums/
│   ├── _ServiceType.php         # declares enum ServiceType
│   └── _ContactPreference.php   # declares enum ContactPreference
└── data/
    ├── _services.php           # PHP array
    └── _faqs.php               # PHP array
```

Example use: `$services = require __DIR__ . '/data/_services.php';`.
Use explicit `require_once` for enum class files, or ensure autoload mapping
resolves underscored filenames when the project uses an autoloader.

## Safety, deployment and scope

- Confirm whether a PHP file is a real user-facing **page route** versus an
  action endpoint or implementation file before choosing the prefix.
- For a processing endpoint reached directly by a form, the handler still
  starts with `_` (e.g. `/handlers/_contact-submit.php`), but use the existing
  routing/security pattern; a filename prefix is **not** access control.
- Protect internal handlers, data, enums, configuration and includes from
  unwanted direct web access using web-server configuration or placement
  outside the public document root as appropriate.
- The convention does **not** apply to non-PHP files: `sitemap.xml`,
  `robots.txt`, Tailwind assets, images and JS use normal meaningful names.
- Do not break framework conventions, Composer PSR-4 autoloading, third-party
  packages or deployed entrypoints. When a required filename conflicts with
  this rule, explain the incompatibility and obtain approval before
  choosing a breaking rename; do not silently override either requirement.
- Existing projects: apply the convention to **new files**. Audit older names
  via `$website-structure-report`, and migrate only upon explicit request.
- `$website-format-code` never renames files. `$website-cleanup-report`
  never treats an `_` prefix or unclear name as evidence that deletion is safe.

## Reports

- Structure report: check descriptive filenames and required prefix, provide
  exact paths, proposed names, confidence and references to update, with
  no automatic file changes.
- Cleanup report: identify genuinely unused candidates based on evidence,
  independent of filename aesthetics; no automatic deletion.

## Dedicated naming command (manual only)

- `$website-naming-fix --check` audits filename conventions without any edits.
- `$website-naming-fix` checks and **safely fixes** first-party naming
  violations, updating verified references and checking affected files.
- Block risky renames that can break URLs, form actions, Composer/autoload,
  routing, deployment integrations or dynamic includes. Report the blocker
  and obtain approval for the separate migration; never guess.
- `$website-workflow` always applies the naming gate to newly created or
  changed files and their references. It does **not** launch a project-wide
  naming audit or auto-rename unrelated existing files.
- `$website-structure-report` remains read-only and flags convention breaks;
  `$website-format-code` never renames; `$website-cleanup-report` does not
  interpret naming violations as deletion suggestions.
