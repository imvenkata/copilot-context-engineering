---
applies_to: "**/*"
---

# Refactoring
- Do not change behavior unless explicitly requested.
- Preserve public APIs and file layout unless there is a strong reason to change.
- Keep diffs minimal and reviewable; avoid unrelated cleanup.
- Add or update tests to protect behavior before refactors when possible.
- Validate with existing tests and linters.
