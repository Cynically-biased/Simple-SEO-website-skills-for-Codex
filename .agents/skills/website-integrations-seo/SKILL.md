---
name: website-integrations-seo
description: >-
  Set up and verify GA4 analytics, Search Console, sitemaps, robots.txt,
  Schema.org JSON-LD, GDPR-aware consent, and prelaunch SEO integrations for
  a small PHP website. Use for tracking, indexing, structured data and launch
  checks.
---

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
