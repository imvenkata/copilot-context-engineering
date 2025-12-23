---
applies_to:
  - ".gitlab-ci.yml"
  - ".gitlab-ci/**/*.yml"
---

# CI/CD (GitLab)
- Follow existing GitLab CI patterns for stages, jobs, and rules.
- Pin container images and included templates; avoid `latest` or floating refs.
- Keep changes minimal; prefer additive steps over large rewrites.
- Use least-privilege permissions and avoid leaking secrets in logs.
- Update related docs or comments when changing pipeline behavior.
