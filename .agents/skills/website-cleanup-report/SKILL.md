---
name: website-cleanup-report
description: >-
  Manual, strictly read-only PHP/Tailwind website cleanup and necessity audit.
  Default mode efficiently detects unused and clearly redundant code; --deep
  traces referenced-but-unnecessary functionality, overengineering and
  opportunities to simplify. Never delete or modify files.
---

# Website cleanup report V2 (manual, read-only)

Invoke **only** when requested:

- `$website-cleanup-report` — efficient standard audit, covering all ten
  categories at lightweight depth and deeply inspecting only clear candidates.
- `$website-cleanup-report --deep` — broad necessity and simplification review,
  including referenced code paths, side effects, runtime/deployment contracts,
  and more complete dependency tracing when evidence is accessible.

Both modes are **strictly read-only**. Never remove, rename, reformat, edit,
install/uninstall, regenerate, or modify source, generated assets, Git state,
indices, caches or configuration. No automatic fixes. Do not start this audit
from `$website-workflow` or any other skill. An explicit separate user request
is required for changes.

## Required detection categories (both modes)

1. Unreferenced files, code, assets, directories and dependencies.
2. Referenced-but-unnecessary files/functions (trace callers and actual effects).
3. Duplicate or functionally redundant implementations.
4. Unnecessary components, wrappers and abstractions.
5. Overengineered architecture and avoidable layers.
6. Unnecessary third-party dependencies, considering build/runtime/scripts.
7. JavaScript that is redundant or safely replaceable with native behavior.
8. Legacy features still wired into the application but no longer serving a
   confirmed requirement (do not presume old means obsolete).
9. Pointless variables, transforms, no-op helpers and avoidable indirection.
10. Excessive file splitting that complicates maintenance without clear benefit.

## Evidence and safeguards

- Start from a lightweight inventory, relevant entry points and Git metadata.
  Prefer scoped searches and reuse valid existing Graphify data only when useful.
  Do not build/update a graph for this read-only audit.
- Do **not** equate "referenced" with "needed" or "unreferenced" with "safe
  to delete". Trace behavior, consumers, dynamic entry points and potential
  side effects before recommending removal.
- Respect project rules: `_`-prefixed PHP implementation files, one enum per
  choice category, form handlers, components, modular PHP arrays, Tailwind
  build assets, sitemap/robots and security/accessibility/SEO features are not
  redundant merely because they are small or not visibly rendered.
- Never assume an external integration, background task or legacy capability
  is unnecessary without evidence of its intended use.
- Every finding needs file:line evidence where available, known consumers,
  observed behavior, rationale, risk/impact, confidence (high/medium/low),
  proposed simplification, and a manual verification plan.
- Clearly label unverified conclusions and coverage exclusions. A limited
  audit cannot justify a claim that the entire project is clean.
- Standard mode: stop after useful targeted inspection; don't recursively read
  everything. Deep mode: inspect more broadly, but avoid unnecessary repeated
  reads, vendor trees and media binaries.
- Follow `references/cleanup-checklist.md` for detailed operating procedure,
  finding standards and report structure; consult it only when invoked.

The command remains separate from `$website-structure-report`,
`$website-test-report`, `$website-seo-report`, and `$website-format-code`.
Root `AGENTS.md` remains authoritative.
