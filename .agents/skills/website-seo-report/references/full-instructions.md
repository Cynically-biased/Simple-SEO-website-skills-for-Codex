---
name: website-seo-report
description: >-
  Manually audit a website for Google and other search engines.
  Score evidence-backed SEO quality from 1 to 10, prioritize
  improvements, and never modify project files.
---

# Manual SEO quality audit (read-only)

## Required sitemap audit rule

- Check for a physical root `sitemap.xml` containing valid XML.
- Flag `sitemap.php`, dynamic PHP sitemap routes or rewrites to PHP
  as violations even if they return an XML content type.
- Check `robots.txt` points to the physical XML sitemap, and that
  its URLs are canonical, absolute, indexable, accurate and current.
- This is a read-only audit: report violations and their locations,
  but never edit or generate a sitemap as part of the report.
- Older reference material permits PHP sitemap generation; that
  option is superseded by this project's static-XML requirement.


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

## Deep audit protocol (required; run only when requested)

Use `references/advanced-seo-audit.md` as the **mandatory detailed
checklist and score rubric**. Do not skip applicable checks simply
because the old summary listed a more limited set.

1. Discover actual routes, templates and rendered page content. Use
   Graphify to locate relevant code, but verify against current
   source and, if authorized, read-only live responses. For PHP
   templates, avoid treating literal shared partials as full pages.
2. Make a per-page SEO inventory: path/URL, indexability, canonical,
   title, description, primary heading, content intent, internal
   links and any structured data. Include important public pages.
3. Deep-check the actual root `sitemap.xml`: well-formedness, XML
   namespace, `<loc>`, URL set, indexable canonical URLs, HTTPS,
   site scope, duplicates, redirects, missing pages, excluded pages,
   sitemap index limits, robots.txt discovery, and `<lastmod>`.
4. Explicitly **flag missing `<lastmod>` as an optimization
   opportunity** for maintained indexable pages. Check the value
   is valid W3C date or datetime, not future-dated, and reflects
   a genuine significant page-content change. Do not invent dates
   or recommend automatically setting today on every build.
   `<lastmod>` is optional under the protocol: its absence alone
   does NOT make a sitemap invalid. Google ignores `<priority>`
   and `<changefreq>`; do not penalize their absence or recommend
   adding them for Google-ranking benefit.
5. Assess Google search-result *candidates*: the HTML `<title>`,
   meta description, visible headings, hero text and other relevant
   snippets. Inspect uniqueness, intent, clarity, locality,
   branding, overly generic/duplicated copy, truncation risk
   and consistency with visible content. Write proposed improved
   title and meta-description text **in the report only** for
   high-value pages. Search engines may rewrite both; never claim
   an exact preview or guaranteed Google display.
6. Review crawl/index mechanics: robots.txt versus noindex,
   X-Robots-Tag, canonical consistency, server status and
   redirects, crawlable links, render-dependent content, and
   URL variants. Label source-only unknowns explicitly.
7. Audit content quality: clear search intent, relevant naturally
   used query language, answer completeness, originality, helpful
   headings, content hierarchy, important page coverage,
   internal link anchors, helpful image descriptions, duplicate
   or near-duplicate content, expertise/trust indicators and
   local business details where appropriate. Do not recommend
   keyword stuffing or claim a precise ideal word count.
8. Inspect structured data for syntax, content agreement and
   Google rich-result eligibility where the schema type is
   supported. Don't assume all Schema.org types produce rich
   results; confirm with applicable Google documentation.
9. Check mobile access, page experience, image/JS performance,
   rendering risks and CWV. Report LCP, INP or CLS only if
   genuinely measured; otherwise give source-based risks and
   **NOT VERIFIED** measurement status.
10. Examine international SEO, local SEO, Search Console and
    analytics only when relevant. Distinguish configured tags
    from verified indexing and traffic. Evaluate actual search
    visibility and ranking only with authorized live evidence.

## Evidence-backed scoring (1–10)

- Use the category weights and severity guidance in
  `references/advanced-seo-audit.md`.
- Deduct only for grounded failures; avoid counting the same
  underlying issue in multiple categories. Do not inflate the
  score by treating unknowns as passed checks.
- `lastmod` missing on useful update-prone sitemap pages should
  be reported as a **low-priority opportunity**, not a critical
  defect. Invalid/fabricated `lastmod` deserves higher priority.
- Score 1–10 with one decimal, plus sub-scores, evidence coverage
  and confidence (HIGH / MEDIUM / LOW). When too much is unknown,
  show **PROVISIONAL** or **SCORE UNAVAILABLE**.
- This score estimates **observable SEO implementation quality**;
  it does not forecast Google positions, clicks, impressions or
  the likelihood of appearing in any particular result.

## Required output — comprehensive, actionable SEO report

Use the user's preferred language for narrative (Dutch if the
project's `AGENTS.md` requests it). Keep technical names intact.

### Summary

- Overall SEO implementation score: **X.X/10** or UNAVAILABLE
- Evidence coverage and confidence, including source vs live
- Total issues by Critical / High / Medium / Low / Opportunity
- Clearly state: **No project files were modified.**

### Category scorecard

| Category | Score | Evidence | What is not verified |
| --- | --- | --- | --- |
| Crawl/indexing | ... | ... | ... |
| XML sitemap / robots | ... | ... | ... |
| Titles / descriptions / SERP | ... | ... | ... |
| Content / search intent | ... | ... | ... |
| Internal links / architecture | ... | ... | ... |
| Structured data | ... | ... | ... |
| Mobile / speed | ... | ... | ... |
| Local / international / visibility | ... | ... | ... |

### Sitemap inspection table

Include **each important sitemap URL**, or a representative
sample plus full counts for a large site. Show `<loc>`, `<lastmod>`
(present/missing/invalid/unverifiable), canonical/indexability,
any consistency issue, and recommended action. State how many
entries lack `<lastmod>`, use implausible dates, are noncanonical,
or are important pages missing from the sitemap.

### Search-result appearance review

For important pages, present current title and description,
likely *candidate* snippet text, concerns and suggested improved
copy. Distinguish actual markup from inferred visible text.
Do **not** represent your mockup as Google's real SERP output.

### Findings and fixes — prioritized

| Severity | File:line or URL | Evidence | Why it matters | Suggested correction |
| --- | --- | --- | --- | --- |

For important problems, include exact *proposed* replacement
metadata or content recommendations **as text, not edits**.
Group site-wide root causes rather than repeating every URL.

### Additional sections

- Content and internal-link opportunities, with suggested page
  topics only when justified by the website's services/audience.
- Schema / performance / mobile / local / international results.
- Read-only checks completed; tests NOT RUN / NOT VERIFIED.
- Score math and deductions, uncertainty and top 5 priorities.
- Final line: **No files were modified.**

Never silently rewrite the sitemap, metadata, code, files or
analytics settings as part of this command. External tools are
optional; obey read-only and authorization limits.

## Graphify-first targeted inspection

Follow `../../../GRAPHIFY_EFFICIENCY.md` and the official installed
`$graphify` skill. Reuse an existing relevant graph, query only
likely affected files and verify results against current source.
Avoid repeated queries and whole-project code dumps.

This command is read-only: never rebuild/refresh an on-disk
index or run tools that write files. If no usable graph exists,
inspect a bounded set of relevant files and report limitations.
Do not silently claim the full project was inspected.
