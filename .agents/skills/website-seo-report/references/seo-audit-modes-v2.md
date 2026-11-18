# SEO audit V2 — mode-specific operating rules

This document governs `$website-seo-report` in all modes and overrides older
references where they conflict. Reports are **manual and strictly read-only**.
No source edits, generated reports in repo, sitemap submissions, account
changes, installs, deploys, persistent services or broad automated actions.

## Common process — evidence before conclusions

1. Detect environment and constraints: project root, routing, PHP entrypoints,
   static sitemap(s), robots.txt, test-server/live URL availability, relevant
   tooling, and first-party analytics access. Do **not** assume access.
2. Make a lightweight route inventory from explicit routes, public pages,
   sitemap URLs and internal links. Distinguish known, discovered, indexable,
   excluded and unknown. Protect against unbounded route/parameter enumeration.
3. Reuse current project context and focused reads, not full-project dumps.
   Use Graphify only if it actually helps trace shared templates or routes.
4. For each checked page, distinguish SOURCE (code), RENDERED (actual local
   HTML), LIVE (deployed response), SEARCH DATA (Search Console etc.). Each
   finding needs its evidence level and file/line or URL.
5. Never report UNVERIFIED as PASS. Mark unobservable criteria NOT VERIFIED,
   plus steps needed for proper validation; distinguish NOT APPLICABLE.
6. List high-impact issues first, describe safe recommended fixes, never
   implement them in this audit.

## `$website-seo-report` — default efficient local audit

- Inspect all discoverable important pages (home, service, product,
  location/contact, relevant landing pages) and shared SEO templates.
  For large route sets, define a deterministic scope or page cap; sample
  each template type and representative exceptions; disclose exact counts
  rather than claim 100% coverage.
- Read static `sitemap.xml`, validate XML namespace and structure, absolute
  canonical HTTPS `loc`, duplicate/redirect/noindex candidates when verifiable,
  truthful optional `lastmod` formats, plausible dates and `robots.txt` link.
  Never require `priority` or `changefreq`, or assert lastmod's truth from
  file modification time alone. Sitemap must be a physical XML file.
- Check titles, descriptions, H1, useful visible text, snippet candidates,
  canonical consistency, indexability directives, crawlable internal anchors,
  helpful ALT text and responsive settings from available evidence.
- Check JSON-LD parse/type/consistency from source; rich-result eligibility
  itself remains UNVERIFIED without live validation.
- When the project offers safe, ready-to-use local rendering, examine rendered
  HTML for high-value routes: blank/duplicate titles, server-side variables,
  canonicals, robots, schema and content. If rendering requires setup or
  state-changing execution, do not silently run it; mark NOT VERIFIED.
- Flag unreachable routes, omitted pages, pagination/hreflang problems and
  likely duplicate content only when supported. Don't extrapolate from a
  single template to all pages.
- No default live crawling, PageSpeed, Lighthouse, competitive research or
  Search Console calls. Suggest `--full` or `--visibility` for these.

## `$website-seo-report --full` — deep live/technical audit

Includes all default checks. Before any live access, determine intended
production/staging domain from verified configuration/user context. Avoid
probing arbitrary guessed domains or private endpoints. Ask for URL/access
only when truly needed; otherwise proceed with verified local checks.

- Render or inspect actual response HTML for high-value and representative
  routes through an already available authorized environment (PHP/templates,
  dynamic include branches, page metadata and schema). Avoid unsafe side
  effects; do not start a public server or provision infrastructure.
- With authorized live access, inspect URL response/status (200/3xx/4xx/5xx),
  redirect chains, final URL, content type, canonical, robots meta and HTTP
  X-Robots-Tag, effective robots.txt rules, HTTPS and host normalization.
- Compare *discoverable indexable routes* against the physical sitemap:
  missing URLs, duplicates, redirecting/noncanonical/blocked/noindex URLs,
  XML errors, index/child sitemap handling, size limits, optional truthful
  `lastmod`. Inspect live `sitemap.xml` response when available; ensure not
  PHP dynamic output. Mark uncertain date accuracy UNKNOWN.
