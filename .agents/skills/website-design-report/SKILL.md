---
name: website-design-report
description: >-
  Manual, strictly read-only visual design QA for PHP/Tailwind websites.
  Check theme coherence, design flaws, content/image placement, responsive
  layouts and user flow. CLI-first headless Edge/Chrome discovery, bounded
  checks, and optional --deep/--regression; manual only.
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
Git state, generated files or screenshots in the project. No repairs or installs, no source/configuration writes, and no screenshot
or cache writes into the project. A pre-existing, permitted preview may be
used; only launch a local development server when safe, supported and already
authorized by the session, without triggering installs or application mutations. No automatic audit from `$website-workflow` or any skill.

## One-command CLI headless inspection (Visual QA V3)

When invoked from **Codex CLI / PowerShell**, run this procedure automatically,
within existing terminal permissions. No desktop app, Computer Use, browser
plugin, Playwright or Selenium required.

1. **Discover narrowly:** reuse a known local preview URL, or inspect the PHP
   entry point, route configuration and existing server. Prefer the already
   running local site; only start a safe temporary PHP development server if
   allowed and required. Do not modify project files or trigger build/install.
2. **Capture invisibly:** read `references/cli-headless-execution.md` and use
   direct, permitted PowerShell **commands** to locate installed Edge/Chrome
   and launch its executable with `--headless --screenshot`. Do **not** execute
   any `.ps1` script or change PowerShell execution policy. The browser must
   not interact with the Windows desktop. If commands are unavailable, use
   existing reliable captures or mark VISUAL NOT VERIFIED.
3. **Inspect images:** open the produced screenshots using an image-capable
   Codex tool *if one is exposed*. A screenshot existing on disk does not
   mean Codex has visually inspected it. If no image-reading tool is
   available, mark `VISUAL NOT VERIFIED` and offer screenshot paths.
4. **Fallback:** if no headless-capable browser is installed, use already
   available screenshots with verifiable context; otherwise provide a
   source-only preliminary review labeled `VISUAL NOT VERIFIED`. Never
   install browser tooling or change to desktop control without consent.
5. **Budget:** default <=3 distinct page templates, mobile-width (~390 px)
   and desktop (~1440 px), <=6 captures. Deep mode covers justified routes,
   tablet, important states and journeys with a declared cap. Regression
   compares changed pages only to genuinely approved, comparable baselines.
   CLI screenshot flags alone do not simulate touch interactions or a mobile
   user agent; label mobile captures as *mobile-width desktop-browser*.
6. **Analyze:** use approved `DESIGN_SYSTEM.md` if present; otherwise infer
   a provisional theme from actual captures, identify defects and theme
   mismatches using `references/design-checklist.md`.
7. **Report briefly:** cite route/viewport/screenshot evidence, severity,
   confidence, applicable Tailwind-only recommendations and unverified areas.
   Never invent a visual score. Avoid rerendering identical shared layouts.

All modes stay **manual-only** and read-only with respect to the website.
Temporary screenshots and isolated browser profiles may be written under the
OS temporary directory, never in the project. Remove temporary browser
profiles and stop any preview server started solely for the audit.

Only read the relevant detailed references for the selected mode:
`references/cli-headless-execution.md`, `references/visual-verification.md`,
`references/report-format.md` and the targeted design checklist.

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
