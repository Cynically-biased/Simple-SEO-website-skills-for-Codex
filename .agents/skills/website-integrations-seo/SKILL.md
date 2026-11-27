---
name: website-integrations-seo
description: >-
  Set up and verify GA4 analytics, Search Console, sitemaps, robots.txt,
  Schema.org JSON-LD, GDPR-aware consent, and prelaunch SEO integrations for
  a small PHP website. Use for tracking, indexing, structured data and launch
  checks.
---


## Shared architecture consistency — mandatory

For PHP website projects, **read root `WEBSITE_ARCHITECTURE.md` before applying this skill** to site structure, PHP pages, partials, handlers, naming, Tailwind assets, routing, integrations or relevant tests. Use the original reference documents under `references/original-template/` as supporting details. **This contract overrides conflicting archived examples** (old PHP 7.4, custom CSS, `@apply`, old handler filenames, dynamic PHP sitemaps, generic page layouts). Preserve the current project's architecture for unrelated work; no automatic migrations. Check relevant generated or assessed results against this contract and disclose unresolved conflicts or unavailable verification. This requirement applies to audit/report skills too; report commands remain read-only and change no files.

# Implement SEO/integrations when requested

- Implement only SEO/integrations relevant to the requested work; do not run unsolicited SEO audits.
- Sitemap must be a physical static `sitemap.xml`; never use a PHP sitemap or route.
- Maintain canonical indexable entries, truthful `lastmod` and `robots.txt` sitemap link.
- For new or changed public routes, maintain descriptive, stable URLs and
  consistency across navigation, physical sitemap, canonicals, redirects and
  indexability. Do not force URL rewrites or `.php` removal for SEO alone.
- Keep internal PHP implementation paths distinct from public URLs; secure
  internal resources without inventing search-engine ranking penalties.
- Keep page title/meta content in the page PHP; respect Tailwind-only rules.
- For routing/URL architecture work, consult
  `../website-seo-report/references/seo-url-architecture-v3.md` selectively;
  never run the read-only audit automatically.
- Read relevant parts of `references/full-instructions.md` and, only as needed, `references/integrations-full.md` for GA4, Search Console, schema, GDPR or other integrations.

## Progressive disclosure

The full previous operational instructions are retained in
`references/full-instructions.md`. Consult **relevant sections** when
needed; for report/formatter invocations, read all necessary audit or
formatting criteria before executing. Do not read unrelated skills.

Root `AGENTS.md` is authoritative for the common invariants.

## Quality-first precedence

Quality-first policy: efficiency is a preference, never a quality or scope cap. Expand source inspection, load additional applicable references, revisit earlier decisions, rewrite necessary code, and choose batch sizes as needed for correctness, completeness and maintainability. Perform relevant authorized, non-destructive verification; separate report commands remain manual-only. Creative design has no artificial exploration, variant, complexity, batch or token budget. Preserve user scope, branding requirements, strict Tailwind-only styling, PHP conventions, security, accessibility and permissions. Do not bypass platform limits or require external tools. Explicit standard/deep/full/visibility audit modes remain distinct; disclose incomplete coverage and never treat unverified checks as passing.

## Adaptive security integration
Protect analytics/search credentials and personal data; verify relevant privacy and public route exposure controls. Consult root SECURITY_TESTING_POLICY.md as relevant; preserve command boundaries.

## Architecture-specific responsibility

Use `references/original-template/integrations.md` for contextual integration requirements, with the shared contract governing physical XML sitemap, truthful structured data, consent and safe analytics event placement.