- Check internal anchor links, orphan risk, pagination, hreflang reciprocals,
  internal redirects and soft-404 clues based on rendered/live evidence.
- Validate structured-data syntax, properties and consistency with visible
  content. If a supported Rich Results Test/Schema validator is accessible,
  use it non-destructively; separately state syntax valid vs Google-supported
  eligibility vs real rich-result appearance. Never guarantee rich results.
- If performance tools are already available and running them is reasonable,
  inspect Lighthouse/PageSpeed lab metrics and sourced CrUX field data. Identify
  URL, device, timestamp, lab versus field, and applicable CWV thresholds;
  do not fabricate scores, extrapolate lab scores to Google rankings, or run
  massive performance batches without request.
- Declare the live coverage precisely (# URLs audited / # discovered;
  rendered vs live counts); use representative samples when large and state
  gaps. Search Console metrics are **not** presumed; use `--visibility`.
- No default competitor SERP analysis. Never turn audit into a rewrite/fix.

## `$website-seo-report --visibility` — actual search visibility

- Require actual authorized Google Search Console (GSC), Bing Webmaster
  Tools, or provided reliable exports for observed performance; otherwise
  say "NO VERIFIED SEARCH PERFORMANCE DATA AVAILABLE" and provide specific
  steps to connect/export the needed property/date range. Never fabricate
  traffic, ranks, indexing or competitor positions.
- Cite source property, country/device/search type filters, date interval,
  data freshness, sample sizes, aggregation rules and limitations. Distinguish
  clicks/impressions/CTR/average position (mean, not exact rank) and report
  changes only for comparable time windows.
- Analyze pages and queries: high impressions/low CTR, position bands,
  relevant missing topics, cannibalization hypotheses, device/country splits,
  indexed/excluded trends when included in provided data.
- Bing data and Google data are different; keep separate. Avoid claiming
  general web search rankings from one account or one query.
- Competitor/SERP comparison is OPTIONAL, only if user requests it and
  reliable current evidence is available: specific keywords/locations,
  dates, search intent, observed result types, site differences. Never
  invent search volumes or describe guesses as observed results.
- Provide practical recommendations and uncertainties. No edits to the
  website, Search Console, robots, sitemaps or accounts.
- If no first-party data, omit a numerical "visibility score"; instead
  present data gaps and optionally code-derived opportunities distinctly.

## Coverage, scoring and reporting

**Mandatory report sections for every mode:** mode and scope; sources and
level of evidence; coverage (# discovered, # checked, # rendered, # live,
# unknown); critical/high/medium/low/opportunity findings; per-page table
for high-value pages or sampled routes; recommended fixes; NOT VERIFIED
checks and requirements; confidence and limitations.

**Default/Full technical score:** 1–10, but *only for applicable, verified
criteria*. Show individual category grades, weighted score, coverage and
confidence separately. Previously documented category weights apply only to
verified categories; do not silently redistribute unverified categories or
award a 10 when major checks are absent. When too little evidence exists,
write **INSUFFICIENT EVIDENCE TO SCORE** instead of a false precise score.
Severe indexability failures cap/strongly lower technical scores if verified.
Never equate score to expected rank, indexation or traffic.

**Visibility:** observed metrics, trends and uncertainty take priority over
any arbitrary numeric rating. If user insists on a rating, disclose an
explicit custom basis and data quality; never label it a Google score.

**Sitemap `lastmod`:** optional and useful when truthful; validate date or
proper ISO timezone datetime, future/impossible timestamps, suspicious bulk
changes, and content-history accuracy only when verifiable. Missing values:
minor opportunity, not invalid XML; Google ignores `priority`/`changefreq`.

**Search-result appearance:** identify unique title/description and usable
visible page text; suggest specific title/meta text where weak and label
search previews as *illustrative*. Google may rewrite them.

**Tool constraints:** if no browser/network/runtime/performance tooling is
available, provide a useful partial audit and name precise gaps. Do not claim
that source-only inspection constitutes a live crawl or accurate ranking test.
