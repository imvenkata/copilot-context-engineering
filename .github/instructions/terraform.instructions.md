---
applies_to:
  - "**/*.tf"
  - "**/*.tfvars"
---

# Terraform
- Follow existing module structure and naming conventions.
- Run `terraform fmt` and `terraform validate` when appropriate.
- Prefer explicit variable types, defaults, and descriptions.
- Use safe defaults; avoid destructive changes unless explicitly requested.
- Keep provider versions pinned in a versions file; avoid unbounded versions.
- Do not commit real secrets in `.tfvars` files.
