# Integrity audit evidence guide

## What counts as evidence

- Invalid UTF-8 bytes: report the file and strict decoding failure; may be
  intentional Windows-1252 or another encoding rather than damaged content.
- U+FFFD: report as suspicious replacement character, not proof the source
  was corrupted by this tool.
- Mojibake sequences: high false-positive risk in documentation/examples.
  Show short sanitized excerpts and validate intended locale if possible.
- Merge markers: `<<<<<<<`, `=======`, `>>>>>>>` in a plausible conflict
  block. Isolated examples in Markdown/docs are not necessarily defects.
- Line endings: mixed CRLF/LF is a consistency warning, not syntax corruption.
- PHP `php -l`, Node `node --check` and JSON parse errors are concrete parse
  failures, but do not establish that a file was damaged or that the complete
  website fails at runtime. Not all JavaScript code types can be parsed in
  the same mode; recognize modules and templated JS.
- Unicode categories: TAB/CR/LF are normal; non-ASCII characters and emoji
  are allowed. Flag NUL and unexpected C0/C1 controls in text only.
- Missing closing tags/brackets and truncation may require contextual/manual
  investigation; avoid guessing original code or auto-repairing it.

## Report format

1. Scope: root, number of source files scanned by check, exclusions and
   installed tool availability.
2. Findings table: severity, confidence, file:line, evidence, likely impact,
   manual remediation.
3. Coverage gaps: unavailable parsers, suspicious binary files excluded,
   unrendered PHP, unexecuted tests, heuristic limitations.
4. Conclusion: number of confirmed syntax/encoding faults, suspected
   corruption and review-needed items. Do not give a blanket "clean"
   declaration if substantial checks were unavailable.

The report is ALWAYS read-only. Users must explicitly request changes in a
separate task.
