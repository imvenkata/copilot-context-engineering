---
name: Triage CI Failure
description: Diagnose GitLab CI failures and propose minimal fixes.
agent: Triage
tools: environment-dependent; match the VS Code tool picker
arguments:
  - name: ci_log
    description: CI failure log or job URL
---

# Steps
1. Identify the failing GitLab CI job and step.
2. Classify the failure (lint, tests, infra, env, auth, dependency).
3. Propose a minimal fix and validate approach.

# Verify
- Re-run the failed job or reproduce locally when possible

# Output
- Root cause hypothesis, fix proposal, and validation plan
