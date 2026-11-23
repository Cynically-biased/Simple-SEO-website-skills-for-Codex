> Historical reference only. Current AGENTS.md and active skills supersede all conflicting technical, creative, efficiency and verification instructions.

# Simple PHP Website Template

## Project Overview

Lightweight, SEO-optimized PHP website template for small businesses (restaurants, bakeries, local services). Vanilla PHP, no frameworks, no build tools. Mobile-first, minimal dependencies.

## Directory Structure

```
project-root/
├── .htaccess                    # Apache config, URL rewriting, security headers
├── index.php                    # Homepage
├── [page-name].php              # Individual pages (kebab-case)
├── partials/
│   ├── _header.php              # Site header, nav, meta tags, Schema.org
│   └── _footer.php              # Site footer, scripts
├── handlers/
│   └── [form]_handler.php       # Form processing (POST only)
├── diensten/                    # Service subpages
├── public/
│   ├── css/input.css            # Tailwind source (directives + @apply)
│   ├── css/style.css            # Compiled Tailwind output (do not edit)
│   ├── js/main.js               # Single JS file
│   └── images/                  # All image assets
├── company.md                   # Business info reference (fill in per client)
├── integrations.md              # External services & integrations guide
└── theme.html                   # Visual design reference (live HTML mockup)
```

## Naming Conventions

- Pages: kebab-case (`catering-aanvraag.php`), single-word lowercase (`menu.php`)
- Partials: underscore prefix (`_header.php`, `_footer.php`) — never accessed directly
- Handlers: `_handler` suffix (`contact_handler.php`) in `/handlers/`
- Assets: single `main.js`, images use descriptive kebab-case names
- CSS: use Tailwind utility classes inline — avoid custom CSS classes unless necessary

## Page Template

Every page follows this exact pattern:

```php
<?php
$page_title = 'Page Title | Business Name';
$meta_description = 'SEO description, 150-160 chars';

// Optional: page-specific Schema.org
$schema_json = json_encode([
    "@context" => "https://schema.org",
    "@type" => "WebPage",
], JSON_UNESCAPED_SLASHES | JSON_UNESCAPED_UNICODE);

include 'partials/_header.php';
?>

<section class="section">
    <div class="container">
        <h1>Page Heading</h1>
    </div>
</section>

<?php include 'partials/_footer.php'; ?>
```

Always set `$page_title` and `$meta_description` before including the header.

## Header Partial Expectations

The header expects these variables from the page file:
- `$page_title` (required) — used in `<title>` and OG tags
- `$meta_description` (required) — used in meta description and OG tags
- `$schema_json` (optional) — page-specific Schema.org JSON-LD

The header includes: base LocalBusiness schema, responsive nav with mobile menu, Open Graph tags, security meta tags.

## Form Handler Pattern

All forms use POST-redirect-GET with session flash messages:

1. Handler in `/handlers/` — only accepts POST, redirects on GET
2. Sanitize with `filter_input()` and `FILTER_SANITIZE_FULL_SPECIAL_CHARS`
3. Validate, store errors in `$_SESSION['form_errors']`
4. Preserve input in `$_SESSION['form_data']` on failure
5. Success message in `$_SESSION['form_success']`
6. Always `exit` after `header('Location: ...')`

Form pages must `session_start()` at top and `unset()` session flash data after reading.

## URL Routing

`.htaccess` handles clean URLs:
- `contact.php` is served at `/contact`
- `.php` URLs 301-redirect to clean versions
- `/handlers/` directory is excluded from clean URL rewriting
- Directory listing disabled, security headers set, GZIP enabled

## CSS Architecture

Use **Tailwind CSS** (installed via npm) for all styling. Apply utility classes directly in HTML — do not write custom CSS unless absolutely necessary.

- Tailwind is installed as a project dependency (`npm install`)
- Source CSS in `public/css/input.css` with Tailwind directives (`@tailwind base; @tailwind components; @tailwind utilities;`)
- Compiled output goes to `public/css/style.css` (generated, do not edit directly)
- Run `npx tailwindcss -i public/css/input.css -o public/css/style.css --watch` during development
- `tailwind.config.js` at project root — configure colors/fonts from `theme.html` here
- Use Tailwind's responsive prefixes (`sm:`, `md:`, `lg:`, `xl:`) instead of custom media queries
- Use `@apply` sparingly in `input.css` only when a utility pattern is repeated many times

## JavaScript

Single file `public/js/main.js`, all code inside `DOMContentLoaded`. Handles:
- Mobile nav toggle with overlay
- Conditional form fields
- Keyboard accessibility (Escape to close menu)
- ARIA attribute management

## Design Reference

`theme.html` in the project root is the visual design reference. It's a live HTML mockup — open it in a browser to see the intended look and feel. Extract colors, fonts, spacing, and component styles from this file rather than hardcoding assumptions.

## SEO Requirements

Every page must have:
- Unique `$page_title` and `$meta_description`
- Schema.org JSON-LD (base schema in header, page-specific optional)
- Semantic HTML (`<article>`, `<section>`, `<nav>`)
- Alt text on all images
- Clean URLs (no .php extensions)

## Security Rules

- Always `htmlspecialchars()` when outputting any user/dynamic data
- Always `filter_input()` on POST data
- Validate emails with `FILTER_VALIDATE_EMAIL`
- Handlers in separate directory, POST-only
- Sessions for form state, never expose raw input
- HTTPS in production

## When Adding a New Page

1. Create `page-name.php` in root
2. Set `$page_title` and `$meta_description`
3. Include header and footer partials
4. Add nav link in `partials/_header.php` with active state check
5. Add page-specific Schema.org if relevant
6. Update sitemap.xml

## When Adding a New Form

1. Create form page with session flash handling
2. Create handler in `/handlers/[name]_handler.php`
3. Follow the handler pattern (sanitize, validate, redirect)
4. Configure email settings
5. Test validation edge cases

## Deployment Requirements

- PHP 7.4+ (8.0+ recommended)
- Apache with mod_rewrite and mod_headers enabled
- `AllowOverride All` in Apache config
- Mail server configured for contact forms
