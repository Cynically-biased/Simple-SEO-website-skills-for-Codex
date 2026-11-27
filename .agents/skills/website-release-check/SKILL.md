---
name: website-release-check
description: >-
  Read-only release readiness gate using current evidence and safe verification; never deploy.
---


## Shared architecture consistency — mandatory

For PHP website projects, **read root `WEBSITE_ARCHITECTURE.md` before applying this skill** to site structure, PHP pages, partials, handlers, naming, Tailwind assets, routing, integrations or relevant tests. Use the original reference documents under `references/original-template/` as supporting details. **This contract overrides conflicting archived examples** (old PHP 7.4, custom CSS, `@apply`, old handler filenames, dynamic PHP sitemaps, generic page layouts). Preserve the current project's architecture for unrelated work; no automatic migrations. Check relevant generated or assessed results against this contract and disclose unresolved conflicts or unavailable verification. This requirement applies to audit/report skills too; report commands remain read-only and change no files.

# website-release-check

Read root `AGENTS.md` and `SECURITY_TESTING_POLICY.md` (applicable sections; read all needed criteria). Use native source tools or authorized read-only terminal commands; Graphify optional. Never bypass permissions, install dependencies without approval, or skip needed work solely to save tokens. Manual invocation only; no automatic independent audit. Distinguish executed tests from static review; use PASS, FAIL, BLOCKED, NOT TESTED, N/A as defined in policy. Continue safe checks if another check is blocked.

Derive release criteria from actual project scope, risk and target hosting. Review required functionality/test coverage, critical security controls, private-file and secret exposure, dependencies, integrity, config, HTTPS, SEO architecture, accessibility/performance where relevant, recovery and operations. Reuse matched current revision/environment evidence; verify gaps safely when permitted, never assume a prior pass is current. No code/test changes, deployments, production mutations or automatic fixes. Apply policy READY / READY WITH WARNINGS / NOT READY / UNVERIFIED gate, list blockers, missing evidence, accepted nonblocking risks and next steps. A high score or many passing tests cannot override a critical issue.

## Architecture-specific responsibility

Verify released artifact maintains the canonical page/partial contract, static sitemap, private resource protection and relevant integration prerequisites; mark unverifiable hosting checks as UNVERIFIED.
