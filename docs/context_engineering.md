# Context Engineering for GitHub Copilot: A Practical Guide

Context engineering ->  getting the right information + rules + workflow into Copilot—without copy-pasting the same guidance into every chat

## The Four Pillars

| Component | Purpose | When Loaded | Location |
|-----------|---------|-------------|----------|
| **Custom Instructions** | Global coding standards, always-on rules | Every request (automatic) | `.github/copilot-instructions.md` |
| **Instructions Files** | Path-specific guidelines (by file type/folder) | When matching files are involved | `.github/instructions/*.instructions.md` |
| **Prompts** | Reusable task templates (slash commands) | On-demand via `/promptname` | `.github/prompts/*.prompt.md` |
| **Agents** | Specialized personas with specific tools | When invoked via `@agentname` | `.github/agents/*.agent.md` |
| **Skills** | Self-contained capability folders with scripts | Auto-selected based on relevance | `.github/skills/*/SKILL.md` |

## How They Complement Each Other

Think of it as layers:
- **Instructions** = Your rulebook (passive, always applied)
- **Prompts** = Your task playbooks (active, invoked when needed)
- **Agents** = Your specialist teammates (active, role-based behavior)
- **Skills** = Your toolkits (auto-loaded when relevant)

## 1. Custom Instructions (`.github/copilot-instructions.md`)

**Purpose:** Define baseline standards Copilot follows on every interaction.

```markdown
# Project Standards

## Python
- Use Python 3.11+ with type hints on all functions
- Follow PEP 8; use `ruff` for linting
- Prefer `pathlib` over `os.path`
- Use `pytest` for testing with fixtures

## Terraform
- Use Terraform 1.5+ with required_providers block
- All resources must have `tags` including: Environment, Project, Owner
- Use snake_case for resource names
- Reference variables via `var.` not hardcoded values

## General
- Never commit secrets; use environment variables
- All functions require docstrings
```

## 2. Path-Specific Instructions (`.github/instructions/`)

**Purpose:** Apply rules only to specific file types or directories.

**File:** `.github/instructions/terraform.instructions.md`
```markdown
---
applyTo: "**/*.tf"
---
# Terraform Guidelines

- Always include `description` for variables and outputs
- Use `for_each` over `count` for resources with names
- Module sources must use version pinning
- Run `terraform fmt` before committing
```

**File:** `.github/instructions/api.instructions.md`
```markdown
---
applyTo: "src/api/**/*.py"
---
# API Development Rules

- Use FastAPI with Pydantic models for validation
- All endpoints require OpenAPI descriptions
- Return proper HTTP status codes (201 for creates, 204 for deletes)
- Include request/response examples in docstrings
```

## 3. Prompt Files (`.github/prompts/`)

**Purpose:** Create reusable slash commands for repetitive tasks.

**File:** `.github/prompts/create-terraform-module.prompt.md`
```markdown
---
mode: 'agent'
description: 'Scaffold a new Terraform module with best practices'
---
Create a new Terraform module with the following structure:

Module name: ${input:moduleName:Enter the module name (e.g., azure-storage)}
Cloud provider: ${input:provider:azure or aws}

Generate these files:
1. `main.tf` - Primary resource definitions
2. `variables.tf` - Input variables with descriptions and types
3. `outputs.tf` - Useful outputs for module consumers
4. `versions.tf` - Required providers with version constraints
5. `README.md` - Usage example and variable documentation

Follow our Terraform standards from copilot-instructions.md.
```

**File:** `.github/prompts/python-service.prompt.md`
```markdown
---
mode: 'agent'
description: 'Generate a Python service class with tests'
---
Create a Python service class:

Service name: ${input:serviceName:Enter service name}
Purpose: ${input:purpose:What does this service do?}

Requirements:
1. Class in `src/services/${serviceName}_service.py`
2. Corresponding test file in `tests/services/test_${serviceName}_service.py`
3. Use dependency injection for external clients
4. Include type hints and docstrings
5. At least 3 test cases using pytest fixtures
```

**Usage in VS Code:** Type `/create-terraform-module` or `/python-service` in Copilot Chat.

## 4. Custom Agents (`.github/agents/`)

