# Creative Design Guidance — On-demand reference

## Creative directions

- **Balanced:** distinctive but restrained; familiar navigation and high clarity.
- **Expressive (new website default):** memorable typography, deliberate contrast,
  varied section rhythm, original grid treatments and relevant micro-interactions.
- **Experimental (only when requested or clearly fits the brief):** bold visual
  storytelling and unconventional layouts; never at the expense of comprehension,
  accessibility, performance or critical user flows.

## Direction selection

Identify the site's category, audience, desired emotion, conversion goal,
existing brand assets and the pages being built. Compare 2–3 directions
**briefly without producing full mockups or separate builds**. Select one
coherent direction. When the user supplied a visual reference, prefer it over
an invented theme. Do not repeatedly ask for preferences already established.

## Visual craft

- Choose a strong but usable typographic hierarchy; vary composition by section.
- Create appropriate density and whitespace; avoid monotony and card overload.
- Place imagery and supporting text so their meaning is immediately clear.
- Use intentional asymmetry, layering, negative space, or editorial treatment
  if these clarify the story. Not every page needs unusual effects.
- Make the primary action clear; use conventional navigation and accessible forms.
- Build mobile layouts deliberately; do not simply crush desktop compositions.
- Use Tailwind responsive/state utilities, semantic markup and existing site
  conventions. Do not introduce custom CSS or `@apply` as a shortcut.
- Avoid gratuitous animation, layout shifts, inaccessible motion and heavy
  dependencies for simple design effects.

## Work-type behavior

| Work type | Design behavior |
| --- | --- |
| New site | Full creative exploration within brief; choose one cohesive direction |
| New page in existing site | Preserve palette/branding; vary page composition purposefully |
| Routine code repair, SEO fix or format | Preserve layout and branding unless design change requested |
| Explicit redesign | Allow necessary cross-component/page changes inside approved scope |
| User asks for multiple concepts | Produce only the requested number, then await selection if needed |

## Creative budget / usage efficiency

- Reuse actual site design tokens, components and content rather than inventing
  additional systems for small changes.
- Do not browse for inspiration, generate images, or run visual tests unless
  requested and authorized; no requirement to install external plugins.
- Build one direction, one bounded page/component group at a time.
- Do not rewrite unchanged files or generate multiple design variants by default.
- For substantial redesigns, optimize for design quality within the requested
  scope rather than blocking justified changes under minimal-diff guidance.
- Use short deliverable summaries; do not narrate extensive design deliberation.

## Acceptance checks for code you changed (not a visual audit)

- Design responds to the audience and user brief, not a stock template.
- Existing branding survives unless explicitly replaced.
- Layout and imagery support content rather than distract from it.
- Links, labels, focus states, responsive behavior and SEO content remain usable.
- Tailwind-only implementation, no custom styling, with readable source lines.
- Ordinary code edits have not triggered unsolicited redesigns.
