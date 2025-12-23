# context-engineering-pack

A reusable Context Engineering Pack for Copilot in VS Code. Drop this into Python repos to standardize
instructions, workflows, agents, prompts, and skills.

## What you get
- Repo-wide and path-specific instructions in `.github/`
- One-click prompts for common workflows
- Agents for planning, implementation, review, triage, and infra work
- Skill playbooks for tests, refactors, Terraform, CI triage, and MR review
- GitLab-first workflows for merge requests, issues, epics, and CI
- Short docs on customization and security

## Quick start (VS Code)
1. Copy `.github/`, `docs/`, and `AGENTS.md` into your repo.
2. Enable Copilot instruction files in VS Code settings.
3. Use the prompts in `.github/prompts/` for repeatable tasks.
4. Choose agents from `.github/agents/` when you want strict roles.

Note: Instruction files guide Copilot Chat and Agents. They do not affect inline completions.

## Using prompts
- Open the prompt picker in VS Code and select a prompt file from `.github/prompts/`.
- Fill in the arguments and follow the steps. Each prompt includes a verify step.

## Using agents
- Select an agent file from `.github/agents/` before starting the task.
- Use the handoff flow: plan -> implement -> review, or triage -> implement -> review.

## Skills
Skills live in `.github/skills/`. They are playbooks, scripts, and templates for repeatable tasks.

## GitLab MCP
For issue queries, this pack uses GitLab via MCP. If your environment has the `gitlab-mcp` server
configured, use it for GitLab issues, epics, and codebase lookups.

## Starter kit
- Copy `.github/`, `docs/`, and `AGENTS.md` into an existing repo.
- Adjust instructions by adding new `.github/instructions/*.instructions.md` files rather than editing
  existing ones whenever possible to avoid conflicts.
- Daily workflows:
  - Plan and implement a feature with `plan-feature.prompt.md` and `implement-feature.prompt.md`.
  - Write tests with `write-pytests.prompt.md` and triage failures with `triage-failing-tests.prompt.md`.
  - Scaffold Terraform modules with `create-terraform-module.prompt.md`.
  - Review changes with `review-mr.prompt.md`.
  - Query issues with `query-issues.prompt.md`.
