---
name: Implement Feature
description: Implement a planned feature or bugfix with minimal diffs and tests.
agent: Implementer
tools: environment-dependent; match the VS Code tool picker
arguments:
  - name: plan
    description: Approved plan or target behavior
  - name: constraints
    description: Guardrails or limits for the change
---

# Steps
1. Confirm scope and assumptions; ask if anything is unclear.
2. Implement minimal, focused changes following repo patterns.
3. Add or update tests and keep them deterministic.
4. Run lint/format/tests where practical.

# Verify
- ruff check/format
- pytest (targeted or full)

# Output
- Summary of changes
- Tests run and results
- Follow-ups or open questions