**Purpose:** Create specialized personas for specific workflows.

**File:** `.github/agents/security-reviewer.agent.md`
```markdown
---
name: security-reviewer
description: Reviews code for security vulnerabilities
tools: ['codebase', 'terminal']
---
You are a security-focused code reviewer. When reviewing code:

1. Check for hardcoded secrets, API keys, or credentials
2. Identify SQL injection, XSS, and CSRF vulnerabilities
3. Verify input validation and sanitization
4. Check for insecure dependencies
5. Flag overly permissive IAM/RBAC policies in Terraform

Output format:
- **Critical**: Must fix before merge
- **Warning**: Should address
- **Info**: Best practice suggestion

Do NOT suggest changes unrelated to security.
```

**File:** `.github/agents/terraform-planner.agent.md`
```markdown
---
name: terraform-planner
description: Plans and reviews Terraform changes
tools: ['codebase', 'terminal']
---
You are a Terraform infrastructure expert. Your tasks:

1. Analyze proposed infrastructure changes
2. Identify potential cost implications
3. Check for state drift risks
4. Verify resource dependencies
5. Suggest terraform plan commands to validate

When reviewing:
- Flag any resources without lifecycle rules
- Check for missing prevent_destroy on critical resources
- Verify network security group rules aren't overly permissive
```

**Usage:** Type `@security-reviewer check this PR` or `@terraform-planner review these changes`.

## 5. Skills (`.github/skills/`)

**Purpose:** Provide specialized capabilities with bundled resources.

**Structure:**
```
.github/skills/
└── api-testing/
    ├── SKILL.md
    ├── templates/
    │   └── test_template.py
    └── examples/
        └── sample_tests.py
```

**File:** `.github/skills/api-testing/SKILL.md`
```markdown
---
name: api-testing
description: Generate comprehensive API tests using pytest and httpx
---
# API Testing Skill

When asked to create API tests:

1. Use `httpx` for async HTTP client
2. Follow the template in `templates/test_template.py`
3. Include tests for: success cases, validation errors, auth failures
4. Use pytest fixtures for test client setup
5. Mock external dependencies

See `examples/sample_tests.py` for reference patterns.
```

## Token Efficiency Best Practices

Context engineering directly impacts token usage. More context = more tokens = slower responses and higher costs.

**Do:**
- Keep `copilot-instructions.md` under 500 lines
- Use `applyTo` patterns to load instructions only when relevant
- Put detailed workflows in Skills (loaded only when matched)
- Be specific and concise — avoid verbose explanations

**Don't:**
- Dump entire style guides into instructions
- Repeat the same rules in multiple files
- Include examples for every possible scenario
- Add instructions for tools/frameworks you rarely use

**Token-efficient pattern:**
```markdown
# Good: Concise, actionable
- Use `pytest` with `pytest-asyncio` for async tests
- Fixtures in `conftest.py`, parametrize repetitive tests

# Bad: Verbose, tutorial-style
When writing tests, you should use pytest which is our preferred testing 
framework. For asynchronous code, make sure to install pytest-asyncio...
```

## Directory Structure Summary

```
your-repo/
└── .github/
    ├── copilot-instructions.md          # Global rules (always loaded)
    ├── instructions/
    │   ├── python.instructions.md       # Python-specific (*.py files)
    │   ├── terraform.instructions.md    # Terraform-specific (*.tf files)
    │   └── api.instructions.md          # API code (src/api/**)
    ├── prompts/
    │   ├── create-terraform-module.prompt.md
    │   ├── python-service.prompt.md
    │   └── generate-tests.prompt.md
    ├── agents/
    │   ├── security-reviewer.agent.md
    │   └── terraform-planner.agent.md
    └── skills/
        └── api-testing/
            └── SKILL.md
```

## Quick Reference

| Want to... | Use |
|------------|-----|
| Set team coding standards | `copilot-instructions.md` |
| Apply rules to specific files | `.instructions.md` with `applyTo` |
| Automate a repeatable task | `.prompt.md` (invoke with `/`) |
| Get specialized reviews | `.agent.md` (invoke with `@`) |
| Teach complex capabilities | Skills folder with `SKILL.md` |
