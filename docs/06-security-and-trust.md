# Security and Trust Model

- Treat AI output as untrusted until reviewed.
- Never store secrets or tokens in the repo or in prompts.
- Prefer least-privilege permissions in CI and infrastructure.
- Validate changes with tests, linters, or terraform validation.
- MCP tools are environment-dependent; only use configured servers (e.g., GitLab MCP) when available.
