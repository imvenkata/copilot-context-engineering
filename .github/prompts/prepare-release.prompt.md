---
name: Prepare Release
description: Assemble release notes and validation steps for a release.
agent: Implementer
tools: environment-dependent; match the VS Code tool picker
arguments:
  - name: version
    description: Target release version
  - name: scope
    description: Included features or changes
---

# Steps
1. Collect merged changes for the release scope.
2. Draft release notes with highlights, fixes, and breaking changes.
3. Update changelog or release docs if present.

# Verify
- Run relevant tests and validations

# Output
- Release notes draft and validation checklist
