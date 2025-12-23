---
name: Query Issues
description: Query GitLab issues and epics via MCP (gitlab-mcp) when available.
agent: Planner
tools: environment-dependent; match the VS Code tool picker
arguments:
  - name: query
    description: Search terms, labels, or filters
  - name: scope
    description: Project or group scope
---

# Steps
1. Confirm the project or group scope and whether to include epics.
2. If MCP is available, use the `gitlab-mcp` server for issues and epics.
3. Run a focused query and return a concise summary with links.
4. If code context is required, use `gitlab-mcp` to fetch files or search the repo.

# Output
- Issue or epic list with key fields (title, status, labels, link)
