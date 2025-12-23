# Agent Workflows

Use agents to keep roles clear and reduce back-and-forth.

## Recommended flows
- Plan -> Implement -> Review for features and refactors
- Triage -> Implement -> Review for failures
- Infra -> Implement -> Review for Terraform and CI changes

## Subagents
Use subagents for deep investigation (log analysis, repo scans, review drafts). Return only conclusions,
not the full analysis.
