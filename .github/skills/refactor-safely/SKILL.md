---
name: refactor-safely
description: Safely refactor code without behavior changes unless explicitly requested. Use when restructuring modules, improving readability, or reducing duplication.
---

# Workflow
1. Identify public APIs and invariants.
2. Add or update tests that lock in behavior.
3. Refactor in small, reviewable steps.
4. Validate with targeted tests and linters.

# Guardrails
- Preserve external interfaces and file layout unless approved.
- Avoid unrelated cleanup or formatting changes.
- Document any behavior changes explicitly.
