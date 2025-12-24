#!/usr/bin/env bash
set -euo pipefail

package="${1:-}"

if [[ -z "${package}" ]]; then
  echo "Usage: $0 <package_name> [version_constraint]"
  echo "Example: $0 requests '>=2.28.0,<3.0.0'"
  exit 1
fi

version_constraint="${2:-}"

echo "Updating ${package}${version_constraint:+ to ${version_constraint}}..."

# Detect package manager
if [[ -f "pyproject.toml" ]] && command -v poetry >/dev/null 2>&1; then
  echo "Using Poetry..."
  if [[ -n "${version_constraint}" ]]; then
    poetry add "${package}@${version_constraint}"
  else
    poetry update "${package}"
  fi
  poetry lock --no-update
elif [[ -f "requirements.txt" ]]; then
  echo "Using pip with requirements.txt..."
  if [[ -n "${version_constraint}" ]]; then
    # Update the package in requirements.txt
    if grep -q "^${package}" requirements.txt; then
      sed -i.bak "s|^${package}.*|${package}${version_constraint}|" requirements.txt
      rm requirements.txt.bak
    else
      echo "${package}${version_constraint}" >> requirements.txt
    fi
  fi
  pip install --upgrade "${package}"
  pip freeze > requirements-updated.txt
  echo "Updated requirements saved to requirements-updated.txt"
else
  echo "No supported dependency file found (pyproject.toml or requirements.txt)"
  exit 1
fi

echo ""
echo "Running tests to verify the update..."
if command -v pytest >/dev/null 2>&1; then
  pytest tests/ -x || {
    echo "⚠ Tests failed after update. Consider rolling back."
    exit 1
  }
  echo "✓ Tests passed"
else
  echo "⚠ pytest not found. Manually verify the update."
fi

echo ""
echo "✓ Dependency updated successfully"
echo "Next steps:"
echo "1. Review changes in requirements.txt or poetry.lock"
echo "2. Run full test suite"
echo "3. Commit the dependency update"
