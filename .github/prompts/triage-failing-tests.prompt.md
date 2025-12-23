---
name: Triage Failing Tests
description: Diagnose failing pytest tests and propose a minimal fix.
agent: Triage
tools: environment-dependent; match the VS Code tool picker
arguments:
  - name: failure_output
    description: Test failure output or log excerpt
---

# Steps
1. Parse failures and identify the smallest repro.
2. Classify the failure (flake, regression, env, test bug).
3. Propose the minimal fix and rerun strategy.

# Verify
- pytest -k <test> or focused path

# Output
- Root cause hypothesis, fix proposal, and rerun plan
