---
applies_to: "tests/**/*.py"
---

# Pytest Tests
- Mirror existing test style and fixtures; do not invent fixtures or helpers.
- Use pytest conventions with clear arrange/act/assert structure.
- Prefer focused, deterministic tests; avoid timing and network flakiness.
- Use parametrization for variant coverage when it improves clarity.
- If a test is flaky, document the cause and fix determinism when possible.
