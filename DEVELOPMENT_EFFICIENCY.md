# Token-Efficient Development Mode

Applies to `$website-workflow` and routine authorized code edits.
This is task-size management, not a token quota or model switch.

## Detect the work type before beginning

- **New / empty site:** No meaningful application source yet.
  Skip the Graphify kickoff, index build and dependency traversal.
  Read only relevant project guidelines and any supplied design.
  Create a small first batch; index only after useful source exists,
  and only when the official Graphify skill supports it.
- **Existing site / targeted edit:** Reuse a current Graphify graph
  if available. Locate only the affected files and dependencies.
  Do not dump the full codebase into context.
- **Tailwind migration:** Inspect the current Tailwind version and
  the component/page affected by the request. Convert shared
  header, footer and reusable components first, then pages in
  small groups. Preserve appearance and behavior; never
  generate new handwritten CSS or use `@apply`.
- **Other large refactor:** Identify dependency boundaries,
  plan limited batches and avoid unnecessary code regeneration.

## Bounded edit batches

1. Split large tasks into independently reviewable components or
   pages. Prefer one shared component or one page per batch;
   enlarge only when changes are small and closely related.
2. Keep a concise progress checklist (in the reply or an existing
   project task file if authorized). Mark completed units and
   avoid revisiting them without a clear dependency or user request.
3. Read only the source necessary for the current batch. Reuse
   findings already established in the active task; do not
   repeatedly reopen identical unchanged files.
4. Make minimal diffs. Do not overwrite entire files when a
   targeted edit will suffice; do not rewrite unrelated pages.
5. At a natural boundary, summarize what was completed, what
   remains, and any blockers. For a user-requested large task,
   proceed batch by batch within the allowed execution window;
   don't stop solely to seek permission for every small batch.
6. Preserve existing work, comments, routes and functionality.
   Do not claim visual parity or correctness without testing.

## Graphify and sync

- Empty project: do not run Graphify for a graph that has no
  useful source to index.
- Existing project: reuse the graph; verify key relationships
  against the current source before making changes.
- Refresh only if stale or missing *relevant* relationships.
  Prefer incremental updates to full reindexing when supported.
- After an authorized edit batch that changes code relationships,
  follow `GRAPHIFY_SYNC.md` once for the affected files.
- Do not launch background watchers, audits or tests by default.
- If Graphify fails, report it and proceed with bounded direct
  source inspection, never inventing dependency information.

## Limits of this approach

- Lower usage is a goal, not a guaranteed measured outcome.
- Large changes still require source reads and generated code.
- Do not automatically switch models or bypass user permissions.
- Manual `$website-test-report`, `$website-seo-report`, and
  `$website-structure-report` stay opt-in and read-only.
- `$website-format-code` stays separately invoked.
