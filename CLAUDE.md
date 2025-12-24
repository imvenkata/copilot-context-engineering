# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Purpose

This is a reusable Context Engineering Pack for Copilot/AI assistants in VS Code. It provides standardized instructions, workflows, agents, prompts, and skills designed for Python repositories with GitLab integration. The pack itself is a template to be copied into other repositories, not a traditional application codebase.

## Architecture Overview

The repository follows a structured organization pattern:

**`.github/` - Core context engineering files**

- `copilot-instructions.md` - Repo-wide baseline instructions for all AI interactions
- `instructions/*.instructions.md` - Path-specific instructions with `applies_to` frontmatter (e.g., `python-style.instructions.md` applies to `**/*.py`)
- `agents/*.agent.md` - Role-specific agent definitions (planner, implementer, reviewer, triage, infra)
- `prompts/*.prompt.md` - One-click workflow templates for common tasks
- `skills/*/SKILL.md` - Playbooks with scripts and templates for repeatable tasks

**`docs/` - Documentation**

- Guides for installation, customization, prompt writing, skill building, and agent workflows

**Key architectural principles:**

- Instructions are hierarchical: repo-wide → path-specific → agent-specific
- Agent handoff flows: Plan → Implement → Review, or Triage → Implement → Review
- Skills bundle templates, scripts, and references for complex multi-step workflows
- All prompts include verification steps and clear argument placeholders

## Working with this Repository

### Common Commands

This repository contains no build/test/lint commands as it is a documentation and template pack. The included scripts are examples for consuming repositories:

- `.github/skills/pytest-triage/scripts/run_pytest.sh` - Example pytest runner
- `.github/skills/code-quality/scripts/run_ruff.sh` - Example ruff linter
- `.github/skills/terraform-module-scaffold/scripts/terraform_validate.sh` - Example Terraform validator

### File Organization Pattern

When modifying or extending this pack:

**Instructions**: Add new `.instructions.md` files rather than editing existing ones. Each file should have:

```yaml
---
applies_to: "path/glob/pattern"
---
```

**Agents**: Define strict role boundaries. Agents should not overlap in responsibilities.

**Prompts**: Use clear argument placeholders (e.g., `{{feature_name}}`, `{{module_path}}`) and include:

1. Input gathering section
2. Step-by-step workflow
3. Verification/validation step

**Skills**: Structure as directories with:

- `SKILL.md` - Main playbook with frontmatter
- `scripts/` - Executable helpers
- `assets/` or `references/` - Templates and examples

## Key Conventions

### Baseline Expectations (from copilot-instructions.md)

- Follow existing repo patterns; do not invent APIs, configs, or test fixtures
- Python baseline: 3.12+, ruff for lint/format, pytest for tests, type hints for public APIs
- Terraform baseline: format and validate changes; use safe defaults
- Keep diffs small and scoped
- No secrets or tokens in code

### Agent Handoff Protocol

- **Planner** → produces plans only, no code edits, asks clarifying questions
- **Implementer** → applies minimal diffs, adds tests, verifies changes
- **Reviewer** → strict review rubric (correctness, security, maintainability, tests, infra)
- **Triage** → diagnoses failures and proposes minimal fixes
- **Infra** → Terraform and CI focused with validation steps

Use subagents for deep investigations (log analysis, repo scanning) and return only conclusions.

### GitLab Integration

This pack assumes GitLab-first workflows for merge requests, issues, epics, and CI. The `query-issues.prompt.md` expects GitLab MCP server configuration for issue lookups.

## Important Notes for AI Assistants

- This repository is a **template pack**, not executable code. References to "this repo" in instructions mean the consuming repository where the pack is installed.
- When editing instruction files, preserve the frontmatter `applies_to` patterns.
- Prompts are meant to be used via VS Code's prompt picker UI with argument substitution.
- Skills reference scripts that may not exist in this template - they are examples for the consuming repository to implement.
- The agent system expects strict role adherence - do not mix planner and implementer responsibilities.
