# SEO V3 — URL, site architecture and crawl-discovery intelligence

Authoritative focused reference for `$website-seo-report` (all modes) and
SEO implementation work. Load this reference on an SEO task only. The three
modes, read-only boundaries, score policy and evidence tiers of
`seo-audit-modes-v2.md` remain in force. Do not run this as a development audit.

## First principle: public site vs source folders

SEO search engines consume publicly reachable URLs, responses, links and
rendered content — not internal `handlers/`, `components/`, `enums/`,
`data/` or arbitrary PHP folder names. Identify public routes from routing,
rewrite rules, deployed base URL, PHP entrypoints and internal links. A good
internal architecture is not itself a ranking factor. Flag a source layout
only when it causes a **demonstrable** search issue (broken paths, missing
routes, duplicate public output, leaking internal resources or inconsistent
metadata), and refer pure code-organization matters to structure-report.

A `.php` URL extension, URL path depth, trailing slash, number of headings,
meta character count or site tree shape is **not automatically an SEO error**.
Evaluate clarity, discoverability, consistency and actual response behavior.
Never recommend bulk URL changes solely for aesthetics. For existing public
URLs, explain migration costs: permanent redirects, link updates, canonical
and sitemap changes, and monitoring. No changes during a report.

## Efficient canonical URL inventory (mandatory all modes)

1. Determine the public host/scheme/base path only from verified source or
   live configuration. Do not invent a domain or equate filesystem path to URL.
2. Enumerate unique public routes from explicit route/rewrite tables, relevant
   page entrypoints, navigation, internal anchors, canonical declarations and
   physical `sitemap.xml`. Preserve evidence source per URL. Use targeted
   searches rather than loading complete project files into AI context.
3. Classify each row: observed or inferred URL, route source, index intent,
   sitemap presence, internally linked status, claimed canonical, response
   verification tier, redirect/robots status and notes. Mark dynamic parameter
   routes as patterns if their concrete URLs cannot be established. Do not
   invent exhaustive dynamic inventories.
4. Cross-check route -> canonical -> sitemap -> internal-link targets ->
   robots/indexing/redirect response. Distinguish contradiction from unknown.
5. For normal mode, inventory all discoverable URLs using economical local
   discovery; deeply inspect high-value routes and one or more representatives
   per unique template, plus anomalies. State exact coverage, samples and
   unverified rows. `--full` should aim to verify every eligible unique URL
   when practical, or disclose a justified cap and unverified URLs.

Example route inventory columns (show concise subset in final report):
`URL | source | link depth | linked? | sitemap? | canonical | indexable? |
response evidence | issue / confidence`.

## URL quality and duplicate public paths

- Prefer understandable, relevant, stable, consistent URLs that represent the
  actual page, including case and encoded characters. Identify meaningless
  identifiers, long cluttered query strings, duplicate slug families,
  ambiguous page names and locale mismatches as **usability/opportunity**
  unless they actually hinder discovery/crawling.
- Check likely variants (scheme, www host, slash, case, `index.php`, `.php`
  route alternative, parameters, tracking tags, sorting/filtering and session
  IDs) only if routing or observed links show they can occur. Beware unlimited
  parameter combinations, faceted crawl spaces and external query targets.
- Identify potential same-content URLs and canonical contradictions, but
  prove with rendered/live evidence before calling them duplicates.
- Do not assert redirect statuses, 200s or Google's chosen canonical from
  source alone. Source can show *intended* rewrites/redirects, not outcome.
- Avoid blanket advice to remove `.php` extensions or restructure old URLs.

## Site navigation, hierarchy and internal link audit

- Build an internal directed-link map using only verifiable links. Keep direct
  source template links distinct from rendered or live links. Account for
  menus, breadcrumbs, footers and contextual service links; do not count
  links injected by unknown PHP branches as verified.
- Identify truly unreachable pages (when all relevant navigation and content
  are inspected), suspected orphans, high-value pages difficult to reach,
  important routes linked only via JS interactions, broken internal target
  candidates, redirects in internal links and descriptive anchor opportunities.
- Check category/service/location architecture as a communication and
  findability issue, not a mandatory numeric click-depth rule.
- Consider navigation clarity, related-content links, duplicate pages with
  overlapping intent, breadcrumbs and pagination when relevant.
- Do not call a page orphaned based only on a partial sample. Call it
  `POTENTIAL ORPHAN — INCOMPLETE COVERAGE` unless comprehensively verified.

## Cross-signal consistency matrix (mandatory)

For each important indexable public URL compare:
- Sitemap `loc` and optional credible `lastmod` (actual static XML on disk);
- Canonical declaration (self vs other URL), redirects and host normalization;
- `robots.txt` rules vs `meta robots` vs `X-Robots-Tag` when verifiable;
- Navigation, breadcrumbs and relevant contextual internal links;
- Server response, content type, live indexing eligibility when accessible;
- Alternate language `hreflang` and reciprocals, if multilingual;
- Intended route and rendered title, description, H1 and visible body;
- JSON-LD URLs and breadcrumb fields when structured data exists.

