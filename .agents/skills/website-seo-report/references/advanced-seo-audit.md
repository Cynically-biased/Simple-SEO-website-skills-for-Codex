# Advanced SEO audit reference

Applies only to `$website-seo-report`. Read-only, on demand.

## Google Search guidance and caveats

- Sitemap `<lastmod>` is optional but useful when **consistently
  accurate**. Use W3C dates such as `2026-10-14`, or a full ISO
  timestamp with timezone. Do not substitute file mtime or the
  scan date for meaningful content updates without evidence.
- Google ignores XML sitemap `<priority>` and `<changefreq>`.
  Their absence is **not** a defect. Never reward adding them.
- A sitemap is a discovery hint, not an indexing/ranking promise.
- Google generates title links automatically from multiple
  sources, and chooses snippets contextually. Meta descriptions
  are candidates, not guaranteed search result text.
- Rich results require eligible supported schema and policy
  compliance; generic JSON-LD does not guarantee enhancements.
- Robots disallow blocks crawling, while `noindex` controls
  indexing when crawlers can access that directive.

Authoritative references:

- https://developers.google.com/search/docs/crawling-indexing/sitemaps/build-sitemap
- https://developers.google.com/search/docs/appearance/title-link
- https://developers.google.com/search/docs/appearance/snippet
- https://developers.google.com/search/docs/essentials/technical
- https://developers.google.com/search/docs/fundamentals/seo-starter-guide
- https://developers.google.com/search/docs/appearance/structured-data/intro-structured-data

## Deep sitemap checklist

- [ ] Site root contains an actual UTF-8 `sitemap.xml` file.
- [ ] URL `/sitemap.xml` serves XML, not a PHP rewrite.
- [ ] XML well-formed, correct namespace, `urlset` or valid index.
- [ ] Valid absolute `<loc>` URLs, HTTPS production domain.
- [ ] Canonical host/path normalization and no duplicates.
- [ ] No noindex, disallowed, redirected, error or placeholder URLs.
- [ ] Discover important indexable pages missing from sitemap.
- [ ] Exclude intentionally nonindexable or obsolete URLs.
- [ ] Check `<lastmod>` coverage per meaningful page.
- [ ] Parse valid date or datetime, flag future/impossible dates.
- [ ] Compare date against meaningful content history only when
      verified. Mark historical accuracy unknown if unavailable.
- [ ] Do not assume recent file edit equals content change.
- [ ] Check sitemap referenced by absolute URL in robots.txt.
- [ ] If huge: 50,000 URLs / 50 MB uncompressed file limits;
      check sitemap index and child files as relevant.
- [ ] Optional image/video/news/multilingual sitemap elements
      only where corresponding content and requirements exist.

`lastmod` scoring: if absent from maintained pages, list an
**Opportunity** with a small or zero score deduction depending
on evidence of significant updates; never call the XML invalid.
Invalid or deliberately misleading dates count as a defect.

## Page and snippet audit checklist

For every high-value page, collect:

| Signal | Questions |
| --- | --- |
| URL and status | Is it indexable? Does it resolve? |
| Canonical | Is it self-consistent with sitemap? |
| Title | Unique, accurate, readable, intent-aligned? |
| Description | Useful, specific, nonduplicated, compelling? |
| H1 and hierarchy | Descriptive, agrees with title and content? |
| Main content | Helps a specific searcher? Is it substantive? |
| Snippet sources | Does visible text support useful snippets? |
| Images | Helpful alt text and crawlable image references? |
| Links | Descriptive anchors to related important pages? |
| Schema | Truthful, valid and applicable to visible content? |

Construct **illustrative proposed title and meta description**
for weak pages, including a short explanation of the change.
Check approximate pixel/character truncation risk as guidance,
not a strict Google character rule. No fixed title or meta
length guarantees the display; don't score solely by length.
Avoid repetitive city/keyword stuffing and empty sales slogans.
For local services, include clear service and area information
when supported by the business information and real page copy.

## Additional technical and content checks

### Indexability and crawl

- robots.txt (per crawler where relevant), meta robots,
  X-Robots-Tag, staging blocks, status codes, redirects.
