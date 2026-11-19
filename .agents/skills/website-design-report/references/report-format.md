# Visual QA report contract

Produce a **read-only** report, not edits. Use this structure:

1. Mode; source of visual evidence (URL/screenshot/tool), timestamp if known;
   theme baseline used (approved/inferred/none); and constraints.
2. Coverage: routes/pages inspected vs discovered, unique templates,
   viewports, states, journeys, screenshots/baselines compared; NOT VERIFIED.
3. Scores **only** for areas supported by rendered visual evidence. Show
   category scores 1–10 and an overall **visual design quality** score 1–10
   when justified. Otherwise state `NO RELIABLE VISUAL SCORE`.
4. Findings table: ID, type (defect/inconsistency/opportunity), severity,
   confidence, page/viewport/state, evidence, expected vs observed,
   user impact, recommended Tailwind-only remedy, and confidence limits.
5. Top prioritized corrections and intentionally accepted theme exceptions.
6. Unverified items and useful next checks; no speculative ranking claims.

## Default category weights

- Theme and branding consistency: 25%
- Layout and visual hierarchy: 20%
- Content/image relevance: 20%
- Responsive visual quality: 15%
- Usability and page flow: 10%
- Typography/readability/accessibility signals: 10%

Score only categories with sufficient evidence. Exclude unverified categories
from the numerical aggregate and explicitly report coverage, rather than
counting missing evidence as a pass. A low-coverage score must be labeled
`PARTIAL, LOW CONFIDENCE`; do not claim an overall site assessment from one
screenshot. Severe verified functional visibility defects should be called out
regardless of a numerical average.

## Severity and certainty

- Critical: primary flow blocked or content completely inaccessible.
- High: major content/CTA invisible, serious clipping, severe legibility issue.
- Medium: significant confusion or clear site-wide inconsistency.
- Low: minor polish, spacing or alignment issue.
- Opportunity: subjective proposed improvement, not a defect.

Confidence high/medium/low depends on **direct evidence**, comparison quality,
impact scope and whether intent is known. Provide page and screenshot
coordinates or sections where available; source file references if mapped.

## User journeys (deep mode)

Check at least the primary appropriate visitor journey, such as landing ->
service/product -> CTA -> contact form, without sending real submissions.
Identify whether each action is obvious and whether the page explains what
comes next. Distinguish demonstrated interaction failures from assumptions.

## Regression (regression mode)

Report changed routes and shared components, matched baseline pairs,
intentional differences, potential regressions and uncomparable cases.
Never manufacture a before-image or claim pixel-perfect evaluation without
an actual comparison tool.
