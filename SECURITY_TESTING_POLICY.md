# Adaptive security and intelligent testing V2
This policy augments root AGENTS.md and supersedes older conflicting test/tool instructions. It is not a certification or guarantee against breaches.

## Discovery and applicability
Discover actual requirements (including user-provided requirements not implemented yet), public routes, features, HTML/PHP/JS logic, forms, handlers, enums, data, identities/roles, trust boundaries, assets, data classification, storage, external integrations, dependency manifests/lockfiles, hosting and test environment. Read actual source, not just graph references. Graphify optional; inspect source and Git directly if missing/stale. Distinguish evidence from assumptions. For every relevant test/control record applicability and rationale; use N/A only with evidence, otherwise unknown/blocked. No speculative features or security infrastructure. Reassess as functionality changes. Prioritize exposed interfaces, sensitive data, authentication, authorization, payments, irreversible operations, shared dependencies and recent changes; no artificial coverage cap. Reuse verified evidence only when revision, environment, configuration, dependency versions and scope still match. Do not run unrelated audits automatically.

## Prevention during ordinary development
Apply relevant safeguards to requested changes and dependencies; report unrelated vulnerabilities promptly without unauthorized repairs. Prefer framework/native proven mechanisms, then existing dependencies, hosting controls, justified new libraries with approval; never invent cryptography. Threat model assets, actors, entry points, trust boundaries, abuse cases, failure paths and controls. Verify controls with negative tests, not just happy paths.
- Validate types, lengths, ranges, enums and allowed values server-side; reject malformed input; context-specific HTML/attribute/URL/JS escaping, safe DOM APIs; parameterized SQL; no unsafe shell interpolation, deserialization or dynamic includes. Prevent path traversal, SSRF, open redirects and injection where applicable.
- Forms: applicable CSRF defenses, safe HTTP methods, email header injection protection, spam/rate limits proportional to abuse risk, request size limits; do not send real mail during tests. Validate each array/checkbox value using its enum; preserve existing PHP architecture.
- Accounts: proven authentication, password_hash/password_verify or framework equivalent, suitable password reset/token expiry/revocation, secure session rotation, cookie flags and expiry, brute-force controls, MFA when risk warrants; authorization server-side on every protected object/action, deny by default, tenant isolation and least privilege. Never trust client-supplied roles.
- Files: size and type allowlists, independently validate content, generated names, private storage, safe download authorization, no executable uploads; malware scanning where justified. Prevent traversal and resource exhaustion.
- APIs/payments: scoped secrets, TLS, authentication/authorization, schema validation, timeouts, replay protection, signed webhook verification, idempotency and server-side amount/state checks where relevant; use sandbox provider adapters.
- Data: minimize collection, retention and privileges; protect sensitive data in transit and at rest where appropriate; deletion/export controls where applicable, redact logs and errors; avoid real personal data in fixtures. Secrets outside public roots and source control; never reveal values in output; for suspected exposure recommend revoke/rotate and assess history. Do not claim GDPR compliance from a code checklist.
- Deployment: public web root contains only intended pages/endpoints/assets; protect .env, .git, .agents, Graphify outputs, backups, tests, private data/config/logs; underscore naming and robots.txt are not access controls. Verify hosting restrictions when available. Production debug off; appropriate HTTPS, cookie/config and security headers (e.g. CSP with compatibility verification, HSTS only where HTTPS readiness established, framing/MIME/referrer controls), safe CORS; review caching of private data and error pages.
- Dependencies/supply chain: inventory direct/transitive dependencies, lockfiles, provenance, supported versions and known advisories with timestamp/source if available; do not claim clean if offline; approve installs/updates separately. Restrict CI/deployment credentials and permissions, verify artifacts and environment segregation where relevant.
- Operations: protected backups and restoration, security logging without sensitive data, monitoring, patching, incident response and recovery as risk warrants. Report deployment/hosting controls that cannot be verified; no automatic monitoring or deployment.
Use OWASP ASVS 5.0, OWASP WSTG and NIST SSDF as reference frameworks when applicable; consult authoritative current docs if needed, no unverified control-ID claims or certification. https://owasp.org/www-project-application-security-verification-standard/ ; https://owasp.org/www-project-web-security-testing-guide/ ; https://csrc.nist.gov/projects/ssdf .

## Safe test execution and permissions
Determine environment, target ownership, isolation and side effects before executing. Read-only planning/reporting may inspect actual files using native or terminal reads. Unit/static/lint checks allowed when non-mutating; runtime tests may write ONLY isolated disposable copies, temp directories or explicitly authorized test fixtures (never project source for run/report). For create/suite, persistent changes limited to test files, fixtures and test-only config, using existing conventions, descriptive _ prefixes for non-page PHP unless runner contract requires an exception documented in report. No production credentials, real emails, payments, customer accounts, live database writes, destructive requests, aggressive scanning or load against live services. Synthetic data, test doubles, sandbox APIs and disposable databases; verify configuration before execution, clean up only artifacts created by the test, never delete user data. If isolation cannot be established, block that test and continue safe ones. No installing packages, external plugins, execution-policy changes, permission bypass, or launching desktop control automatically. Existing terminal tools and approved runtimes are fine; do not require Graphify or a PowerShell script. Missing tool is BLOCKED, not FAIL/PASS. Run actual existing test commands discovered from manifests/config; inspect scripts for side effects first. For mutation/fault/load/fuzz tests, use isolated copies or bounded local targets with resource/time safety constraints, never alter original source or weaken assertions. No unbounded runs. Do not expose secrets in command output/report or transmit project data to external services without permission.

