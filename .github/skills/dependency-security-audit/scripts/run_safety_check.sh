#!/usr/bin/env bash
set -euo pipefail

if ! command -v safety >/dev/null 2>&1; then
  echo "safety not found. Install with: pip install safety"
  exit 2
fi

echo "Running safety check..."
echo "Scanning dependencies for known security vulnerabilities..."

# Run safety check with JSON output
if safety check --json --output safety-report.json 2>/dev/null; then
  echo "✓ No vulnerabilities found"
  rm -f safety-report.json
else
  echo "⚠ Vulnerabilities detected. See safety-report.json for details."
  echo ""
  echo "Summary:"
  safety check --short || true
  exit 1
fi
