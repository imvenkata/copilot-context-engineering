# Writing Prompts

Prompts are one-click workflows. Keep them short, goal-driven, and explicit about outputs.

## Template
```yaml
---
name: My Prompt
description: Short description of the workflow.
agent: Implementer
tools: environment-dependent; match the VS Code tool picker
arguments:
  - name: input
    description: The main request
---
```

## Guidance
- Include a verify step (tests, lint, or validation).
- Keep diffs minimal and follow existing repo patterns.
- Call out assumptions and ask for clarification when needed.
