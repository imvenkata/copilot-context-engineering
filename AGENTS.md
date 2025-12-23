# Agent Operations

This repo includes custom agents for repeatable workflows. Use them intentionally and keep handoffs clear.

## Agent Selection
- Planner: produce plans only; no code edits.
- Implementer: apply minimal diffs, add tests, and verify.
- Reviewer: strict review rubric across correctness, security, maintainability, tests, and infra.
- Triage: diagnose failures and propose minimal fixes.
- Infra: Terraform and CI focused changes with validation steps.

## Handoff Flows
- Plan -> Implement -> Review
- Triage -> Implement -> Review
- Infra -> Implement -> Review

## Subagents
Use subagents for deep investigation (log analysis, repo scanning, review drafts) and return only conclusions.

## Tools
Tool names are environment-dependent; match the VS Code tool picker.
