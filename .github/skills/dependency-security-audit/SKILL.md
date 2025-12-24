---
name: dependency-security-audit
description: Audit Python dependencies for known vulnerabilities and outdated packages. Use when checking for CVEs, updating dependencies, or ensuring security compliance.
---

# Quick start
1. Run security audit tools (pip-audit, safety).
2. Review CVE findings and severity levels.
3. Propose minimal dependency updates or patches.

# Workflow
1. Run `scripts/run_pip_audit.sh` to check for known vulnerabilities.
2. Run `scripts/run_safety_check.sh` for additional CVE database checks.
3. Review findings and classify by severity (critical, high, medium, low).
4. Check for available patches or updated versions.
5. Propose updates using pinned versions in requirements.txt or pyproject.toml.

# Priority guidelines
- **Critical/High**: Address immediately with updates or mitigation.
- **Medium**: Schedule for next release.
- **Low**: Document and defer if risk is acceptable.
- **No fix available**: Document workaround or consider alternative packages.

# Update policy
- Pin exact versions for production dependencies.
- Use compatible release specifiers (~=) only for dev dependencies.
- Always update lock files (requirements.txt, poetry.lock, etc.).
- Test after each dependency update before proceeding to the next.

# Scripts
- `scripts/run_pip_audit.sh` - Run pip-audit for vulnerability scanning.
- `scripts/run_safety_check.sh` - Run safety check against CVE database.
- `scripts/update_dependencies.sh` - Update outdated dependencies with testing.

# Output
- List of vulnerabilities with CVE IDs and severity.
- Recommended updates with version constraints.
- Test results after applying updates.

# References
- See `references/vulnerability-remediation.md` for common patterns.
