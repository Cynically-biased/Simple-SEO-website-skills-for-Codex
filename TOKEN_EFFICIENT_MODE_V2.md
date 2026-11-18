# Token-Efficient Mode V2

This policy aims to reduce unnecessary Codex context and repeated edits.
It does **not** change model selection, bypass limits, or guarantee savings.

## Lazy context loading

1. Read root `AGENTS.md` and the explicitly named/relevant skill only.
2. Do not load all eight skills, original full reference materials, or
   whole-repository file contents at the start of routine tasks.
3. Each skill's `references/full-instructions.md` holds its original
   detailed guidance; access just the sections pertinent to the task.
4. Use specialized reference files only if implementing their features.

## Work execution

- Discover narrow relevant files using filenames, symbols and targeted search.
- For existing projects, use Graphify only when dependency exploration would
  make work more accurate or efficient; verify graph facts against code.
- For empty projects and simple isolated edits, skip Graphify kickoff.
- Avoid redundant re-reading and full-source output; keep diffs small.
- Group broad migrations into page/component-sized batches; share unchanged
  logic and finish current batch before moving on.
- Do local verification appropriate to edits, e.g., syntax/check of changed
  files; do not launch unsolicited report skills or full-project suites.
- No automated watchers, repeated full Graphify scans or rebuilds.
- Reply briefly with changed files, checks and any noteworthy remaining work.

## Hard boundaries

- Preserve strict Tailwind-only styling, XML-only sitemap and selective PHP
  arrays/components/handlers/enums as summarized in `AGENTS.md`.
- `$website-test-report`, `$website-seo-report` and
  `$website-structure-report` remain explicit read-only operations.
- `$website-format-code` changes formatting only; `--check` changes nothing.
- Detailed instructions remain in each skill's references and can be read
  when needed. No architecture/SEO/security checks were removed.