Flag **mismatches** such as a sitemap URL that canonicals elsewhere,
indexable route excluded from navigation and sitemap, noindex URL listed in
sitemap, navigation resolving through redirects, conflicting host variants,
canonical to a missing target, or XML pointing at non-HTML 404 pages. Mark
anything requiring live verification as `NOT VERIFIED` until tested.

## Physical sitemap checks

- Require physical UTF-8 `sitemap.xml` at the public root; reject a
  PHP-generated sitemap route under this project's strict convention.
- Validate XML namespace, file syntax, absolute URLs, scope/host, duplicates,
  canonical consistency, coverage and exclusion of nonindexable URLs.
- Validate `<lastmod>` if present: correct ISO date/time syntax, plausible
  real modification, no invented bulk dates. Missing is an optional
  improvement, **not a sitemap invalidity or ranking penalty**.
- Never require `<priority>` or `<changefreq>`; Google ignores them.
- Consider sitemap index files and XML size/URL limits for large sites,
  without fabricating pages or forcing indexes for small sites.
- Check robots.txt sitemap declaration and robots allow/block implications,
  distinguishing `Disallow` from `noindex` (robots does not guarantee removal
  from an index).

## Rendered PHP page and on-page checks

- For existing PHP websites, inspect shared SEO includes/partials and route
  variables. Verify rendered HTML when a ready, authorized and safe local or
  live environment is accessible; source-only outcomes remain inferred.
- Compare per-route `<title>`, meta description, declared canonical, robots,
  headings, visible textual content, links, image alt context, language,
  structured data and unique value/search intent. Detect repeated metadata
  due to variables shared incorrectly across PHP templates.
- Evaluate text relevance, useful snippets, FAQ/service/location accuracy and
  content overlap. Do not invent business facts or rank predictions.
- Check image dimensions, lazy/eager loading of above-the-fold media,
  font/JS blocking and CWV only with appropriate evidence and tooling.
- Structured data: parse/type/consistency vs visible page facts; no promise
  of rich-result appearance. Multilingual/local criteria only if applicable.

## Mode-specific cost budgets and coverage

**Default**: local route inventory, sitemap + source crosscheck, shared
SEO templates, key public routes and distinct template samples; no automatic
network crawl, browser installation, Lighthouse or competitor search. Use
compact per-route matrix + top prioritized findings. Do not produce giant
raw link inventories in conversation.

**`--full`**: verify accessible rendered/live routes and response chains,
search directives, internal links and content; use authorized tools if present.
This does not override permissions, start persistent servers, or require
external installs. Declare full coverage or sampled/not-verified remainder.

**`--visibility`**: cross-check GSC/Bing exported URLs and landing pages against
the canonical inventory where authorized data exists; distinguish internal
configuration from actual impressions/clicks/index data. No data = no actual
visibility score or claimed rankings.

**Output**: Mode; scope and URL discovery sources; counts (known routes,
rows inspected, source / rendered / live verified, excluded / unknown);
short URL consistency table; Critical/High/Medium/Low/Opportunity findings
with path or URL, evidence tier, confidence, risk and concrete fix; unknowns,
recommended verification. Maintain score/evidence policy from V2; keep
recommendations read-only and concise.

## Avoid SEO folklore and unsafe fixes

Do not score `.php` extensions, URL depth, file naming conventions, missing
optional XML tags, meta description character count, 'one H1', keyword density
or source PHP folder hierarchy as direct ranking factors. These can be
maintainability or clarity opportunities where supported, not mandatory SEO
errors. Never recommend changing routes without discussing redirects and
preserving existing links. Do not run any other report automatically.

## Authoritative background references

- Google Search Central: URL structure best practices
  https://developers.google.com/search/docs/crawling-indexing/url-structure
- Google Search Central: sitemaps and truthful lastmod
  https://developers.google.com/search/docs/crawling-indexing/sitemaps/build-sitemap
- Google Search Central: canonicalization
  https://developers.google.com/search/docs/crawling-indexing/consolidate-duplicate-urls
- Google Search Central: redirects
  https://developers.google.com/search/docs/crawling-indexing/301-redirects
- Google Search Central: SEO starter guide
  https://developers.google.com/search/docs/fundamentals/seo-starter-guide

## Quality-first precedence

Quality-first policy: efficiency is a preference, never a quality or scope cap. Expand source inspection, load additional applicable references, revisit earlier decisions, rewrite necessary code, and choose batch sizes as needed for correctness, completeness and maintainability. Perform relevant authorized, non-destructive verification; separate report commands remain manual-only. Creative design has no artificial exploration, variant, complexity, batch or token budget. Preserve user scope, branding requirements, strict Tailwind-only styling, PHP conventions, security, accessibility and permissions. Do not bypass platform limits or require external tools. Explicit standard/deep/full/visibility audit modes remain distinct; disclose incomplete coverage and never treat unverified checks as passing.
