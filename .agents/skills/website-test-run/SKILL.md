---
name: website-test-run
description: >-
  Execute applicable existing tests, optionally selecting a category; no source changes.
---


## Shared architecture consistency — mandatory

For PHP website projects, **read root `WEBSITE_ARCHITECTURE.md` before applying this skill** to site structure, PHP pages, partials, handlers, naming, Tailwind assets, routing, integrations or relevant tests. Use the original reference documents under `references/original-template/` as supporting details. **This contract overrides conflicting archived examples** (old PHP 7.4, custom CSS, `@apply`, old handler filenames, dynamic PHP sitemaps, generic page layouts). Preserve the current project's architecture for unrelated work; no automatic migrations. Check relevant generated or assessed results against this contract and disclose unresolved conflicts or unavailable verification. This requirement applies to audit/report skills too; report commands remain read-only and change no files.

# website-test-run

Read root `AGENTS.md` and `SECURITY_TESTING_POLICY.md` (applicable sections; read all needed criteria). Use native source tools or authorized read-only terminal commands; Graphify optional. Never bypass permissions, install dependencies without approval, or skip needed work solely to save tokens. Manual invocation only; no automatic independent audit. Distinguish executed tests from static review; use PASS, FAIL, BLOCKED, NOT TESTED, N/A as defined in policy. Continue safe checks if another check is blocked.

Discover existing test commands and check safety/isolation before execution. Default and --all run all relevant available tests within requested scope; optional selectors --unit, --feature, --integration, --e2e, --security, --regression, --performance, --accessibility, --smoke, --boundary, --negative, --responsive, --api, --database, --compatibility, --syntax, --configuration, --data-integrity, --load, --recovery, --mutation, --property-based, --fuzz, --contract, --concurrency, --fault-injection, --privacy, --dependency, --deployment, --backup-restore, --test-quality, --flaky. These are natural-language skill arguments, not independent executables. Map selector to actual available tests; report missing tests rather than create them. Run actual commands, use temp outputs outside project, no app or persistent project edits. Report test matrix and invocation evidence, failures, missing tests and prerequisites.

## Architecture-specific responsibility

Recognize project-specific PHP routes, handlers and available runtime; do not confuse source filenames with clean URLs, and avoid real external side effects.
