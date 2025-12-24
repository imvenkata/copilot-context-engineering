---
name: pre-commit-setup
description: Configure pre-commit hooks for Python repositories. Use when setting up automated code quality checks, linting, and formatting before commits.
---

# Quick start
1. Install pre-commit framework.
2. Copy template configuration.
3. Install hooks and verify.

# Workflow
1. Install pre-commit: `pip install pre-commit`
2. Copy `.pre-commit-config.yaml` from assets to repository root.
3. Customize hooks based on project needs.
4. Run `pre-commit install` to enable hooks.
5. Test with `pre-commit run --all-files`.

# Recommended hooks for Python projects
- **ruff**: Fast Python linter and formatter (replaces flake8, black, isort)
- **mypy**: Static type checking
- **pytest**: Run tests on staged files
- **check-yaml**: Validate YAML syntax
- **check-toml**: Validate TOML syntax
- **end-of-file-fixer**: Ensure files end with newline
- **trailing-whitespace**: Remove trailing whitespace
- **detect-secrets**: Prevent committing secrets

# Hook configuration guidelines
- Use specific versions (not `latest` or version ranges).
- Disable auto-fixes for mypy and pytest (fail-only).
- Configure ruff to match project style in `pyproject.toml`.
- Run fast checks first (syntax) before slow ones (tests).

# Local vs CI behavior
- **Local**: Run on changed files only for speed.
- **CI**: Run on all files to catch issues in unchanged code.
- Use `pre-commit run --all-files` in CI pipeline.

# Skipping hooks (when necessary)
```bash
# Skip all hooks (avoid unless emergency)
git commit --no-verify

# Skip specific hook
SKIP=mypy git commit -m "message"
```

# Troubleshooting
- **Hook fails on first run**: May need to install dependencies (e.g., `pip install mypy types-*`)
- **Conflicts with editor**: Ensure editor uses same ruff/mypy config
- **Slow commits**: Reduce scope of expensive hooks or use `--no-verify` for WIP commits

# Assets
- `assets/.pre-commit-config.yaml` - Template configuration for Python projects

# Output
- Configured `.pre-commit-config.yaml` in repository root
- Installed hooks in `.git/hooks/`
- Verification results from test run
