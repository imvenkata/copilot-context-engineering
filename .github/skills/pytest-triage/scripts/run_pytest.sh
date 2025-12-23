#!/usr/bin/env bash
set -euo pipefail

if ! command -v pytest >/dev/null 2>&1; then
  echo "pytest not found. Install it or activate your venv."
  exit 2
fi

if [ "$#" -eq 0 ]; then
  args=("tests")
else
  args=("$@")
fi

echo "Running: pytest ${args[*]}"
pytest "${args[@]}"
