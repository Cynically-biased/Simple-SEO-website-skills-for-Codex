# Native browser-first Visual QA V2 — execution contract

Read only when `$website-design-report` is explicitly invoked.
These instructions are conditional: a SKILL.md cannot enable unavailable
native tools, grant permissions or create an invisible cloud browser.

## 1. Discover the environment cheaply

- Reuse the project's known site URL and existing preview. If none is known,
  inspect only relevant package/server config and entry points (e.g. index.php,
  routing rules, project docs). Do not scan every file by default.
- Build a small route/template map. Identify which pages share header, footer,
  cards and layouts. Prefer changed paths from existing Git diff if accessible.
- Prefer explicit approved `DESIGN_SYSTEM.md`, otherwise approved brand assets
  or representative rendered pages; an inferred profile is provisional.
- Never create or update `DESIGN_SYSTEM.md` during this read-only command.

## 2. Browser decision tree — in strict priority order

1. If this Codex session exposes an **integrated/native browser or preview**
   with website navigation and screenshots, use that within existing approvals.
   Reuse the opened session and local URL if supported. A native browser may be
   visible in the app; do **not** claim it is headless or cloud-hosted.
2. Otherwise, inspect **already available** page screenshots/previews with
   traceable route, viewport, date and UI state. Mark stale/unknown captures
   as limited evidence. Do not create new screenshots through external tools.
3. Otherwise, perform a clearly labeled **source-only preliminary review**
   and state `VISUAL NOT VERIFIED`; do not assign a confident visual score.

Never use computer-use/desktop control or manipulate the user's Windows mouse,
keyboard or apps. Do not silently start Playwright/Puppeteer/Selenium or install
npm/browser packages, browser plugins, MCP servers or external services. Do not
bypass security/permission prompts or claim they will never be required.

A browser running in a cloud environment cannot automatically reach a PHP site
bound to the user's local Windows `localhost`. Use an accessible preview only;
do not create a tunnel or expose a site without explicit permission.

Only start an already configured local PHP preview if runtime access and session
permissions allow it, and it can be done without source modifications,
external installs, sending real form data or causing application side effects.
Otherwise report the limitation. Running a browser does not authorize writes
or actions on the site.

## 3. Default budget and sampling

- Standard: maximum 3 distinct page templates, mobile ~390px and desktop
  ~1440px widths, normally <=6 viewport-page captures. Prefer one browser
  session and the viewport states necessary for clear evidence.
- Deep: inspect important distinct layouts/routes, mobile/tablet/desktop and
  interaction states as needed, but scope and list coverage. Do not assume
  'deep' means infinite or repeated screenshots.
- Regression: changed pages/shared components only; compare against already
  approved same-route, same-viewport, same-content/state baselines.
- If a global navigation/layout component changed, include a representative
  additional route to test for global regression.
- Screenshot reuse requires the *rendered dependencies* to be unchanged:
  PHP template and shared partials, Tailwind output, JS, images, content,
  fonts and relevant configuration. Timestamp alone is insufficient.
- No persistent cache is presumed. Reuse only evidence that is actually
  accessible now; no fake cache hits or invented baselines.
- Skip video, tracing, whole-site crawls, full Graphify indexing and unrelated
  SEO/testing/formatting reports by default.

## 4. Safety and evidence rules

- Audit is strictly read-only with respect to project source and configuration.
  Temporary browser state is allowed if necessary and permitted, but do not
  save screenshots, logs or caches inside the project. Do not change Git.
- Inspect UI states without submitting real forms, performing purchases,
  mutating production data, or triggering side-effectful requests.
- Verify visual anomalies with the actual rendered output; source-only
  conclusions must be labeled potential rather than observed.
- Give brief page/viewport/section evidence and Tailwind-only recommendations.
  If screenshots cannot be inspected by the model/tool, explicitly mark
  visual checks as unverified even if a screenshot file was created.
- Native/browser availability depends on Codex version, interface and tools;
  this workflow is a preference order and cannot force browser capability.
