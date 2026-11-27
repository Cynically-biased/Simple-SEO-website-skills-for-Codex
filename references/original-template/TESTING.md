# Aftercare & Testing Guide

Common issues that come up after building sites with this template. Check these before every handoff.

---

## Mobile Navigation

### Menu doesn't open / opens twice / fires multiple times
**Cause:** Multiple event listeners attached to the hamburger button. Happens when `main.js` is included more than once (e.g., both in header and footer), or when the script runs outside `DOMContentLoaded` and gets re-executed.

**Fix checklist:**
- [ ] `main.js` is included exactly once (should be in `_footer.php` only, before `</body>`)
- [ ] All event listeners are inside a single `DOMContentLoaded` callback
- [ ] No inline `onclick` handlers on the hamburger that conflict with JS listeners
- [ ] No duplicate `<script src="main.js">` tags (check both partials)

### Menu opens but doesn't close
**Cause:** The close logic targets a different element or class than the open logic. Often happens when the toggle button markup changes but the JS selector doesn't.

**Fix:** Ensure the toggle button selector in JS matches the actual HTML. Check that the `aria-expanded` attribute is being toggled correctly.

### Menu stays open after clicking a link
**Cause:** No listener to close the menu on nav link click.

**Fix:** Add click listeners on `.nav-link` elements inside the mobile menu that also close the menu and remove the overlay.

### Overlay doesn't disappear
**Cause:** The overlay element is created/shown on menu open but the close function only hides the nav, not the overlay.

**Fix:** The close function must toggle both the nav visibility AND the overlay. Use a single `closeMenu()` function called from all close triggers (X button, overlay click, Escape key, nav link click).

---

## Forms

### Form submits but no email arrives
**Cause (90% of the time):** PHP `mail()` doesn't work on the hosting environment without SMTP config.

**Fix checklist:**
- [ ] Check spam/junk folder first
- [ ] Verify PHP `mail()` is enabled: `<?php var_dump(function_exists('mail')); ?>`
- [ ] Check server error log: `/var/log/apache2/error.log`
- [ ] If shared hosting, ask host about `mail()` restrictions
- [ ] Consider PHPMailer with SMTP as a more reliable alternative

### Form data lost after validation error
**Cause:** Session data is being `unset()` before it's used, or `session_start()` is missing from the form page.

**Fix:** Ensure `session_start()` is the very first thing in the form page (before any output). Read session data into local variables, then unset.

### Form resubmits on page refresh
**Cause:** POST-redirect-GET pattern not implemented — the handler isn't redirecting after processing.

**Fix:** Every handler must end with `header('Location: ...')` followed by `exit`. Never output HTML from a handler.

### Success/error message doesn't show
**Cause:** Session flash data cleared before rendering, or the page doesn't check `$_SESSION` keys.

**Fix:** Follow this exact order in the form page:
```php
session_start();
$errors = $_SESSION['form_errors'] ?? [];
$success = $_SESSION['form_success'] ?? '';
unset($_SESSION['form_errors'], $_SESSION['form_data'], $_SESSION['form_success']);
// Now render the page using $errors and $success
```

---

## Clean URLs

### Pages return 404 with clean URLs
**Cause:** `mod_rewrite` not enabled or `.htaccess` not being read.

**Fix checklist:**
- [ ] Run `apache2ctl -M | grep rewrite` to check mod_rewrite
- [ ] Check `AllowOverride All` is set in the Apache vhost config
- [ ] Verify `.htaccess` is in the project root (not a subdirectory)
- [ ] Restart Apache after config changes

### Infinite redirect loop
**Cause:** The rewrite rule that removes `.php` and the rule that adds `.php` internally are conflicting.

**Fix:** Ensure the `.htaccess` has a `RewriteCond` that checks the actual file exists before rewriting:
```apache
RewriteCond %{REQUEST_FILENAME}.php -f
RewriteRule ^(.+)$ $1.php [L]
```

### Handler URLs break with clean URL rules
**Cause:** The clean URL redirect is also catching `/handlers/*.php` paths.

**Fix:** The `.htaccess` must exclude the handlers directory:
```apache
RewriteCond %{REQUEST_URI} !^/handlers/
```

---

## Styling & Layout

### Styles not updating after changes
**Cause:** Browser cache serving the old `style.css`.

