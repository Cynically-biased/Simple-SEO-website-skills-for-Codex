---
name: website-test-plan
description: >-
  Discover project-specific testing requirements and missing coverage; read-only.
---


## Shared architecture consistency — mandatory

For PHP website projects, **read root `WEBSITE_ARCHITECTURE.md` before applying this skill** to site structure, PHP pages, partials, handlers, naming, Tailwind assets, routing, integrations or relevant tests. Use the original reference documents under `references/original-template/` as supporting details. **This contract overrides conflicting archived examples** (old PHP 7.4, custom CSS, `@apply`, old handler filenames, dynamic PHP sitemaps, generic page layouts). Preserve the current project's architecture for unrelated work; no automatic migrations. Check relevant generated or assessed results against this contract and disclose unresolved conflicts or unavailable verification. This requirement applies to audit/report skills too; report commands remain read-only and change no files.

# website-test-plan

Read root `AGENTS.md` and `SECURITY_TESTING_POLICY.md` (applicable sections; read all needed criteria). Use native source tools or authorized read-only terminal commands; Graphify optional. Never bypass permissions, install dependencies without approval, or skip needed work solely to save tokens. Manual invocation only; no automatic independent audit. Distinguish executed tests from static review; use PASS, FAIL, BLOCKED, NOT TESTED, N/A as defined in policy. Continue safe checks if another check is blocked.

Inventory requirements, features, routes, languages, test runners, tests, integrations, deployment and risks. Select applicable categories from policy and explain N/A/unknown. Map features and threats to test scenarios (happy, negative, boundary, failure, abuse). Identify existing meaningful coverage, gaps and required tooling/isolation. Output prioritized test IDs, expected behavior, proposed test type, test location, prerequisites and safe execution plan. No file changes, installations or active testing. Do not assume absence of code means absence of requirement.

## Architecture-specific responsibility

Discover project features from the canonical PHP template and its optional folders; select applicable tests only. Include shared page/partial and form-handler contract tests when relevant.
