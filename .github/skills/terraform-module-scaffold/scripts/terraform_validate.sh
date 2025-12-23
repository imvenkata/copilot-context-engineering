#!/usr/bin/env bash
set -euo pipefail

if ! command -v terraform >/dev/null 2>&1; then
  echo "terraform not found. Install Terraform."
  exit 2
fi

dir="${1:-.}"

echo "Formatting: ${dir}"
terraform -chdir="${dir}" fmt -recursive

echo "Validating: ${dir}"
terraform -chdir="${dir}" validate
