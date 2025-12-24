#!/usr/bin/env bash
set -euo pipefail

if ! command -v sphinx-build >/dev/null 2>&1; then
  echo "sphinx-build not found. Install with: pip install sphinx sphinx-rtd-theme"
  exit 2
fi

mode="${1:-html}"
source_dir="docs"
build_dir="docs/_build"

case "${mode}" in
  html)
    echo "Building Sphinx HTML documentation..."
    sphinx-build -b html -W --keep-going "${source_dir}" "${build_dir}/html"
    echo "✓ Documentation built successfully"
    echo "Open: ${build_dir}/html/index.html"
    ;;
  clean)
    echo "Cleaning build directory..."
    rm -rf "${build_dir}"
    echo "✓ Build directory cleaned"
    ;;
  serve)
    echo "Building and serving Sphinx documentation..."
    sphinx-build -b html -W --keep-going "${source_dir}" "${build_dir}/html"
    echo "Starting local server at http://127.0.0.1:8000"
    python3 -m http.server --directory "${build_dir}/html" 8000
    ;;
  *)
    echo "Usage: $0 {html|clean|serve}"
    echo "  html  - Build HTML documentation (default)"
    echo "  clean - Remove build directory"
    echo "  serve - Build and serve locally"
    exit 1
    ;;
esac
