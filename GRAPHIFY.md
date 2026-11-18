# Graphify integration

Graphify is installed by its official CLI in the target project.
It is not vendored into this skills bundle; the downloaded Python
package and shipped official Codex skill must be installed separately.

## Main behavior

- `$website-workflow` consults `$graphify` first, reuses an
  existing graph, and synchronizes relevant source changes after
  editing according to `GRAPHIFY_SYNC.md`.
- Graphify gives codebase and dependency context for development.
- The rest of the website standards and 88-column source formatting
  still apply.
- `$website-test-report`, `$website-seo-report`,
  `$website-format-code` and `$website-structure-report` use
  available Graphify context only when explicitly invoked.
- Read-only reports and formatter `--check` must not generate or
  update index files; use existing graph data or inspect source.
- Standard formatting may modify source whitespace only and
  synchronize graph data afterward when needed and authorized.
- All review and formatting commands remain on-demand only.

See `INSTALL.md` for complete Windows installation steps.
Source: https://github.com/Graphify-Labs/graphify

## Efficient usage

See `GRAPHIFY_EFFICIENCY.md` for scoped queries, conservative
refreshing, read-only safeguards and controlled fallback behavior.
See `GRAPHIFY_SYNC.md` for after-edit incremental synchronization.
Graphify may reduce repeated file reads, but token savings are
not guaranteed.
