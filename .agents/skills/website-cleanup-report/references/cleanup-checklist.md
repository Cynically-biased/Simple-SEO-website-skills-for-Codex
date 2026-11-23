# Cleanup report V2 — detailed procedure and evidence contract

## Safety and scope

Both `$website-cleanup-report` and `$website-cleanup-report --deep` are **manual
and strictly read-only**. Never edit/delete/rename files, reformat, uninstall,
prune, write audit artifacts, update Graphify indices, run mutating application
or build commands, or modify Git. No `rm`, `del`, `Remove-Item`, `git clean`,
`git reset`, deletion scripts or auto-fix commands. Do not execute untrusted
application code to prove a theory. Separate user permission is mandatory for
any later cleanup.

## Modes and depth

**Standard (default):** Identify every category below using lightweight
project inventory, entry points, relevant manifests, existing dependency data
and targeted searches. Examine clearly suspicious behavior in enough detail to
produce defensible findings. Do not promise exhaustive whole-project analysis.

**Deep (`--deep`):** Go beyond reference counting. Trace actual execution or
render paths for suspicious *referenced* code; examine public routes, form
submissions, PHP includes/autoloading, JS event handlers, side effects and
runtime/deployment integration where evidence is accessible. Compare related
implementations and architecture layers. Expand selectively to uncovered
areas, avoid repeated whole-file reads and report any inaccessible runtime or
external consumers. Deep does not mean permission to change files.

## All ten detection categories

1. **Unused:** orphan source, unused functions/classes/variables, unreferenced
   assets, empty/forgotten folders, obsolete copies/backups and potential
   unused packages. Account for indirect references before recommending.
2. **Referenced but unnecessary:** no-op helpers, gratuitous includes or
   transformations, needless intermediate files/dispatchers, unnecessary
   duplicated rendering paths. Examine actual effects, not only references.
3. **Duplicate functionality:** two implementations serving the same purpose;
   compare behavior, inputs, output, validation, security and edge cases.
4. **Unnecessary abstractions:** wrappers/components/classes whose overhead
   demonstrably outweighs reuse or separation of responsibilities. Being short
   or used once is not sufficient evidence.
5. **Overengineering:** excessive layers, adapters, abstractions or complex
   inheritance for straightforward behavior; demonstrate simpler equivalent
   design and preserved contracts.
6. **Dependency bloat:** packages used only for trivial behavior or only by a
   removed feature; inspect composer/npm manifests, lockfiles, build steps,
   transitive usage, CLI scripts and deployment before calling unnecessary.
7. **Redundant JavaScript:** JS with no effect or unnecessary reimplementation
   of available browser behavior; verify accessibility, progressive
   enhancement, form validation and browser support before recommending removal.
8. **Legacy still referenced:** retired routes, feature flags, handlers, data
   sources or obsolete integrations. Require evidence that the feature is no
   longer a requirement; otherwise mark "Needs owner confirmation".
9. **Pointless code:** unused assignments, identity functions, transformations
   that cannot affect output, superfluous indirection; check logging, IO,
   registration, mutation, exceptions and security side effects.
10. **Excessive file fragmentation:** tiny single-purpose files or nested
    wrappers that complicate comprehension, but preserve mandatory separation
    of handlers, enums, shared components and reusable PHP data.

## Efficient, evidence-led inspection

1. Establish root, scope, Git status/paths, key page routes, public entry
   points, dependency manifests and web/build/deploy configurations. Do not
   dump the repository or read binaries in full.
2. Look for suspicious candidates via file names, duplicate hashes, manifest
   clues, patterns, call graphs and references. These are leads, not proof.
3. For each plausible candidate, inspect definition, direct/indirect callers
   and what the code actually contributes (outputs, return values, state,
   exceptions, side effects, lifecycle, security and deployment effects).
4. Cross-check PHP static/dynamic include/require, namespaces, autoloaders,
   enums, handlers, forms, routes, .htaccess, web server rewrites, templates,
   reflection, cron/queues, webhook endpoints, environment flags, CI/CD,
   JS dynamic imports and externally referenced assets.
