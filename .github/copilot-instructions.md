# Copilot Instructions (Repo-wide)

These instructions guide Copilot Chat and Agents. They do not affect inline code suggestions.

## Baseline
- Follow existing repo patterns; do not invent APIs, configs, or test fixtures.
- Python baseline: 3.12+, ruff for lint/format, pytest for tests, type hints for public APIs.
- Terraform baseline: format and validate changes; use safe defaults and clear variables.
- Keep diffs small and scoped; prefer targeted edits over sweeping rewrites.
- No secrets or tokens. If sensitive data is needed, ask for a secure path.
- Use the prompts, agents, and skills in `.github/` for repeatable workflows.

## Tooling
- Tool names are environment-dependent; match the VS Code tool picker.
- Use the lightest tool that gets the job done; avoid destructive commands.

## When unsure
- Ask a brief clarifying question or state assumptions before proceeding.
