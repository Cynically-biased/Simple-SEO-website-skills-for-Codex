# Template Alignment & Architecture Consistency Update

## Why it was needed
Prior skills retained original reference instructions but left them optional; other skills could choose archived examples with different structure, metadata names, JS organization or form patterns. A common contract now binds all 19 skill entrypoints.

## What changed
- Added `WEBSITE_ARCHITECTURE.md` as the shared implementation contract and conflict-resolution hierarchy.
- Retained **verbatim** the five user-uploaded Markdown references in `references/original-template/`.
- Updated `AGENTS.md` to require the contract before site and PHP work.
- Added an explicit architecture-compliance instruction to every SKILL.md, plus role-specific checks on relevant skills.
- Preserved original PHP page/header/footer metadata pattern, form PRG and session flash pattern, expected directories, default single JS entry, and clean routes where supported.
- Reconciled newer requirements: Tailwind-only (no custom CSS/@apply), non-page PHP `_` names, optional PHP 8.1+ enums, focused PHP arrays, real static sitemap.xml, privacy-aware analytics, quality-first adaptive testing/security.
- Preserved no-auto-migration and manual-only audit/repair boundaries.

## What did not change
- All previous skills, names and command boundaries; creative freedom; SEO Architecture V3; quality-first efficiency; optional Graphify; test and security suite logic; non-destructive reports.

## Validation notes
- Structural integrity of ZIP, skill frontmatter, skill count and presence of references checked by build script.
- Actual Codex behavioral compliance requires testing in a real project with applicable runtime and permissions. No source project has been modified by this package update.
