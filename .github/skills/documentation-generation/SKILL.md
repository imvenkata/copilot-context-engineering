---
name: documentation-generation
description: Generate and maintain project documentation using MkDocs or Sphinx. Use when setting up docs, updating API references, or publishing documentation sites.
---

# Quick start
1. Choose documentation framework (MkDocs or Sphinx).
2. Copy template configuration.
3. Generate initial documentation structure.
4. Build and verify locally.

# Workflow

## For MkDocs (recommended for most Python projects)
1. Install: `pip install mkdocs mkdocs-material mkdocstrings[python]`
2. Copy `assets/mkdocs.yml` to repository root.
3. Create `docs/` directory structure.
4. Run `scripts/build_mkdocs.sh` to build and serve.

## For Sphinx (recommended for large API-heavy projects)
1. Install: `pip install sphinx sphinx-rtd-theme sphinx-autodoc-typehints`
2. Run `sphinx-quickstart docs/`
3. Configure `docs/conf.py` with autodoc settings.
4. Run `scripts/build_sphinx.sh` to build.

# Documentation structure
```
docs/
├── index.md                 # Landing page
├── getting-started.md       # Installation and quick start
├── user-guide/             # User-facing guides
│   ├── overview.md
│   ├── configuration.md
│   └── examples.md
├── api/                    # API reference (auto-generated)
│   └── reference.md
├── development/            # Developer guides
│   ├── contributing.md
│   ├── architecture.md
│   └── testing.md
└── changelog.md            # Release notes
```

# Content guidelines
- **Keep it current**: Update docs in the same PR as code changes.
- **Examples over descriptions**: Show working code snippets.
- **Link to code**: Use file/line references where helpful.
- **Version-specific**: Tag docs with version numbers for breaking changes.
- **Search-friendly**: Use clear headers and keywords.

# Auto-generation with mkdocstrings
- Extract docstrings from Python modules automatically.
- Use Google or NumPy docstring format.
- Include type hints for better API docs.
- Add examples in docstrings.

Example:
```markdown
# API Reference

::: mypackage.module
    options:
      show_source: true
      members:
        - MyClass
        - my_function
```

# Building and deployment

## Local preview
```bash
# MkDocs
./scripts/build_mkdocs.sh

# Sphinx
./scripts/build_sphinx.sh
```

## GitLab Pages deployment
Add to `.gitlab-ci.yml`:
```yaml
pages:
  stage: deploy
  script:
    - pip install mkdocs mkdocs-material mkdocstrings[python]
    - mkdocs build --strict --site-dir public
  artifacts:
    paths:
      - public
  only:
    - main
```

# Versioning strategy
- Use `mike` for MkDocs version management.
- Maintain `latest` (default) and version-specific docs (e.g., `v1.2`, `v2.0`).
- Archive old versions but keep them accessible.

# Quality checks
- Run `mkdocs build --strict` to fail on warnings.
- Check for broken links with `linkchecker` or CI plugin.
- Validate code examples in docs are runnable.
- Review docs in MR alongside code changes.

# Scripts
- `scripts/build_mkdocs.sh` - Build and serve MkDocs locally.
- `scripts/build_sphinx.sh` - Build Sphinx documentation.

# Assets
- `assets/mkdocs.yml` - MkDocs configuration template.
- `assets/docs-index.md` - Template for documentation landing page.

# Output
- `site/` directory with static HTML (MkDocs).
- `docs/_build/html/` with static HTML (Sphinx).
- Local server URL for preview.