**Fix:** Add a cache-busting query string:
```php
<link rel="stylesheet" href="/public/css/style.css?v=<?php echo filemtime('public/css/style.css'); ?>">
```

### Layout breaks at specific screen widths
**Cause:** Missing or incorrect media query breakpoints. Usually the 640px-1024px tablet range is forgotten.

**Fix:** Test at these widths specifically: 320px, 375px, 640px, 768px, 1024px, 1280px. The most missed breakpoint is tablet landscape (1024px) where desktop layout kicks in but content is too cramped.

### Footer not at bottom on short pages
**Cause:** Page content isn't tall enough to push the footer down.

**Fix:** Use flexbox on the body:
```css
body {
    display: flex;
    flex-direction: column;
    min-height: 100vh;
}
main { flex: 1; }
```

### Cards/grid items different heights
**Cause:** Content length varies and cards aren't using equal height.

**Fix:** Use `display: grid` on the container (not flexbox) and let grid handle equal heights. Or use `align-items: stretch` with flex.

---

## SEO & Schema

### Schema.org validation errors
**Cause:** Usually a missing required property or malformed JSON.

**Fix checklist:**
- [ ] Test with Google Rich Results Test: https://search.google.com/test/rich-results
- [ ] Check JSON syntax (trailing commas break it)
- [ ] Ensure all URLs are absolute (include `https://`)
- [ ] Use `JSON_UNESCAPED_SLASHES` flag in `json_encode()`

### Meta description showing wrong text in Google
**Cause:** Google sometimes ignores meta descriptions and pulls page content instead. Or `$meta_description` is not being set before the header include.

**Fix:** Verify `$meta_description` is set before `include 'partials/_header.php'`. Keep descriptions between 150-160 characters. If Google still overrides it, the content may be more relevant — this is normal behavior.

### Open Graph image not showing on social share
**Cause:** Image path is relative instead of absolute, or image doesn't exist.

**Fix:** OG image must be a full URL: `https://yourdomain.com/public/images/og-image.jpg`. Minimum size 1200x630px. Test with Facebook Sharing Debugger.

---

## PHP / Server

### Blank white page (no errors shown)
**Cause:** PHP fatal error with `display_errors` off (typical in production).

**Fix:** Temporarily enable error display:
```php
ini_set('display_errors', 1);
error_reporting(E_ALL);
```
Or check the server error log. Common causes: syntax error, missing include file, wrong file path.

### Include paths break when URL rewriting is active
**Cause:** `include 'partials/_header.php'` uses a relative path that breaks depending on the rewritten URL.

**Fix:** Use paths relative to the document root:
```php
include __DIR__ . '/partials/_header.php';
```
Or set a base path constant at the top of each page.

### Session not working (form flash messages lost)
**Cause:** `session_start()` called after output has already been sent (even a blank line before `<?php` counts).

**Fix:** Ensure `<?php` is the very first character in the file — no whitespace, no BOM, no blank lines before it. Check `_header.php` too.

---

## Accessibility

### Focus trap not working in mobile menu
**Cause:** Tab key moves focus to elements behind the overlay.

**Fix:** When the mobile menu is open, trap focus within it. On close, return focus to the hamburger button. At minimum, handle `Escape` key to close the menu.

### Form errors not announced by screen readers
**Cause:** Errors appear visually but aren't associated with the form fields.

**Fix:**
- Add `aria-describedby` on the input pointing to the error message element
- Add `role="alert"` on the error container so it's announced when it appears
- Add `aria-invalid="true"` on fields with errors

---

## Pre-Handoff Checklist

Run through this before delivering any site:

- [ ] All pages load without PHP errors/warnings
- [ ] Mobile menu opens, closes, and links work
- [ ] All forms submit, validate, show errors, show success
- [ ] Email delivery works (test with real email)
- [ ] Clean URLs work (no .php in browser)
- [ ] No console errors in browser dev tools
- [ ] Site looks correct at 375px, 768px, 1024px, 1440px
- [ ] All images have alt text
- [ ] Schema.org validates without errors
- [ ] Meta titles and descriptions are unique per page
- [ ] Footer sticks to bottom on short pages
- [ ] 404 page works for nonexistent URLs
- [ ] favicon is set
- [ ] HTTPS works (no mixed content warnings)
