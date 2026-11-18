---
name: website-naming-fix
description: >-
  On-demand check and safe repair of descriptive file naming conventions
  for PHP/Tailwind websites. Prefix non-page PHP filenames with an
  underscore, preserve unprefixed public PHP page routes, and update all
  verified references when a rename is safe. Supports --check for a
  read-only report. Never bulk-rename uncertain routes or dependencies.
---

# Website naming check and fix (explicitly invoked)

Run when the user invokes `$website-naming-fix` or
`$website-naming-fix --check`. Root `FILE_NAMING.md` is authoritative.
Read `references/naming-fix-procedure.md` for the complete safety procedure.

## Scope and modes

- `--check`: **strictly read-only**; inventory and report naming violations,
  recommended names, references to update and risk. Do not modify files,
  rename, refresh indexes or invoke auto-fixing commands.
- Default `$website-naming-fix`: perform a **focused, evidence-based rename
  pass** across eligible first-party project files. Rename only when source
  ownership, required name, references and backward compatibility are clear;
  update each known reference in the same change set.
- If a rename may break live page URLs, deployment configuration, Composer
  autoloading, external callers, case-sensitive paths or dynamic includes,
  **do not perform that rename automatically**. Report BLOCKED / needs
  approval, with a concrete migration plan. Do not invent redirects.
- Never rename vendor, third-party, generated, framework-required, or
  tool-managed files, or override required public entrypoint names.
- This command is distinct from `$website-structure-report` (read-only),
  `$website-format-code` (formatting only) and `$website-cleanup-report`
  (read-only, no deletion). Never invoke those automatically.

## Mandatory classification and naming

- Check file responsibilities from actual route, form, include, build,
  configuration and autoload references, not just directory or prefix.
- Public PHP **website pages**: descriptive lowercase kebab-case basename,
  **no** `_` prefix (e.g. `about.php`, `roof-inspection.php`).
- All first-party **non-page PHP**: descriptive basename with a single `_`
  prefix (e.g. `components/_service-card.php`, `handlers/_contact-submit.php`,
  `data/_services.php`, `enums/_ServiceType.php`). Directly POSTed PHP
  handlers are **not** pages merely because they are reachable via HTTP.
- One enum per distinct choice domain; match class/file naming conventions
  when relevant without changing PHP type names or application logic.
- Non-PHP source and assets use purposeful names without PHP-prefix rules.
- Do not rename a file just for aesthetic preference when it already clearly
  describes the contents and satisfies the convention.

## Efficient but complete inspection

- Use Git tracked files and scoped filename inventory, ignoring generated
  and dependency directories. Read only the references needed to classify
  files and establish rename safety; optionally use current Graphify data.
- Group related renames and update verified `require`, `include`, autoload,
  imports, routes, form actions, template calls, JS, config, docs/tests and
  deployment references that are actually affected.
- Check modified PHP syntax and applicable targeted reference checks;
  inspect diff for unintended modifications. Verify the old paths are not
  still referenced by known sources. Do not do unrelated full-site audits.
- Summarize fixed, compliant, blocked and unverified items; give old/new
  paths, evidence, changed references and verification results.
- Never delete files merely because they look unused. Keep the diff small.
