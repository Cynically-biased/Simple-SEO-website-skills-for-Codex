# Website cleanup audit: inspection checklist and reporting contract

## Purpose and non-destructive boundary

Find candidates for manual removal with evidence, not a list of anything
unfamiliar. Never delete, rename, rewrite, regenerate, reformat, or modify
source or artifacts. Never run `rm`, `del`, `Remove-Item`, `git clean`,
`git reset`, pruning scripts, dependency uninstallers or other destructive
commands. Avoid executing app code or build scripts merely to identify unused
files. Do not edit `.gitignore` automatically. Git-safe checks must not mutate
working-tree contents.

## Token-efficient inspection order

1. Establish the working root and scope. Read only relevant project guidance,
   Git tracked/untracked summaries where available, high-level paths, and
   entry points (`index.php`, route config, `composer.json`, `package.json`,
   deployment config, build configs). Do not recursively print file contents.
2. Identify likely cleanup categories by path and pattern (e.g. `*.bak`,
   `*.old`, duplicate suffixed files, unused mockups, orphan images, abandoned
   temporary scripts, stale compiled output) **without equating names to proof**.
3. Query use sites with targeted search (`rg` or equivalent) for each candidate;
   cross-check static PHP `require/include`, component calls, autoloading,
   template variables, HTML links, forms/actions, imports, JS lazy/dynamic
   imports, CSS/Tailwind processing, assets in metadata and sitemap URLs.
4. Check indirect use: URL-based retrieval, `.htaccess`, web server rewrites,
   framework routing conventions, includes assembled from variables, enums
   accessed dynamically, dependency injection/reflection, event handlers,
   background jobs, CI/CD, environment variables, external services and
   deployments. Treat unverifiable external references as uncertainty.
5. Check dependency candidates against lockfiles, build tooling and scripts;
   never label a package unused merely because it has no source import.
6. Avoid reading dependency directories (`vendor/`, `node_modules/`), Git
   internals, media binaries, cache trees or build output in full. Inspect
   their roles/configuration instead. Reuse available Graphify data only when
   it materially helps; do not build or refresh the entire graph for an audit.
7. Stop once evidence is sufficient for a useful report. If the requested
   scope is extensive, report assessed areas and unresolved areas clearly.

## Special safeguards

- **Never suggest deletion based only on a filename, zero static references,
  age, file size, or an empty Git status.** Confirm the intended purpose.
- Root entry points, shared PHP partials, `handlers/`, `enums/`, `components/`,
  `data/*.php`, sitemap.xml, robots.txt, canonical assets, favicon/manifest,
  security files, server config, `AGENTS.md`, `.agents/`, SEO files, Graphify
  metadata and skill references may be required even when unused in text search.
- Distinguish **unneeded source** from **generated but required runtime assets**.
  For example, Tailwind compiled CSS may be required for deployment even though
  developers do not edit it. Protect source/build pipelines and deployment.
- Keep lockfiles (`composer.lock`, lockfile for JS package manager), license,
  project docs, migration records, backups with uncertain recovery value,
  uploads/user-generated content, database state and secrets unless their
  owner confirms explicit safe removal; never expose secret contents.
- An empty directory may be intentional; Git generally does not track empty
  directories. Note whether an empty path is explicitly required by app code.
- Avoid executing potentially untrusted scripts or recursively traversing
  symlinks. Respect access boundaries and very large repos.
- Current project conventions (strict Tailwind-only, modular PHP array data,
  one enum per domain and component/handler separation) are relevant clues,
  but a convention violation alone does NOT prove a file can be removed.

## Finding classes

- **High confidence candidate:** clear duplicate or obsolete artifact with
  matching source/config/deploy evidence; still requires manual approval.
- **Needs verification:** apparent unused code/file with possible dynamic,
  deployed, external, generated or user-data usage. State exactly what
  follow-up check is needed before removal.
- **Keep / no removal recommendation:** evidence suggests current usage,
  critical config/runtime role or insufficient proof.

Assign cleanup impact and deletion risk separately (low/medium/high) and
cite specific paths, line numbers where meaningful, reference search details
and observed uncertainty. Flag missing evidence rather than inventing it.

## Required output

Title: `Website cleanup report (read-only)`.

1. Scope: root, files/areas inspected, exclusions, whether Git/Graphify was
   available, and whether runtime/deploy paths could be verified.
2. Summary: high-confidence candidates, needs-verification count, keep items;
   estimated space savings only where objectively measurable. No invented
   scores or false certainty.
3. Findings table: path, type (file/folder/code/dependency/asset), reason,
   evidence (with file:line when appropriate), confidence, risk, and recommended
   manual follow-up.
4. Important retained items: why seemingly unused essentials should stay.
5. Manual verification plan: confirm references in staging, check deployment,
   run targeted tests, make a Git commit/backup before *user-authorized*
   cleanup, and check site functionality afterward.
6. Explicit statement: `No files were deleted or modified.`

Never automatically invoke this skill from `$website-workflow`, other reports,
or `$website-format-code`. If user separately asks for deletion, that is a new
explicitly authorized task and should use a safe, independent plan.
