# WEBSITE_ARCHITECTURE.md — authoritative implementation contract

This contract **must be consulted before** creating/modifying a PHP page, partial, handler, enum, data array, JS asset, CSS build file, route or related test. It is the canonical interpretation of `references/original-template/CLAUDE.md`, reconciled with the user's later approved constraints. All skills use it; archived `references/full-instructions.md` files and example snippets do not override it.

## Instruction order / conflict resolution

1. Explicit current task and applicable platform/security instructions (do not silently alter unrelated existing code).
2. This contract, plus root `AGENTS.md`, `FILE_NAMING.md`, `CONTENT_ARCHITECTURE.md` and `SECURITY_TESTING_POLICY.md`, with the **later approved changes** enumerated here.
3. Original template documents in `references/original-template/` for details not superseded (especially the file layout, PHP page skeleton, forms, routing and testing).
4. Older embedded copies, archived references and illustrative examples. Reject conflicting examples rather than following them literally.

If instructions contradict unexpectedly, identify the conflict and preserve existing behavior until safely resolved. Never guess a framework or hosting capability. The original `README.md` is a generic GitLab starter, **not** an architectural specification. `company.md` is a fill-in template, never a source of real business facts.

## Standard lightweight vanilla-PHP website layout

```text
project-root/
├── .htaccess                  # if Apache and rewrite are actually used
├── AGENTS.md                  # agent rules
├── index.php                  # public homepage
├── contact.php                # public page; additional page-name.php pages
├── diensten/                  # public service subpages where appropriate
│   └── dakrenovatie.php
├── partials/
│   ├── _header.php            # metadata/head/navigation/open page shell
│   └── _footer.php            # footer/scripts/close page shell
├── handlers/
│   └── _contact_handler.php   # POST-processing endpoint, allowlisted route
├── components/                # ONLY when genuine reuse/complexity
│   └── _service-card.php
├── enums/                     # ONLY for fixed-choice fields, PHP 8.1+
│   └── _ServiceType.php
├── data/                      # ONLY for useful focused PHP arrays
│   └── _services.php
├── public/
│   ├── css/input.css          # minimal Tailwind build input (if needed)
│   ├── css/style.css          # generated Tailwind CSS, never hand edited
│   ├── js/main.js             # default client JS entry, loaded once
│   └── images/
├── sitemap.xml                # physical static XML, not PHP generated
├── robots.txt
├── company.md                 # per-project content template when supplied
├── integrations.md            # per-project setup plan, not actual credentials
└── theme.html                 # optional approved visual reference
```

This is a **default**, not permission to create unused folders or to migrate existing projects. Existing conventions take precedence for targeted modifications unless a migration is expressly requested. Do not copy these template docs to a production web root if their contents would expose sensitive details; keep agent docs, test fixtures, private PHP and Graphify outputs outside the served root or deny access with verified server configuration. An `_` filename alone provides **no access control**.

## Mandatory PHP page skeleton and shared partial contract

For each new ordinary PHP page, initialize `$page_title` and `$meta_description` **before** including `partials/_header.php`; set optional `$schema_json` to valid page-specific JSON-LD only when useful. Render the content in the page itself, then include `partials/_footer.php` once. Use stable `__DIR__`-based includes so routes do not break relative paths. For nested pages, adjust with `dirname(__DIR__)`, or a single safe project-root constant. Do not duplicate the document shell, `<main>` wrappers or header/footer includes: define one ownership convention and apply it consistently.

```php
<?php
$page_title = 'Page Title | Business Name';
$meta_description = 'Accurate and useful description of the current page.';
// Optional: $schema_json = json_encode($schema, JSON_UNESCAPED_SLASHES | JSON_UNESCAPED_UNICODE);
require __DIR__ . '/partials/_header.php';
?>
<main>
    <section class="mx-auto max-w-7xl px-6 py-16">
        <h1 class="text-4xl font-bold">Page heading</h1>
    </section>
</main>
<?php require __DIR__ . '/partials/_footer.php'; ?>
```

The header must consume `$page_title` and `$meta_description` as defined; handle optional `$schema_json` safely, set canonical/OG metadata as appropriate, and avoid inventing data. The original template may use generic CSS classes for visual layout; replace them with actual Tailwind utilities rather than adding custom styles.

