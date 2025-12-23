---
name: Create Terraform Module
description: Scaffold a Terraform module with safe defaults and examples.
agent: Infra
tools: environment-dependent; match the VS Code tool picker
arguments:
  - name: module_name
    description: Module name and purpose
  - name: constraints
    description: Providers, resources, or standards to follow
---

# Steps
1. Copy the template from `.github/skills/terraform-module-scaffold/assets/module-template/`.
2. Fill in variables, outputs, and README-free examples.
3. Keep changes minimal and follow repo patterns.

# Verify
- terraform fmt
- terraform validate

# Output
- Files created and validation results
