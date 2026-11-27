---
name: website-test-report
description: >-
  Run an explicit, read-only website quality review and return a
  scored report from 1 to 10 with actionable issues and locations.
  Never modify project files or automatically fix any finding.
---


## Shared architecture consistency — mandatory

For PHP website projects, **read root `WEBSITE_ARCHITECTURE.md` before applying this skill** to site structure, PHP pages, partials, handlers, naming, Tailwind assets, routing, integrations or relevant tests. Use the original reference documents under `references/original-template/` as supporting details. **This contract overrides conflicting archived examples** (old PHP 7.4, custom CSS, `@apply`, old handler filenames, dynamic PHP sitemaps, generic page layouts). Preserve the current project's architecture for unrelated work; no automatic migrations. Check relevant generated or assessed results against this contract and disclose unresolved conflicts or unavailable verification. This requirement applies to audit/report skills too; report commands remain read-only and change no files.

# Manual read-only code-quality report

- This is explicitly opt-in and **read-only**: never edit, repair, format, sync or regenerate anything.
- Inspect relevant files (or all eligible first-party files for an explicit project-wide audit); report coverage and evidenced issues with file/line, impact and suggested fix.
- Permit safe, authorized non-mutating lint/tests and isolated temporary artifacts outside the project; never change application or production state.
- Provide a transparent overall 1–10 score and note unknown/unverified checks.
- Never run this automatically during `$website-workflow`.
- Read `references/full-instructions.md` when this report is invoked to preserve its complete scoring/output requirements; read only applicable project sources.

## Progressive disclosure

The full previous operational instructions are retained in
`references/full-instructions.md`. Consult **relevant sections** when
needed; for report/formatter invocations, read all necessary audit or
formatting criteria before executing. Do not read unrelated skills.

Root `AGENTS.md` is authoritative for the common invariants.

## Quality-first precedence

Quality-first policy: efficiency is a preference, never a quality or scope cap. Expand source inspection, load additional applicable references, revisit earlier decisions, rewrite necessary code, and choose batch sizes as needed for correctness, completeness and maintainability. Perform relevant authorized, non-destructive verification; separate report commands remain manual-only. Creative design has no artificial exploration, variant, complexity, batch or token budget. Preserve user scope, branding requirements, strict Tailwind-only styling, PHP conventions, security, accessibility and permissions. Do not bypass platform limits or require external tools. Explicit standard/deep/full/visibility audit modes remain distinct; disclose incomplete coverage and never treat unverified checks as passing.

## V2 test evidence and quality (supplements previous rubric)
Apply `SECURITY_TESTING_POLICY.md`: requirement/feature coverage matrix, test quality, risks, relevant negative/boundary/security scenarios, actual execution counts and evidence, missing coverage and limitations. Source-score rubric remains separate; no score implies tested or secure. Read-only review may execute safe tests in an isolated copy with disposable artifacts outside the project, including synthetic test DB/mail doubles; never mutate actual project or production or create persistent tests. This clarifies older bans on database/form tests: real effects are prohibited, isolated simulated effects allowed. Graphify optional. Never invoke test-create or test-suite from this report. Use PASS/FAIL/BLOCKED/NOT TESTED/N/A; legacy NOT RUN means NOT TESTED or BLOCKED as appropriate.

## Architecture-specific responsibility

When assessing relevant code, include template adherence: metadata-before-header, shared partial includes, PRG forms, JS included once, routing, Tailwind-only and security protections. Never mark unexecuted tests PASS.