5. When behavior is duplicated, explain precisely why it is equivalent and
   what would need changing to consolidate; do not assume similar code is
   safely interchangeable.
6. Use an existing relevant Graphify graph if available and trustworthy; do
   not trigger costly graph generation/reindex or full-project tests by
   default. Avoid scanning `vendor/`, `node_modules/`, `.git`, generated media
   and huge build trees; inspect their manifests or integration points.
7. Deep mode expands coverage to suspicious referenced code and architecture,
   recording scanned and unscanned areas. In standard mode, stop when enough
   evidence supports useful prioritized results.

## Mandatory protections

- A `_` prefix indicates a non-page PHP module, **not** unused code. Never
  propose merging all enums into one file or extracting entire page HTML into
  data files. One enum per choice domain and separate handlers/partials remain
  project requirements.
- Protect security checks (CSRF, validation, auth, escaping), accessibility,
  consent/privacy mechanisms, SEO tags, canonical metadata, `sitemap.xml`,
  `robots.txt`, Tailwind source/build pipeline and generated deployment CSS.
- Protect source/deployment configuration, `AGENTS.md`, `.agents/`, lockfiles,
  licensing, migration history, docs with an active purpose, backups, user
  uploads, databases and secrets. Never expose secret values.
- A stale-looking file, no static references, small filesize, old timestamp,
  zero Git changes or strange filename is **not** proof of safe deletion.
- Runtime side effects (logging, events, validation, registration, cache
  invalidation, IO, failure handling) can make apparently trivial code vital.
- If purpose cannot be established, mark uncertainty. Do not remove features
  on the assumption that they are unnecessary from a product perspective.

## Finding confidence (independent from severity and risk)

- **High confidence** — demonstrated redundancy/non-contribution supported
  by code paths and use-site evidence; still verify before removal.
- **Medium confidence** — convincing candidate but incomplete runtime,
  external usage or behavior evidence; requires specific follow-up.
- **Low confidence** — optional simplification or subjective architecture
  improvement; don't label as safe to delete.
- **Keep / protected** — concrete active use, mandatory convention, critical
  security/runtime role, or insufficient evidence to recommend removal.

Record **impact** (time, complexity, bytes where measured) and **removal risk**
(low/medium/high) separately from confidence. Prefer meaningful maintainability
benefits over a large count of trivial "issues". No invented byte savings.

## Required report output

Title: `Website cleanup report V2 (read-only)`.

1. **Mode and coverage:** standard/deep, site root, paths/routes inspected,
   key exclusions and limits, availability/staleness of Git/Graphify and
   runtime/deployment verification.
2. **Summary:** confirmed unused vs referenced-but-unnecessary candidates,
   duplicate/overengineered candidates, confidence counts, highest risks,
   areas not verified. If nothing found, state limits rather than promise a
   perfectly clean project.
3. **Findings:** table with `file:line`, category, observed role, known
   references/consumers, evidence of redundancy, confidence, impact, removal
   risk, proposed change and expected behavior/contract effect. Record
   affected other files and unknown external consumers.
4. **Protect/keep:** apparent candidates intentionally excluded and reasons.
5. **Prioritized manual plan:** validation needed, targeted tests/staging,
   explicit approval, Git commit/backup, rollback and post-change checks.
6. End with exact statement: `No files were deleted or modified.`

Never invoke from `$website-workflow` or another skill automatically. A later
explicit request for cleanup is a separate task with its own authorization.

## Quality-first precedence

Quality-first policy: efficiency is a preference, never a quality or scope cap. Expand source inspection, load additional applicable references, revisit earlier decisions, rewrite necessary code, and choose batch sizes as needed for correctness, completeness and maintainability. Perform relevant authorized, non-destructive verification; separate report commands remain manual-only. Creative design has no artificial exploration, variant, complexity, batch or token budget. Preserve user scope, branding requirements, strict Tailwind-only styling, PHP conventions, security, accessibility and permissions. Do not bypass platform limits or require external tools. Explicit standard/deep/full/visibility audit modes remain distinct; disclose incomplete coverage and never treat unverified checks as passing.