## Test categories (select by features, not a fixed quota)
| Category | When applicable / evidence to seek |
|---|---|
| Unit | Pure functions, validation, enums, calculations and helpers; meaningful assertions |
| Feature | Complete form/route/business behavior including error states |
| Integration | Components, handlers, database, mail adapters, APIs and shared dependencies |
| End-to-end | Critical visitor/account/payment journeys; actual runtime/browser if available |
| Regression | Prior bugs, changed files and downstream dependencies; reproduce failure then pass |
| Smoke | Essential pages, boot, routes and critical operations |
| Security | Abuse cases and trust boundaries; see below |
| Negative | Invalid inputs, unauthorized operations, malformed requests |
| Boundary | Empty, min/max, limits and edge cases |
| Performance | Relevant latency/resource metrics, conditions and baseline |
| Accessibility | Semantic labels, keyboard/focus, contrast where measurable, assistive semantics |
| Responsive | Relevant viewport layouts and functional interactions; rendered evidence required for visual claims |
| API | Methods, status, schema, auth, error and timeout behavior |
| Database | Constraints, transactions, queries, migrations and isolation on disposable DB |
| Compatibility | Supported runtime/browser versions; actual tested matrix |
| Syntax | Available language parsers/lint, no execution of source just to check syntax |
| Configuration | Routes, redirect, env, server/access/error settings |
| Data integrity | Correct transformations, consistency, duplicate handling and invariants |
| Load | Authorized isolated target, bounded rates and resource metrics |
| Recovery | Restore and recovery on disposable data, failure paths and recovery objectives |
| Mutation | Isolated temporary logic mutations; measure killed/surviving, clean copy |
| Property-based | Generated inputs with explicit invariants and reproducible seed |
| Fuzz | Bounded malformed/random inputs in safe environment; reproduce minimized failure |
| Contract | Consumer/provider schemas and compatibility |
| Concurrency | Simultaneous operations, races, transactions, idempotency |
| Fault injection | Simulated timeouts/failures in isolated adapters |
| Privacy | Data access, logging, retention and disclosure risks |
| Dependency vulnerability | Actual advisory evidence, versions and reachability where known |
| Deployment | Config, environment parity, access rules and safe staging smoke |
| Backup/restore | Verify recoverability without touching live data |
| Test quality | Review assertions, independence, mocks, requirements and fault detection |
| Flaky tests | Repeated bounded runs when warranted; record seeds/env and intermittent results |
Security subcategories: SAST (actual source/dataflow), DAST (authorized isolated running target), SCA (dependency/advisory evidence), secret detection (redacted), authorization, business logic abuse, privacy, configuration, client-side and supply-chain checks. Do not claim automated scanner execution from AI review. No separate visual-design audit is restored.

## Quality and coverage
Map requirement/feature/risk to test IDs, category, expected behavior, existing/missing status and execution evidence. Include unimplemented requirements if known; label unknown requirements. Exercise happy, negative, boundary, security and failure paths as applicable. Verify tests are meaningful, deterministic, independent, use realistic inputs, assert outcomes not merely invocation, don't duplicate production logic as oracle, avoid excessive mocking, and do not blindly update snapshots to pass. When practical prove regression test fails before fix in safe isolated copy; don't revert user changes. Track flaky results, mutation survivors and missing scenarios. Code/branch coverage only from actual measured instrumentation with scope; never equate coverage with correctness. Changed-file impact uses Git and dependencies/source, no mandatory graph. For explicit full project enumerate and track scope and omissions.

## Evidence and reporting
Use PASS only for executed tests with verified expected outcome, FAIL only for executed tests whose expectation failed, BLOCKED for unavailable/unsafe prerequisite, NOT TESTED for applicable unexecuted checks, N/A for demonstrated inapplicable tests. Static findings separate from executed tests. Report revision/dirty state, environment, scope, test IDs, commands (redacted), exit codes, counts, duration when measured, coverage and limitations, severity/confidence, file:line evidence and recommendations. Do not fabricate outputs or downgrade findings to obtain a pass. Keep source quality score separate from test results/security/release status; provisional/unavailable if evidence insufficient. Critical and high release-blocking risks cannot be averaged away.

## Release gate
Assess project-specific mandatory requirements, source integrity, functionality, security, privacy, dependency status, SEO/routes/sitemap, production configuration, recovery/operations where relevant. Reuse current evidence only; safely verify missing checks where authorized, otherwise mark blocked. NOT READY if confirmed release blocker or necessary test failure; UNVERIFIED if required evidence missing with no confirmed blocker; READY WITH WARNINGS only if required criteria verified and remaining risks explicitly accepted/nonblocking; READY if required criteria verified and no blockers. Never deploy or claim guaranteed security; state remaining risks and responsible next actions. Do not accept a critical security failure as a warning.
