# Visual QA checklist (consult only for the relevant task)

Analyze *rendered* evidence, and cross-reference a verified design baseline.
All 12 categories should be considered; inspect them at different depths by
mode, and mark those not visually verified rather than silently passing them.

1. **Theme/brand discovery:** colors, font families/weights, hierarchy,
   Tailwind tokens, surfaces, button shapes, radii, shadows, photo/illustration
   style, tone and audience; distinguish approved exceptions from drift.
2. **Cross-page consistency:** header/menus, section containers, button/input
   patterns, iconography and repeated components across representative routes.
3. **Visual regressions:** unexpected changes from an approved screenshot
   baseline; identify intentionally changed areas separately.
4. **Content-image relevance:** image and icon semantics, captions, alt-text
   appropriateness, image-text coherence, section placement and call-to-action
   context. Do not confuse creative metaphor with irrelevance by default.
5. **Visual hierarchy/page flow:** heading prominence, section ordering,
   whitespace, CTA visibility, eye path and scannability.
6. **Responsive behavior:** overflow, overlap, clipping, stacking, wrapping,
   tap targets and unexpected layout changes on mobile/tablet/desktop.
7. **Interaction states:** hover, focus, active, disabled, expanded menus,
   form errors/success states and loading where renderable without side effects.
8. **Spacing/alignment:** grid, baseline alignment, repeated gutters, card
   heights, inconsistent padding, excessive empty regions.
9. **Images:** resolution relative to display size, stretching, cropping,
   focal points, aspect ratios, awkward backgrounds and inconsistent treatment.
10. **Accessibility/readability:** color contrast, type size, line length,
    focus visibility, labels, zoom/reflow and meaningful visual affordances.
    Flag untested WCAG criteria as unverified; a visual audit alone is not
    a comprehensive accessibility compliance test.
11. **Density/repetition:** overloaded sections, repeated CTA noise,
    redundant banners, overly decorative UI or thin-content visual filler.
12. **Audience/industry appropriateness:** brand character and page intent;
    avoid imposing generic style preferences or false universal rules.

## Evidence hierarchy

- Confirmed defect: direct screenshot/render/interaction evidence (or reliable
  measurable dimensions for clipping/contrast) with route/viewport/state.
- Theme inconsistency: clear comparison against approved baseline or multiple
  established patterns; explain the conflict and any permitted exception.
- Design suggestion: informed opinion, **not** a confirmed bug; explain tradeoff.

Special case: content and photography relevance may need semantic inspection of
actual images and neighboring text; CSS class inspection cannot prove this.
