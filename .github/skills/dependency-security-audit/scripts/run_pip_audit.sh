#!/usr/bin/env bash
set -euo pipefail

if ! command -v pip-audit >/dev/null 2>&1; then
  echo "pip-audit not found. Install with: pip install pip-audit"
  exit 2
fi

target="${1:-.}"

echo "Running pip-audit on ${target}..."
echo "Checking for known vulnerabilities in installed packages..."

# Run pip-audit with JSON output for better parsing
if pip-audit --format json --output pip-audit-report.json 2>/dev/null; then
  echo "✓ No vulnerabilities found"
  rm -f pip-audit-report.json
else
  echo "⚠ Vulnerabilities detected. See pip-audit-report.json for details."
  echo ""
  echo "Summary:"
  pip-audit --format markdown || true
  exit 1
fi
