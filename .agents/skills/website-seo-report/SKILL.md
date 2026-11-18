---
name: website-seo-report
description: >-
  Manually audit a website for Google and other search engines.
  Score evidence-backed SEO quality from 1 to 10, prioritize
  improvements, and never modify project files.
---

# Manual SEO quality audit (read-only)

Run only when the user invokes `$website-seo-report` or
explicitly requests a comprehensive SEO audit. Do not run this
skill after ordinary coding tasks or as part of `$website-workflow`.

## Non-negotiable safety and reporting

- Strictly **read-only**: no file edits, formatting, generation,
  auto-fixes, installation, cache files, snapshots, commits,
  deployments, sitemap submission, or Search Console changes.
- Inspect repository files and already-available configuration.
  Run only demonstrably read-only commands and checks.
- Do not crawl live sites or access external accounts without
  authorization; if unavailable, mark live checks **NOT VERIFIED**.
- Never invent Lighthouse scores, Core Web Vitals, indexed pages,
  keyword rankings, traffic, backlinks or Googlebot results.
- Be explicit about static findings versus actual crawler,
  browser, lab, field, and Search Console observations.
- Cite file paths and line numbers for findings when available.
  Provide suggested fixes **as text only**.
- Separate confirmed issues, potential risks, and unchecked items.
  Avoid guessing that a feature is broken based on missing files.
- Do not promise that passing this audit guarantees Google rankings.

## Read the existing project references

Follow relevant instructions from:

- `../website-integrations-seo/SKILL.md`
- `../website-integrations-seo/references/integrations-full.md`
- `../php-website-development/SKILL.md`
- `../website-testing-aftercare/references/testing-full.md`
- Root `AGENTS.md`

The original detailed SEO, sitemap, GA4, Search Console,
Schema.org, consent and troubleshooting guidance remains the
reference. Check applicability before flagging missing features.

## Audit coverage

1. **Crawlability and indexability:** robots.txt, robots meta,
   X-Robots-Tag, HTTP status and redirect chains where verifiable,
   noindex/nofollow, staging exclusions, sitemap location,
   sitemap accuracy, URL reachability, soft 404 risks,
   JavaScript-rendered links and content, Googlebot visibility.
2. **Canonical URLs and architecture:** canonical tags,
   www/non-www, HTTPS, parameter duplicates, trailing slash,
   internal links, descriptive anchors, orphan-page risks,
   navigation depth, breadcrumbs, pagination and broken links.
3. **On-page metadata:** unique titles, meaningful descriptions,
   headings, alt text, language tags, OG/social metadata,
   clear page purpose, search intent and duplicate metadata.
4. **Content and relevance:** useful original content, service
   and location pages when appropriate, thin/duplicate content,
   internal topical relevance, content accuracy and freshness,
   visible business/contact information, trust signals.
5. **Structured data:** valid relevant JSON-LD (Organization,
   LocalBusiness, WebSite, Service, BreadcrumbList, ContactPage),
   accurate claims and URLs, no contradictory duplicate markup;
   eligibility for rich results is not guaranteed.
6. **Performance and mobile:** responsive viewports, image
   sizing and formats, lazy loading, resource priorities,
   render-blocking scripts, font loading, CWV (LCP, INP, CLS)
   when actual measurements exist; avoid made-up values.
7. **Technical fundamentals:** semantic HTML, useful 404,
   HTTPS and mixed content, international SEO/hreflang if needed,
   locale, structured URL patterns, accessibility issues that
   affect navigation and crawlability.
8. **Search visibility tools:** GA4, Google Search Console,
   sitemap submission and coverage reports, tracking consent,
   Googlebot inspection and Rich Results Test where accessible.
   No live data means report as **NOT VERIFIED**.
9. **Local and off-page SEO (when applicable):** consistency
   of public NAP, Google Business Profile, location signals,
   review markup compliance, relevant citations and backlinks.
   Off-site data needs authorized evidence; do not fabricate it.
10. **Security and privacy as related to SEO:** consent-aware
    tracking, inaccessible or misleading pages, compromised
    pages and unsafe third-party scripts where evidenced.

## Evidence and scoring (1 to 10)

Start with 10.0 and subtract for **verified, distinct** SEO defects:

- Critical: -2.5 (e.g. production site globally noindexed).
- High: -1.2 (e.g. major important pages uncrawlable).
- Medium: -0.5 (e.g. widespread duplicate titles).
- Low: -0.2 (e.g. isolated missing descriptive alt text).

Do not double-count a single root cause. Clamp to 1.0–10.0,
round to one decimal, and show the arithmetic and coverage.
Never deduct for checks that were not possible or features that
are not applicable. A score of 10 is **not** proof of SEO success.

Rate these categories individually on the same 1–10 scale,
using only confirmed findings within each area; mark N/A or
NOT VERIFIED where evidence is missing rather than guessing:

- Crawlability / indexing
- Metadata / on-page
- Content / internal linking
- Structured data
- Performance / mobile
- Search visibility / local (if applicable)

If substantial areas could not be checked, label the overall
number **PROVISIONAL** and confidence low or medium; if there
is too little evidence, use **Score unavailable** instead.
Explain that source-code inspection cannot verify live Google
indexing, search ranking or field performance.

## Required report

# SEO audit report — read-only

**Overall SEO score:** X.X/10 (provisional if necessary)
**Coverage and confidence:** what was and was not inspected
**Project files changed:** None

### Category scores

| Category | Score | Evidence / limitation |
| --- | --- | --- |
| Crawlability and indexing | ... | ... |
| On-page SEO | ... | ... |
| Content and internal linking | ... | ... |
| Structured data | ... | ... |
| Performance and mobile | ... | ... |
| Visibility and local SEO | ... | ... |

### Confirmed improvements (highest priority first)

| Severity | File:line or URL | Evidence / problem | Impact | Suggested fix |
| --- | --- | --- | --- | --- |

Include concise code excerpts only when they clarify the issue.
Recommendations are advice, **not implemented changes**.

### Possible risks / needs manual verification

Separate inferred risks and unknowns from confirmed defects.

### Checks completed versus not verified

List exact read-only commands run, or explain static inspection.
Identify Search Console, live crawler, PageSpeed Insights,
Lighthouse, Google Business Profile, SERP and backlinks as
NOT VERIFIED unless actually reviewed.

### Score breakdown and top priorities

Show deductions and final score, then the top 3-5 actionable
next steps. End with: **No files were modified.**

## Graphify-first targeted inspection

Follow `../../../GRAPHIFY_EFFICIENCY.md` and the official installed
`$graphify` skill. Reuse an existing relevant graph, query only
likely affected files and verify results against current source.
Avoid repeated queries and whole-project code dumps.

This command is read-only: never rebuild/refresh an on-disk
index or run tools that write files. If no usable graph exists,
inspect a bounded set of relevant files and report limitations.
Do not silently claim the full project was inspected.
