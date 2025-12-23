---
applies_to: "**/*"
---

# Security
- Never add secrets or tokens; redact or ask for a secure path.
- Validate and sanitize external inputs.
- Prefer least privilege and explicit allowlists.
- Avoid network calls in tests unless explicitly required.
- Log safely and avoid sensitive data in error messages.
