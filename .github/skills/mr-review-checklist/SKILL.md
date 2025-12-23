---
name: mr-review-checklist
description: Review code changes with a strict rubric across correctness, security, maintainability, tests, and infrastructure. Use when performing merge request reviews.
---

# Review rubric
- Correctness: behavior matches intent and edge cases are handled.
- Security: inputs validated, secrets safe, permissions minimal.
- Maintainability: clear structure, low complexity, minimal duplication.
- Tests: coverage added or updated, deterministic, focused.
- Infra/CI: safe changes, pinned versions, least privilege.

# Comment templates
- Use `references/comment-templates.md` for consistent review language.
