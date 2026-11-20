# Skill Reliability Update

- Integrity audit: actual first-party source through native file readers or
  read-only terminal commands; no bundled scanner, `.ps1`, or auto-repair.
- Design audit: direct Edge/Chrome headless CLI captures, not a `.ps1` script;
  image-inspection capability still required to verify visual defects.
- Formatter: targeted non-mutating PHP/JS syntax checks permitted after edits.
- Test report: authorized isolated read-only checks may use OS-temp artifacts,
  never production credentials, state or repository writes.
- Project-wide requests: track eligible, inspected, excluded, inaccessible
  files; no misleading complete coverage claims.
- Superseded examples in historical references do not override active rules.

No automatic audits, unapproved installs, execution-policy bypasses, desktop
control, project changes during read-only reports, or unrequested repairs.
