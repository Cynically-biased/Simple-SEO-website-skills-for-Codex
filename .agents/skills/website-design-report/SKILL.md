---
name: website-design-report
description: >-
  Manual, strictly read-only visual design QA for PHP/Tailwind websites.
  Check theme coherence, design flaws, content/image placement, responsive
  layouts and user flow. Native-browser-first automatic discovery, bounded
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

## One-command automatic inspection (Visual QA V2)

When invoked, **execute the following steps without requesting routine setup
information already discoverable from the project**. Never promise that a native
browser is available; use only tools actually exposed in this Codex session.

1. **Discover** the existing site entry point, runnable URL (if configured),
   route list and approved `DESIGN_SYSTEM.md` from a narrow project inspection.
   Read `references/native-browser-execution.md` for the exact decision tree.
2. **Inspect natively first:** use Codex-provided browser/preview/screenshot
   capabilities if actually available and permitted. Prefer an already running
   preview. Never use Computer Use, remote desktop, mouse/keyboard control,
   external browser integrations, or automatic Playwright/npm installations.
3. **Fallback safely:** use existing supplied/project preview screenshots when
   native rendering is unavailable; otherwise report `VISUAL NOT VERIFIED`.
   Never pretend a browser was opened. Do not repeatedly ask the user to set
   up tooling; report the specific missing capability once.
4. **Scope intelligently:** normal mode inspects up to **3 distinct page
   templates**, **mobile + desktop**, and only meaningful interaction states.
   Prefer changed/representative pages, with homepage and a unique inner page.
   In `--deep`, include important routes, tablet, flows and state variants as
   justified by the request; declare any sampling or inspection cap.
   In `--regression`, inspect only changed pages and their affected shared
   components against *existing approved* comparable baselines.
5. **Compare against the theme:** approved design reference first; otherwise
   infer a labeled provisional theme from visible representative pages. Check
   visual flaws, image/text meaning, page flow, theme conflicts, usability and
   responsive defects using `references/design-checklist.md`.
6. **Reuse evidence:** reuse already captured screenshots *only* when URL,
   viewport, content, styles, assets and UI state are equivalent. Prefer one
   browser session, no redundant rerenders, no repeated shared-component audit.
   Do not store screenshots or cache in the project during a read-only audit.
7. **Report compactly:** use `references/report-format.md`; include evidence,
   exact route/viewport/section, severity, confidence and proposed Tailwind-only
   remedy, plus coverage and unverified items. Summarize top findings, not long
   descriptions of passing checks. Never fabricate visual scores.

Read `references/visual-verification.md` only for comparisons/baselines,
`references/native-browser-execution.md` for browser strategy, and
`references/report-format.md` for the output contract. Load only relevant
sections, not every skill or unrelated project files.

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
