---
name: pytest-triage
description: Diagnose and fix failing pytest tests with minimal changes. Use when tests fail locally or in CI, to classify failures, isolate root cause, and propose the smallest safe fix.
---

# Quick start
1. Capture failing test names, stack traces, and environment details.
2. Reproduce the failure with a focused run.
3. Classify the failure and propose the minimal fix.

# Classification
- Test bug: assertion or fixture is wrong.
- Code regression: behavior changed unexpectedly.
- Environment issue: missing dependency, config, or OS-specific behavior.
- Flaky: nondeterministic timing, randomness, or external calls.

# Minimal fix policy
- Fix the smallest surface that restores intended behavior.
- Avoid disabling tests or broad refactors.
- If the correct behavior is unclear, ask for clarification.

# Rerun strategy
1. Run the single test or test file.
2. Run the closest related group (module or marker).
3. Run the full suite only if required.

# Scripts
- Use `scripts/run_pytest.sh` for focused runs.

# Output
- Root cause hypothesis
- Minimal fix proposal
- Tests run and results
