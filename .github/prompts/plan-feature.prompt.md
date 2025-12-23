---
name: Plan Feature
description: Produce a scoped plan for a new feature or bugfix.
agent: Planner
tools: environment-dependent; match the VS Code tool picker
arguments:
  - name: feature
    description: Short description of the feature or fix
  - name: context
    description: Relevant background, constraints, or links
  - name: acceptance_criteria
    description: What "done" means for this change
---

# Steps
1. Read relevant files and instructions for the target paths.
2. Use a subagent to scan for existing patterns and similar code.
3. Propose a minimal change plan with file touch points.
4. Identify risks, assumptions, and open questions.
5. Provide a test/validation plan.

# Output
- A numbered plan, files to edit, and tests to run.
