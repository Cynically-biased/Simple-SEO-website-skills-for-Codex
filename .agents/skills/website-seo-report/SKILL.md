---
name: website-seo-report
description: >-
  Manual read-only SEO auditing in three modes: efficient source and
  locally rendered report (default); deep live-site verification (--full);
  or evidenced search visibility and competitor research (--visibility).
  Audit public URLs, architecture, sitemap/canonical/link consistency,
  rendered PHP and search appearance with evidence; never edit.
---

# Website SEO report — manual, read-only, evidence first

Invoke explicitly as `$website-seo-report`, `$website-seo-report --full`,
or `$website-seo-report --visibility`. Never run automatically during
`$website-workflow` or change project files, even when defects are found.
Do not create files, start persistent servers, modify data or deploy.

## Choose exactly one mode

- **Default:** Efficient local source audit. Inventory routes from routing,
  sitemap and page files; inspect representative templates and *all*
  discoverable high-value pages. Inspect rendered HTML only when available
  without intrusive setup; otherwise mark it UNVERIFIED. No live crawl,
  competitor research, Search Console or Lighthouse by default.
- **`--full`:** Deep technical audit. Include default criteria plus rendered
  output of important PHP routes, systematic live URL/status/canonical/robots
  comparisons, sitemap coverage and appropriate structured-data/performance
  validations **only when accessible and authorized**. Do not silently
  install tooling or conduct expensive, broad crawling; announce sampling or
  environmental constraints. Missing tools/results = NOT VERIFIED.
- **`--visibility`:** Real search performance: use authorized Search Console
  or comparable first-party data when available, time windows, impressions,
  clicks, CTR, average position, pages, queries and index coverage. Add
  separate competitor/SERP research only when expressly requested or
  accessible; do not scrape or fabricate. Without live data, provide an
  evidence-gap report and setup steps, **not invented rankings or scores**.

## Shared safeguards and output

- Read `references/seo-audit-modes-v2.md` for mode rules and scoring, and
  `references/seo-url-architecture-v3.md` for mandatory URL/route/link checks;
  then consult relevant sections of `references/advanced-seo-audit.md`
  and `references/full-instructions.md`. V2 mode rules take precedence where
  older references assume a single audit mode.
- Build a public URL inventory from actual routing, nav, canonicals,
  sitemap and rewrites; cross-check URL consistency and links. Avoid treating
  internal PHP folder names or `.php` extensions as ranking failures.
- Verify physical static `sitemap.xml` (not sitemap.php); validate optional
  truthful `<lastmod>` without penalizing absent optional tags heavily.
- Distinguish source-code predictions from locally rendered and live evidence.
  Never infer actual Google indexing, ranking, snippets, Core Web Vitals,
  rich results, or SEO impact solely from source code.
- Report inspected/discovered pages, coverage, evidence source, unresolved
  checks and confidence; score only verifiable, applicable categories.
- Give file/line or URL evidence, severity, suggested changes and optional
  example titles/descriptions, but **do not fix or submit anything**.
- Keep output concise and scans targeted to avoid unnecessary Codex usage.
