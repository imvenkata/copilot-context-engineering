---
name: Write Pytests
description: Add or update pytest coverage for a feature or bugfix.
agent: Implementer
tools: environment-dependent; match the VS Code tool picker
arguments:
  - name: target
    description: Feature or code path to test
  - name: behavior
    description: Expected behavior and edge cases
---

# Steps
1. Review existing tests and fixtures for patterns.
2. Add focused, deterministic tests using pytest.
3. Prefer parametrization for variants.

# Verify
- pytest (targeted tests)

# Output
- Test summary and results