## Routing, naming, content and frontend

- Descriptive unprefixed public page filenames; every **non-page** PHP implementation begins `_`, including handler endpoint files. Public handler URLs must be explicitly permitted without allowing disclosure of non-endpoint private files. Naming is not security. Preserve live routes and URL rewrites unless change is requested. `diensten/` is the template's example for services, not an unconditional requirement.
- Clean URLs via verified Apache rewrite only when supported/configured. Keep internal links, redirects, canonical tags, `robots.txt` and `sitemap.xml` aligned with **actual public URLs**; no automatic route restructuring.
- All styling is **Tailwind utility classes**, no handwritten CSS, no inline `style`, no `<style>` or `@apply`; `public/css/input.css` may contain only Tailwind-required build directives/imports for the installed version, and compiled `style.css` is generated. The source template's permissive `@apply`/custom-CSS examples are superseded. No framework-specific Tailwind CLI assumption without version check.
- Default JS entry is `public/js/main.js` referenced **once**, normally in footer. Register handlers once, use `DOMContentLoaded` or equivalent lifecycle, maintain mobile-menu `aria-expanded`, Escape/overlay/close behavior and keyboard focus; split JS into modules only when justified. No inline event handlers.
- Keep ordinary prose/HTML/SEO text in page PHP. Extract only useful repeated/editable **PHP arrays** in focused `data/_*.php`; no JSON content architecture, no wholesale page HTML extraction. `components/_*.php` only for reuse. Separate backed `enums/_*.php` for each distinct fixed-choice group and validate on server; requires PHP 8.1+, not the older template's PHP 7.4 guidance.
- Source uses actual readable line breaks (prefer <=88 chars, practical max 100); preserve design freedom and avoid unrelated formatting/refactors.

## Form processing contract

- Place processing in `handlers/_<name>_handler.php`; allow only the expected method; validate the request and inputs server-side, including enum choices; apply CSRF protection for state-changing forms, abuse/rate controls as warranted, secure email construction and output escaping. Validation and escaping are separate operations; do **not** assume `FILTER_SANITIZE_FULL_SPECIAL_CHARS` is adequate validation for every field.
- Use sessions safely, with `session_start()` before output, flash errors/success and submitted non-sensitive values, and POST-Redirect-GET (`Location` then `exit`). Redact sensitive details from logs and don't echo success tracking scripts from handlers. Form page reads and clears flash state in a predictable order; preserve any existing equivalent secure pattern.
- Never send live email, payments, production mutations or third-party analytics during tests. Verify configured email service via authorized test environment; no guarantee `mail()` works on hosting.

## SEO, integrations and security precedence

- Physical `sitemap.xml`, canonical indexable actual URL entries and truthful `<lastmod>` if known; no dynamic PHP sitemap. Do not require `<priority>` or `<changefreq>`. Dynamic structured data must describe real visible content, be valid JSON-LD and apply only to real features (e.g. do not add `SearchAction` without search).
- `references/original-template/integrations.md` is a reference checklist, **not** authorization to install GA4 or inject placeholder IDs. Confirm tracking IDs/configuration and consent requirements before enabling analytics. GA4 after consent where required; process form-completion events on redirect destination rather than echoing HTML from a handler.
- Adaptive security: discover specific threats, protect secrets/private files, use least privilege and safe headers, minimize data. Avoid speculative dependencies. Only assert tests passed if executed. Security/SEO/structure reports remain read-only and opt-in; dedicated suite may create tests but not edit application logic.
- `references/original-template/TESTING.md` is the practical aftercare catalogue, with legacy custom-CSS fixes translated to Tailwind utilities and debugging (`display_errors`) restricted to private development, never production.

## Mandatory consistency gate on relevant work

Before completing a page/structure task, check: route/page role; header/footer contract; metadata variable names; include paths; file names; Tailwind-only styles; JS included once; form/enum/flash/redirect semantics when relevant; public/private access; sitemap/robots/canonical alignment when URLs change; focused authorized tests; no unrelated project-wide migration. State BLOCKED/UNVERIFIED when a check is unavailable. For read-only audits, compare against this document without changing files.
