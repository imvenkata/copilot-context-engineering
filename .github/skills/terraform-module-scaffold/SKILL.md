---
name: terraform-module-scaffold
description: Scaffold Terraform modules with safe defaults, clear variables, and examples. Use when creating a new module or standardizing module structure.
---

# Workflow
1. Copy the template from `assets/module-template/` into the new module path.
2. Update variables, outputs, and locals to match the module purpose.
3. Add example usage under `examples/`.
4. Run formatting and validation.

# Scripts
- Use `scripts/terraform_validate.sh` for fmt and validate.
