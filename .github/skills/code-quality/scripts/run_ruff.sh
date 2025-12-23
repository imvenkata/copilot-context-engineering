#!/usr/bin/env bash
set -euo pipefail

if ! command -v ruff >/dev/null 2>&1; then
  echo "ruff not found. Install it or activate your venv."
  exit 2
fi

target="${1:-.}"

echo "Running: ruff check ${target}"
ruff check "${target}"

echo "Running: ruff format ${target}"
ruff format "${target}"
