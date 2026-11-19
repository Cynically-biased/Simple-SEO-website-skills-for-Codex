# Visual verification, baselines, efficiency

## Establish a theme baseline

1. Use project `DESIGN_SYSTEM.md` only if present and approved; otherwise
   review official brand assets/style guides and representative rendered pages.
2. Infer a provisional theme only when no documented baseline exists.
3. Document colors, type scale, spacing, grid, radius, cards, imagery, icons,
   buttons/inputs, tone, audience and legitimate intentional exceptions.
4. Never overwrite existing theme documentation in a read-only report.
5. For future persistence, recommend the optional template at root
   `DESIGN_SYSTEM_TEMPLATE.md`; writing `DESIGN_SYSTEM.md` is a separate,
   explicitly requested development action.

## Browser execution and capture constraints

Follow `cli-headless-execution.md` first: use installed Edge/Chrome via the
bundled PowerShell headless script in Codex CLI; existing screenshots second,
source-only unverified fallback last. Never perform Windows desktop control,
install external browser packages or pretend a created screenshot was visually
inspected. Use a small change-aware page sample and record coverage.

## Screenshot capture / comparison

- Prefer user-provided or already existing screenshots/baselines; browser
  automation only when available and authorized. Do not invent screenshots.
- For consistent comparison fix viewport width/height, device scale, route,
  content fixtures, fonts, animation state, scroll position and UI state.
- Exclude volatile timestamps, rotating content, personalized content,
  cookie banners and animations as needed, noting any masking.
- Compare geometry/structure, content alignment and semantics; use automated
  visual diffs only if tooling is actually available. A pixel delta alone
  does not prove a user-visible defect; examine differences and intent.
- For `--regression`, compare only pages/components with approved baselines;
  indicate unchanged, intended change, unintended change, or unverified.
  If no baseline exists, say `NOT COMPARABLE — no approved baseline`.

## Read-only constraints

Do not install browsers, launch servers that modify project/cache state,
write screenshots into the repository, alter snapshot goldens, trigger form
submissions with side effects or run a write-producing build as part of this
report. When safe rendering is unavailable, request a screenshot or
recommend a separate, authorized setup step; continue with limited source-
based risk assessment without claiming rendered proof.

## Token-aware execution budget

Standard mode:
- Inventory routes and shared template families once, without copying all files.
- Inspect homepage plus a representative page for each materially distinct
  layout; prioritize changed or user-named pages, avoid repeat screenshots of
  identical shared components.
- Desktop and mobile views for sampled pages, where available.
- Stop after sufficient evidence for actionable findings; record exclusions.

Deep mode:
- Inspect all important distinct routes/templates and critical journeys.
- Add tablet/intermediate widths and consequential interactive states.
- Reuse validated existing screenshots; sample repeated identical templates.
- Avoid full-site browser crawls or unrelated code rereads if unnecessary.

Regression mode:
- Use Git changed-page impact and shared component dependencies to scope work.
- Compare only approved baseline pairs of affected routes/states.
- Reuse existing artifacts and report comparison coverage.

All modes:
- Never rebuild Graphify or invoke other audit commands as a prerequisite.
- Graphify is optional for quickly finding which pages share a component;
  use existing graph if valid, otherwise inspect directly without indexing.
- Keep final output concise; expand evidence for significant issues only.
