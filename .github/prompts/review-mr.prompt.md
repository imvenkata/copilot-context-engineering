---
name: Review MR
description: Perform a strict merge request review using the review rubric.
agent: Reviewer
tools: environment-dependent; match the VS Code tool picker
arguments:
  - name: changeset
    description: MR link or summary of changes
---

# Steps
1. Read diffs and related files.
2. Apply the review rubric: correctness, security, maintainability, tests, infra.
3. Call out missing tests, risky changes, and documentation gaps.

# Output
- Findings ordered by severity with file references
- Questions and assumptions
- Suggested fixes or follow-ups
