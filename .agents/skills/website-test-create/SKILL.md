---
name: website-test-create
description: >-
  Create or update project-specific automated tests only, without repairing application code.
---


## Shared architecture consistency — mandatory

For PHP website projects, **read root `WEBSITE_ARCHITECTURE.md` before applying this skill** to site structure, PHP pages, partials, handlers, naming, Tailwind assets, routing, integrations or relevant tests. Use the original reference documents under `references/original-template/` as supporting details. **This contract overrides conflicting archived examples** (old PHP 7.4, custom CSS, `@apply`, old handler filenames, dynamic PHP sitemaps, generic page layouts). Preserve the current project's architecture for unrelated work; no automatic migrations. Check relevant generated or assessed results against this contract and disclose unresolved conflicts or unavailable verification. This requirement applies to audit/report skills too; report commands remain read-only and change no files.

# website-test-create

Read root `AGENTS.md` and `SECURITY_TESTING_POLICY.md` (applicable sections; read all needed criteria). Use native source tools or authorized read-only terminal commands; Graphify optional. Never bypass permissions, install dependencies without approval, or skip needed work solely to save tokens. Manual invocation only; no automatic independent audit. Distinguish executed tests from static review; use PASS, FAIL, BLOCKED, NOT TESTED, N/A as defined in policy. Continue safe checks if another check is blocked.

Discover or reuse a valid test plan, existing runner and conventions. Create missing meaningful tests, test fixtures and test-only configuration; preserve app source and existing user modifications. Prefer existing tooling; explain blocked categories and ask approval before new dependencies. Cover risk and requirement matrix; include regression, negative, boundary and failure cases. Use isolated/synthetic data and strong assertions. Verify new tests safely where practical, report executed outcomes separately; do not weaken tests or modify app code. List test files changed, gaps and next steps. If no runner, create suitable tests only when executable strategy is justified; never claim they ran without evidence.

## Architecture-specific responsibility

Create tests against actual behavior and canonical PHP skeleton/handlers without restructuring application sources; avoid hardcoding an unrelated framework.
