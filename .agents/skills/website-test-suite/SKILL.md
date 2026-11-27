---
name: website-test-suite
description: >-
  Orchestrate project-aware planning, test creation, execution and quality reporting.
---


## Shared architecture consistency — mandatory

For PHP website projects, **read root `WEBSITE_ARCHITECTURE.md` before applying this skill** to site structure, PHP pages, partials, handlers, naming, Tailwind assets, routing, integrations or relevant tests. Use the original reference documents under `references/original-template/` as supporting details. **This contract overrides conflicting archived examples** (old PHP 7.4, custom CSS, `@apply`, old handler filenames, dynamic PHP sitemaps, generic page layouts). Preserve the current project's architecture for unrelated work; no automatic migrations. Check relevant generated or assessed results against this contract and disclose unresolved conflicts or unavailable verification. This requirement applies to audit/report skills too; report commands remain read-only and change no files.

# website-test-suite

Read root `AGENTS.md` and `SECURITY_TESTING_POLICY.md` (applicable sections; read all needed criteria). Use native source tools or authorized read-only terminal commands; Graphify optional. Never bypass permissions, install dependencies without approval, or skip needed work solely to save tokens. Manual invocation only; no automatic independent audit. Distinguish executed tests from static review; use PASS, FAIL, BLOCKED, NOT TESTED, N/A as defined in policy. Continue safe checks if another check is blocked.

Perform stages of website-test-plan, website-test-create, website-test-run and website-test-report using their instructions and shared policy. Reuse current evidence; no repeated independent scans. Discover applicable categories and requirements, inspect test quality, create missing test files/fixtures/test-only config, execute safe available tests, evaluate assertions and coverage, summarize remaining risks. This explicitly authorizes test-only changes, not application fixes, dependency installs or production effects. Preserve failed tests and report them; do not repair app or manipulate tests to pass. Mark blocked tests, continue others. Consider mutation/flaky/fuzz/contract tests only as applicable and safe. Output consolidated requirement matrix, actual counts, test files changed, issues, evidence and next actions.

## Architecture-specific responsibility

Plan/create/run/report against actual architecture and relevant template conventions; no application-source edits or automatic structure migration.
