# Graphify-first and efficient code inspection

Use these instructions for every explicitly invoked website command.
Graphify is a code-navigation aid, not a promise of lower token use.

## Reuse before rebuilding

1. Discover and read the official installed `$graphify` instructions.
   Do not guess command-line flags, API calls, or output locations.
2. Check for a pre-existing graph or reusable Graphify results.
   Confirm that it covers the requested project and relevant files.
3. Prefer narrow, documented graph queries to find entry points,
   direct dependencies, shared templates, callers, or routes.
4. Do not rebuild or refresh an apparently usable index merely
   because a command started. For authorized editing tasks, use
   `GRAPHIFY_SYNC.md` when affected graph data is outdated.
   Prefer incremental, batched updates, never full rebuilds by default.
5. Keep answers concise. Avoid dumping whole graphs, directory
   listings, repeated search output, and full source files.
6. Start with relevant code spans and dependencies; expand as needed.
   Follow new links only where needed to confirm a finding.
7. Reuse information already established in the current session;
   avoid redundant queries; revisit files when needed.
8. Verify suspected issues against current source code. Graph edges
   are clues and may omit runtime or dynamically constructed links.
9. State whether Graphify was used, whether its data was fresh,
   which scope was inspected, and any important coverage gaps.

## Missing, stale or unavailable graph

- Never invent Graphify findings or claim token savings.
- If Graphify is missing, first try a narrowly scoped inspection
  using filenames, changed files and known entry points.
- If an index is stale, narrow confirmation to affected source
  rather than repeatedly refreshing or scanning everything.
- If adequate coverage is impossible without a full repository
  scan or graph rebuild, explain the tradeoff and ask before
  performing expensive or write-producing work.
- If the user explicitly requested a complete audit, inspect the
  requested scope using bounded batches; don't silently reduce
  coverage just to save tokens. Mark uninspected areas accurately.

## Command permissions

- `$website-workflow`: may change requested source files. After
  source edits, use `GRAPHIFY_SYNC.md` for a single incremental
  update where relevant, documented and permitted. No unsolicited audit reports; relevant safe verification is allowed.
- `$website-test-report`, `$website-seo-report`, and
  `$website-structure-report`: read-only; no index creation,
  refresh, modified files, caches or other write-producing calls.
- `$website-format-code --check`: read-only, including Graphify.
- `$website-format-code`: formatting-only source edits, then
  permitted incremental graph synchronization per `GRAPHIFY_SYNC.md`.
  Never change unrelated source files.
- Do not launch other report commands automatically.

## Efficient reporting

- Summarize findings by root cause and affected path(s).
- Include actionable line references, not full file contents.
- Avoid duplicates; cite a representative occurrence when several
  files share the same issue.
- Keep 1-10 scoring methods of the existing report skills intact.
- Never promise a specific reduction in Codex context or usage.
