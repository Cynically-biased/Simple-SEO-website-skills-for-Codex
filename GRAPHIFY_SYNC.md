# Graphify synchronization after source edits

Use this workflow for commands that **actually change source files**:
`$website-workflow` and `$website-format-code` (without `--check`).
The goal is current graph data without redundant full scans.

## Before editing

1. Read the installed official `$graphify` skill and its current
   update instructions. Treat these as authoritative for your
   installed Graphify version; never invent commands or flags.
2. Reuse an existing project graph if it covers affected files.
3. Check relevant graph information against the current source,
   especially if Git changes or an earlier command may have
   modified files since the last graph update.
4. If the graph is stale, use a documented incremental update
   **only if it is needed and permitted**. If unavailable, use
   targeted source inspection and mark the graph as stale.

## After editing (one sync per batch)

1. Record the paths created, modified, renamed, and deleted.
2. When source changes affect graph-relevant dependencies,
   perform **one** documented incremental Graphify update after
   the editing batch, not after every saved line or file.
3. Prefer the official `$graphify --update` workflow or its
   installed-version equivalent. The official skill determines
   whether and how the code graph can be incrementally updated.
4. Confirm success from the tool's result before saying the graph
   is current. If it fails, report the graph as potentially stale
   and do not rely on it for subsequent modifications without
   checking the current source.
5. Skip updates when no code/dependency-relevant change occurred,
   or when the official skill indicates the index is already fresh.
6. Do not start background watchers or persistent processes
   automatically. `--watch` is an optional, separately enabled
   local workflow, not a requirement for incremental sync.

## Permission and read-only rules

- Follow Codex sandbox permissions; do not bypass write approvals.
- Generated Graphify index files may be written **only during
  an authorized development/formatting edit operation** and only
  using documented Graphify commands.
- If permissions do not allow index writes, continue using source
  files as the authority; disclose that synchronization is pending.
- `$website-test-report`, `$website-seo-report`,
  `$website-structure-report`, and `$website-format-code --check`
  remain strictly **read-only**. They must never update indexes.
- Graph synchronization is maintenance, **not a test**; it must
  not trigger test runs, quality scores, SEO audits or commits.

## Efficiency and integrity

- Batch file changes; avoid duplicate extraction and graph dumps.
- Recheck only directly affected dependencies after a sync.
- Never assume the graph understands runtime/dynamic relationships.
- Report: whether Graphify was used; updated, already fresh, stale,
  or unavailable; and whether any refresh was deferred.
- This may reduce redundant file reads, but it is not a guarantee
  of lower Codex token or usage consumption.
