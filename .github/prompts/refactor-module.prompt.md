---
name: Refactor Module Safely
description: Refactor a module without behavior changes unless requested.
agent: Implementer
tools: environment-dependent; match the VS Code tool picker
arguments:
  - name: module_path
    description: Path to the module or package to refactor
  - name: goal
    description: The refactor goal (readability, structure, performance)
---

# Steps
1. Identify public APIs and invariants.
2. Add or update tests that lock in behavior.
3. Refactor in small steps, keeping diffs focused.
4. Verify behavior with targeted tests.

# Verify
- ruff check/format
- pytest (module scope)

# Output
- Summary of refactor steps and tests run
