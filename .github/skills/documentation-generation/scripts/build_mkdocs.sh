#!/usr/bin/env bash
set -euo pipefail

if ! command -v mkdocs >/dev/null 2>&1; then
  echo "mkdocs not found. Install with: pip install mkdocs mkdocs-material mkdocstrings[python]"
  exit 2
fi

mode="${1:-serve}"

case "${mode}" in
  serve)
    echo "Building and serving MkDocs documentation..."
    echo "Documentation will be available at http://127.0.0.1:8000"
    mkdocs serve
    ;;
  build)
    echo "Building MkDocs documentation..."
    mkdocs build --strict --site-dir site
    echo "✓ Documentation built successfully in site/"
    ;;
  deploy)
    echo "Deploying documentation to GitLab Pages..."
    mkdocs build --strict --site-dir public
    echo "✓ Documentation ready for deployment in public/"
    ;;
  *)
    echo "Usage: $0 {serve|build|deploy}"
    echo "  serve  - Build and serve locally (default)"
    echo "  build  - Build static site to site/"
    echo "  deploy - Build for GitLab Pages (outputs to public/)"
    exit 1
    ;;
esac
