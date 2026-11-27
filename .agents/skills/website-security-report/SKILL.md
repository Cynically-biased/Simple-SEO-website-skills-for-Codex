---
name: website-security-report
description: >-
  Read-only project-specific security assessment; --deep adds wider data-flow and trust-boundary analysis.
---


## Shared architecture consistency — mandatory

For PHP website projects, **read root `WEBSITE_ARCHITECTURE.md` before applying this skill** to site structure, PHP pages, partials, handlers, naming, Tailwind assets, routing, integrations or relevant tests. Use the original reference documents under `references/original-template/` as supporting details. **This contract overrides conflicting archived examples** (old PHP 7.4, custom CSS, `@apply`, old handler filenames, dynamic PHP sitemaps, generic page layouts). Preserve the current project's architecture for unrelated work; no automatic migrations. Check relevant generated or assessed results against this contract and disclose unresolved conflicts or unavailable verification. This requirement applies to audit/report skills too; report commands remain read-only and change no files.

# website-security-report

Read root `AGENTS.md` and `SECURITY_TESTING_POLICY.md` (applicable sections; read all needed criteria). Use native source tools or authorized read-only terminal commands; Graphify optional. Never bypass permissions, install dependencies without approval, or skip needed work solely to save tokens. Manual invocation only; no automatic independent audit. Distinguish executed tests from static review; use PASS, FAIL, BLOCKED, NOT TESTED, N/A as defined in policy. Continue safe checks if another check is blocked.

Inventory exposed routes, assets, identities, data, secrets, trust boundaries, dependencies and deployment. Evaluate relevant policy controls and threat models. Default: comprehensive applicable categories through source/config/dependency evidence, follow suspicious paths. --deep: trace end-to-end inputs, sinks, roles, object ownership, integrations, deployment and abuse/failure paths; expand to all eligible relevant sources and disclose gaps. Verify with safe isolated checks when authorized; no aggressive live tests, code changes or secret disclosure. Report severity, evidence, reachability, impact, confidence, remediation, test recommendations and unverified controls. Distinguish suspected from confirmed vulnerability, and static review from actual execution. Never claim certification or absence of vulnerabilities.

## Architecture-specific responsibility

Audit public/private PHP file exposure, actual server routing and handler entry points, not only underscore names; flag exposed template docs and Graphify output, with source evidence.
