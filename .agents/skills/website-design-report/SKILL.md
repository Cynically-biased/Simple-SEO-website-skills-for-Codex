---
name: website-design-report
description: >-
  Manual, strictly read-only visual design QA for PHP/Tailwind websites.
  Check theme coherence, design flaws, content/image placement, responsive
  layouts and user flow. Supports --deep and --regression, only when asked.
---

# Website Visual Design QA (manual, read-only)

Invoke **only** on explicit request:

- `$website-design-report` — efficient standard review: sample representative
  pages/components, mobile and desktop, identify important flaws and theme
  mismatches. Use a browser/rendered screenshots if available.
- `$website-design-report --deep` — comprehensive review of important routes,
  mobile/tablet/desktop, interaction states, page flows and site coherence.
- `$website-design-report --regression` — compare changed pages and components
  to **approved, existing** same-viewport baselines. Never invent baselines.

**Strictly read-only:** Do not edit source, assets, settings, DESIGN_SYSTEM.md,
Git state, generated files or screenshots in the project. No repairs, installs,
server startup with writes, screenshot storage or cache writes unless explicitly
separately authorized. No automatic audit from `$website-workflow` or any skill.

## Fast entry procedure

1. Read project `DESIGN_SYSTEM.md` if present (authoritative only when approved),
   then inspect brand references and a small representative sample. Otherwise
   infer a *provisional* theme and label it as inferred; respect intentional
   exceptions and page purposes.
2. Prefer existing browser previews/screenshots. Render only necessary pages
   when tools and safe read-only access permit. Inspect desktop and mobile for
   standard mode; tablet and interaction states in deep mode when relevant.
   If rendering is unavailable, report `VISUAL NOT VERIFIED`; do **not**
   pretend source inspection proves visual appearance or provide a definitive
   visual score.
3. Inspect the 12 categories in `references/design-checklist.md` selectively,
   using `references/visual-verification.md` for screenshot comparisons and
   `references/report-format.md` for scoring and output.
4. Distinguish confirmed defect, evidence-backed theme inconsistency, and
   subjective improvement; include page/viewport/element, evidence, severity,
   confidence, user impact and Tailwind-only suggested remedy.
5. Do not crawl every route in standard mode, re-render identical components,
   read all source files, rebuild Graphify, or run Lighthouse/SEO/testing audits.
   Use route inventory, existing screenshots and sampled templates; report
   coverage and untested areas, and stop once meaningful findings are covered.

## Boundaries

- Read-only and manual-only in **all** modes; findings never trigger fixes.
- Theme discovery is not permission to create/update `DESIGN_SYSTEM.md`.
  A separate user-requested development task may create/update an approved
  reference or capture new baselines.
- `--regression` needs a trustworthy baseline with matching viewport, route,
  interaction state and stable content. Missing baseline => NOT COMPARABLE.
- Do not infer a mismatch from aesthetics alone: verify content, context,
  audience, accessibility and explicitly approved exceptions.
- Recommend only Tailwind utility classes; zero custom CSS.
- Preserve PHP arrays/enums/handlers/components, file naming and site SEO.
- Explain when browser access, rendering, state testing or pixel comparison is
  unavailable. Do not claim tool use, exact diff metrics or live verification
  that did not happen.
- Never mix visual-quality scores with actual conversion, traffic or SEO scores.
