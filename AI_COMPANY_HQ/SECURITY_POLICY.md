# Security Policy

## Scope
Applies to games, web applications, backend services, developer tooling, and data pipelines.

## Mandatory Controls
1. Least-privilege access and role-based permissions.
2. Secrets managed via secure vaults, never committed to source.
3. Dependency scanning and vulnerability remediation SLAs.
4. Encryption in transit and at rest for sensitive data.
5. Audit logs for privileged and production actions.
6. Incident response within defined severity windows.

## Secure Development Rules
- Threat-model all externally reachable systems.
- Validate and sanitize all inputs.
- Enforce authentication and authorization boundaries.
- Log security-relevant actions with tamper-resistant storage.
- Run static analysis and dependency checks in CI.
