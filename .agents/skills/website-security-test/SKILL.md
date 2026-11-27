---
name: website-security-test
description: >-
  Execute applicable authorized security tests in isolated environments; no application fixes.
---


## Shared architecture consistency — mandatory

For PHP website projects, **read root `WEBSITE_ARCHITECTURE.md` before applying this skill** to site structure, PHP pages, partials, handlers, naming, Tailwind assets, routing, integrations or relevant tests. Use the original reference documents under `references/original-template/` as supporting details. **This contract overrides conflicting archived examples** (old PHP 7.4, custom CSS, `@apply`, old handler filenames, dynamic PHP sitemaps, generic page layouts). Preserve the current project's architecture for unrelated work; no automatic migrations. Check relevant generated or assessed results against this contract and disclose unresolved conflicts or unavailable verification. This requirement applies to audit/report skills too; report commands remain read-only and change no files.

# website-security-test

Read root `AGENTS.md` and `SECURITY_TESTING_POLICY.md` (applicable sections; read all needed criteria). Use native source tools or authorized read-only terminal commands; Graphify optional. Never bypass permissions, install dependencies without approval, or skip needed work solely to save tokens. Manual invocation only; no automatic independent audit. Distinguish executed tests from static review; use PASS, FAIL, BLOCKED, NOT TESTED, N/A as defined in policy. Continue safe checks if another check is blocked.

Discover threat model and security test inventory; select SAST, DAST, SCA, secrets, authorization, business logic, privacy, configuration, client-side and supply-chain verification where relevant. Use actual existing tests or safe bounded isolated probes, synthetic data, test doubles and sandbox adapters; do not create persistent tests unless separately requested via test-create/suite. Never send real mail, initiate payments, modify production or scan external targets without explicit scope. Check actual advisory sources if accessible and report date/version. Redact all secret values, do not upload sensitive code. Record expected vs observed results, command evidence, risk, blocked tests and recommendations. Continue non-mutating checks if dynamic environment unavailable.

## Architecture-specific responsibility

Use actual PHP routing/handler contract when devising isolated safe tests; avoid scanning production or changing real data.
