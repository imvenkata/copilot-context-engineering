---
name: cicd-triage
description: Diagnose CI pipeline failures in GitLab CI and propose minimal fixes. Use when jobs fail or pipelines are flaky.
---

# Workflow
1. Identify the failing job and step in the logs.
2. Classify the failure (lint, tests, infra, auth, dependency, env).
3. Reproduce locally if possible or isolate the smallest fix.
4. Propose a minimal change and a rerun plan.
