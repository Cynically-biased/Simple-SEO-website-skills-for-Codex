# Safe filename audit and rename procedure

## Preflight

1. Establish the intended project scope and source inventory using scoped
   Git listing / file discovery; exclude `vendor/`, `node_modules/`, output,
   caches, `.git/`, generated assets, and upstream third-party code.
2. Read root `FILE_NAMING.md`, relevant PHP routes/entrypoints and the
   existing autoload/deployment patterns. Detect a dirty working tree and
   do not overwrite unrelated modifications; preserve current user edits.
3. Determine every first-party PHP file's actual role. Check web routes,
   rewrite rules, includes, form actions and Composer/class autoloading.
   Treat entrypoints serving users as website pages; treat handlers, APIs,
   includes, arrays, components and enums as implementation files, with
   exceptions only for framework-required stable filenames.
4. Identify misleading/generic names and missing/extra `_` prefixes.
   Suggest exact descriptive names and record old/new paths.

## Safe edit mode (default command only)

5. Verify each planned rename won't break live URL contracts, form submissions,
   external integrations, dynamic includes, PSR-4 class autoloading,
   case-sensitive filesystems, deployment paths or framework conventions.
   If uncertain, BLOCK the rename and report what must be confirmed.
6. Apply approved safe renames with `git mv` when appropriate; otherwise
   use a normal filesystem move. On case-insensitive Windows filesystems,
   handle casing carefully. Avoid collisions, overwrites and double `_`.
7. Update *all confirmed in-repo references* to moved paths, including PHP
   require/include, classmap/autoload references, route mappings, form
   actions, JavaScript, test fixtures, configs and project documentation.
   Update only references that truly resolve to the renamed file.
8. Verify relevant PHP syntax (when PHP is available), path resolution,
   references, routing/form-action dependencies and minimal targeted checks.
   Check the diff and remove accidental unrelated edits. Do not rewrite
   unrelated files or automatically run independent report commands.
9. Report: FIXED old→new; ALREADY COMPLIANT; BLOCKED with reason;
   UNVERIFIED with cause. Explicitly name checks not run.

## --check (read-only)

Perform steps 1–4 and reference/risk analysis without altering source,
index files, project metadata, Git state, or any generated artifacts.
Provide count, path, classification, proposed filename and a risk rating.

## Rule boundaries and exceptions

- A leading underscore is organizational convention, NOT web access security.
  Internal code should have appropriate access restrictions or live outside
  the document root.
- Page URL preservation is paramount; a route rename may need deployment-
  compatible redirects and separate authorization. Do not guess them.
- PHP enums in `_ServiceType.php` still declare `ServiceType`. If PSR-4 or
  framework autoloading requires a different file name, stop and explain
  instead of silently breaking class resolution.
- Never automatically normalize standard filenames such as `index.php` or
  framework/host-mandated special files.
- Even when the command is invoked, ambiguous changes stay proposals.

## Quality-first precedence

Quality-first policy: efficiency is a preference, never a quality or scope cap. Expand source inspection, load additional applicable references, revisit earlier decisions, rewrite necessary code, and choose batch sizes as needed for correctness, completeness and maintainability. Perform relevant authorized, non-destructive verification; separate report commands remain manual-only. Creative design has no artificial exploration, variant, complexity, batch or token budget. Preserve user scope, branding requirements, strict Tailwind-only styling, PHP conventions, security, accessibility and permissions. Do not bypass platform limits or require external tools. Explicit standard/deep/full/visibility audit modes remain distinct; disclose incomplete coverage and never treat unverified checks as passing.