- Canonical vs sitemap mismatch; HTTP/HTTPS and www variants.
- Internal links as crawlable anchors, navigation hierarchy,
  orphan links, pagination and parameter variants.
- JS-dependent content, render blocking, soft-404 risks.

### On-page content

- Unique information and purpose per page, likely search intents.
- Landing pages for actual services; avoid doorway pages.
- Clear introduction, headings and helpful service descriptions.
- Accuracy, trust/identity/contact information where relevant.
- Internal links between complementary pages and informative
  anchors rather than repetitive generic `click here`.
- Avoid inventing search demand, search volume or keyword ranks.

### Structured data, mobile and search performance

- Check JSON-LD parse, supported types, canonical URL consistency,
  duplicates and whether data matches visible content.
- Rich Results Test and Schema Validator are live checks:
  mark NOT VERIFIED unless actually accessed.
- Mobile-friendly viewport, readability, tap targets, media,
  page loading; use measured CWV only when available.
- Images with size, modern formats as appropriate; lazy loading
  except when it delays critical above-the-fold imagery.
- No assumed Lighthouse, PageSpeed or CrUX results.

### Local, language and off-site visibility

- LocalBusiness/NAP and service areas only if truly applicable.
- Google Business Profile, citations and backlink signals only
  with authorized live evidence.
- html lang and hreflang/canonical interplay for multilingual sites.
- Search Console indexing, impressions, CTR and Google query data
  only from actual access; never infer positions from source code.

## Score rubric

Assign evidence coverage first. Use an interpretable weighted
score, 1 to 10, weighted by *applicable and verified* categories:

| Category | Weight |
| --- | ---: |
| Crawl/indexing | 20% |
| XML sitemap and robots | 15% |
| Titles/descriptions/SERP | 15% |
| Content and intent | 15% |
| Internal links / structure | 10% |
| Structured data | 10% |
| Mobile and performance | 10% |
| Local / international / visibility | 5% |

For N/A categories, redistribute the weights transparently.
For unverified substantive categories, keep the score
**provisional**, do not count unknown as passing, and show
coverage percentage separately. Severe verified defects should
strongly reduce their category score; minor metadata opportunities
should not dominate the whole score. Never double-count.

Sample severity definitions:

- CRITICAL: widespread accidental noindex, blocked production site.
- HIGH: essential pages excluded/uncrawlable, incorrect canonicals.
- MEDIUM: duplicated/empty key titles, missing core service copy,
  materially inconsistent sitemap versus actual indexable pages.
- LOW: isolated metadata or alt-text issue, missing optional
  sitemap `lastmod` where useful and evidence supports updates.
- OPPORTUNITY: improvements with no proven error or impact.

A missing optional `<lastmod>` alone should not cause a large
penalty. Report the finding and explain how to add truthful dates.
Never present the final number as a Google ranking prediction.

## Efficiency and read-only operation

- Prefer existing Graphify index and scoped graph queries.
- Start with site-wide shared partials and high-value pages.
- For large websites, use an inventory and representative samples;
  disclose sampling and coverage; do not claim every page checked.
- Do not create test output, caches, score files, reports or edits
  inside the repository unless the user explicitly changes the
  read-only requirement.
- Never run updates, deployments, sitemap submissions or fixes.
- Report anything requiring live crawling, Google Search Console,
  SERP inspection, lab performance tests or off-site verification
  as NOT VERIFIED when access is absent.

## Quality-first precedence

Quality-first policy: efficiency is a preference, never a quality or scope cap. Expand source inspection, load additional applicable references, revisit earlier decisions, rewrite necessary code, and choose batch sizes as needed for correctness, completeness and maintainability. Perform relevant authorized, non-destructive verification; separate report commands remain manual-only. Creative design has no artificial exploration, variant, complexity, batch or token budget. Preserve user scope, branding requirements, strict Tailwind-only styling, PHP conventions, security, accessibility and permissions. Do not bypass platform limits or require external tools. Explicit standard/deep/full/visibility audit modes remain distinct; disclose incomplete coverage and never treat unverified checks as passing.
