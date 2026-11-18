---
name: website-cleanup-report
description: >-
  On-demand, strictly read-only audit to find potentially unused, obsolete,
  duplicated or unnecessary project files, folders, code, assets and
  dependencies in PHP/Tailwind websites. Explain evidence and deletion risk;
  never remove anything or change project files.
---

# On-demand cleanup report (read-only)

- Run **only when explicitly invoked** as `$website-cleanup-report`.
- **Never delete, move, modify, or automatically clean up any files**, including
  tracked, untracked, generated and ignored files. Do not run cleanup commands.
- First inspect a lightweight file inventory, manifests and available Git
  metadata; search references selectively, not with a full repository dump.
- Identify unused or duplicate source, unused components/handlers/enums/data,
  stale assets, legacy CSS, empty directories, old backups/build output,
  unused dependencies and redundant configuration **as candidates**.
- Inspect source and runtime/deploy entry points before claiming a file is
  unnecessary. An absence of text matches does **not** prove safe removal.
- Account for dynamic includes, routing, reflection, template conventions,
  URL links, JS imports, CSS/Tailwind config, external deploy/CDN references,
  cron jobs, autoloaders, PHP sessions and environment configuration.
- Preserve user data, secrets, `.env`, caches required at runtime, vendor
  dependencies, lockfiles, framework metadata and other critical artifacts.
- Mark each finding as **High confidence**, **Needs verification** or
  **Keep / no removal recommendation** with file path and concrete evidence.
- Recommend a safe verification and rollback method; do not take action.
- Conclude with concise candidate counts, risk level, prioritized findings
  and a short list of uncertainties. Do not claim a clean project if checks
  were limited.
- Read `references/cleanup-checklist.md` when invoked for detailed search
  scope, evidence rules, output format and high-risk exceptions.
- This command is separate from `$website-structure-report` (architecture),
  `$website-test-report` (quality) and `$website-format-code` (formatting).

Root `AGENTS.md` remains authoritative for project conventions.
