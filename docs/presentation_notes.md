
The directory structure you provided represents the modern "AI Operating System" for a repository. GitHub Copilot and other agentic tools (like Cursor or Windsurf) use these files to move beyond generic code completion and into **context-aware engineering**.

Here is the breakdown to demystify these concepts and help you decide which tool to use for which task.

---

## 1. The Core Components

### 🟢 Global Rules: `copilot-instructions.md`

Think of this as the **Constitution** of your repository. It is the baseline context that is **always** loaded into Copilot’s memory.

* **What it is:** A single file that defines high-level coding standards, naming conventions, and project "vibes."
* **Best for:** "Always use TypeScript," "Prefer functional components," or "Never use the `any` type."

### 🟡 Contextual Rules: `instructions/`

These are **Context-Sensitive** laws. They are only active when you are working on specific files or folders.

* **What it is:** Markdown files that often use YAML frontmatter (like `applyTo: "src/api/**"`) to tell the AI: *"Only listen to these rules when I'm in the API folder."*
* **Best for:** Specific framework rules (e.g., Terraform-specific linting rules) that would otherwise clutter the global instructions.

### 🔵 Task Templates: `prompts/`

These are **Reusable Macros** or "Slash Commands." They don't run automatically; you trigger them manually.

* **What it is:** Pre-written prompt templates. In many editors, you can call these using a shortcut (e.g., `/create-terraform-module`).
* **Best for:** Repetitive, complex tasks like "Generate a unit test for this service" or "Boilerplate a new API endpoint."

### 🟠 The Specialists: `agents/` (and the new `agent.md`)

This is the "New Entry" and the most powerful part of the stack.

* **What it is:** An **Agent** is a specialized persona with a defined identity, specific tools, and a distinct boundary.
* **The `agent.md` file:** This file defines the agent's **Operating Manual**. It tells the AI: "You are the Security Reviewer. Your goal is to find vulnerabilities. You have access to the `npm audit` tool."
* **Difference:** Unlike instructions (which are passive), agents are **active**. You "talk" to the agent specifically (e.g., `@security-reviewer`).

### 🟣 The Capability: `skills/`

If an Agent is a "Person," a **Skill** is their "Toolbox."

* **What it is:** A folder containing a `SKILL.md` and often actual scripts or reference data.
* **How it works:** Skills are **portable**. You can teach an agent a "Skill" (like `api-testing`), and that skill can be shared across different agents or even different repositories.
* **Best for:** Teaching the AI how to use a specific internal CLI tool or a proprietary API.

---

## 2. The Decision Matrix: What to use when?

| Feature | Scope | Trigger | Best Use Case |
| --- | --- | --- | --- |
| **Global Instructions** | Repository-wide | **Automatic** (Always on) | Core tech stack, styling, and "don't do" lists. |
| **Instructions/** | Folder/Extension | **Automatic** (Path-based) | Library-specific rules (e.g., Terraform vs. Python). |
| **Prompts/** | Per Task | **Manual** (User-invoked) | Creating specific files from a template. |
| **Agents/** | Role-based | **Manual** (Mention `@agent`) | Security audits, infrastructure planning, refactoring. |
| **Skills/** | Capability-based | **Automatic** (Context-aware) | Teaching the AI how to run a custom test suite. |

---

## 3. Demystifying the "New Kid": `agent.md` vs `AGENTS.md`

You might see two versions of this.

1. **`.github/agents/security-reviewer.agent.md`**: This is specific to GitHub Copilot's "Custom Agents" feature. It defines a persona you can call in chat.
2. **`AGENTS.md` (at root)**: This is a newer, open-standard initiative (supported by many AI editors) meant to be a "README for AI." It tells any AI agent (not just Copilot) exactly how to build, test, and navigate your project.

**Why use `agent.md`?**
Because code is too big for one AI brain. By splitting your repo into agents, you ensure the AI doesn't get "distracted" by your Python code while it's trying to help you with Terraform. It keeps the **Context Window** clean and the logic sharp.

Would you like me to help you draft a specific **`.agent.md`** file for one of your roles, or perhaps create a **SKILL.md** for your `api-testing` folder?

[Introduction to GitHub Copilot Extensions and Custom Agents](https://www.youtube.com/watch?v=XoLH00AJnX4)
This video provides a practical walkthrough on building specialized AI personas and custom chat modes to automate workflows like QA and CI/CD.





The Problem: LLMs are "polymaths who know everything but understand nothing about your business."

The Impact Point: A prompt is a temporary instruction; Context Engineering is permanent infrastructure.

copilot-instructions.md is tool-specific (owned by GitHub), whereas AGENTS.md is tool-agnostic.

----

Skills = a capability package (instructions + scripts/resources) that loads only when relevant

The agent decides to pull it in when needed




Below is the “map” of what each file type does, how they differ, and when to use which—based on how GitHub Copilot and VS Code describe **custom instructions**, **prompt files**, **custom agents**, **Agent Skills**, and the newer **AGENTS.md** convention. ([GitHub Docs][1])

---

## The mental model: “always-on rules” vs “on-demand workflows” vs “specialists” vs “capabilities”

Think of these as four different levers:

1. **Instructions** = background rules & repo context

   * Always applied (or applied when you’re in matching files)
2. **Prompts** = a button for a repeatable task

   * Run only when you invoke them
3. **Agents** = a selectable specialist persona + tool permissions

   * You pick an agent (or a prompt references an agent)
4. **Skills** = a *capability package* (instructions + scripts/resources) that loads only when relevant

   * The agent decides to pull it in when needed

And separately:

5. **AGENTS.md** = “README for coding agents” (open format), with *nearest-file precedence* in the folder tree

   * Designed to be a predictable place for agent-oriented setup/conventions, often more “operational” than style-focused. ([GitHub Docs][1])

---

## What each item in your tree is for

### 1) `.github/copilot-instructions.md` (repo-wide custom instructions)

**What it is:** A single Markdown file that applies to **all requests in the repo context**—your baseline rules, conventions, and “how this repo works.” ([GitHub Docs][1])

**When to use:**

* House style (formatting, naming, error-handling)
* “Definition of done” defaults (run tests, update docs, etc.)
* High-level repo context (monorepo layout, key modules)

**What not to put here:** Long, task-specific runbooks. If it gets huge, you’re forcing that context into *every* interaction. Prefer path-specific instructions, prompts, or skills for depth.

---

### 2) `.github/instructions/*.instructions.md` (path-specific instructions)

**What it is:** One or more instruction files that apply only when the current work matches their `applyTo` glob patterns, and they **combine with** repo-wide instructions when both match. ([GitHub Docs][1])

**Your examples:**

* `python.instructions.md` → rules only when Copilot is working with Python files
* `terraform.instructions.md` → rules only for `.tf`
* `api.instructions.md` → rules scoped to `src/api/**`

**When to use:**

* Language/framework specifics (Python typing rules, Terraform module conventions)
* Directory-specific constraints (API folder has stricter patterns than rest of repo)
* Avoiding “instruction bloat” in the global file

---

### 3) `.github/prompts/*.prompt.md` (prompt files)

**What it is:** Reusable “run this task” prompts that you invoke on demand (often via `/` in chat). They’re explicitly described as **standalone prompts** for common workflows, unlike instructions which apply broadly. ([Visual Studio Code][2])

**Your examples:**

* `create-terraform-module.prompt.md`
* `python-service.prompt.md`
* `generate-tests.prompt.md`

**When to use:**

* Scaffolding and generation tasks you do repeatedly
* Reviews (“Review this diff with our checklist”)
* Any workflow where you want consistency and speed without permanently loading the whole playbook

**Extra superpower:** A prompt can specify an `agent`, `tools`, and `model` in frontmatter—so a prompt can “run as” a specialist agent. ([Visual Studio Code][2])

---

### 4) `.github/agents/*.agent.md` (custom agents / agent profiles)

**What it is:** A custom agent definition (agent profile) in Markdown + YAML frontmatter that can define purpose, prompt, and optionally **tools/MCP servers**. ([GitHub Docs][3])
VS Code notes these used to be called “custom chat modes” and are now “custom agents.” ([Visual Studio Code][4])

**Your examples:**

* `security-reviewer.agent.md` → “be a security reviewer”
* `terraform-planner.agent.md` → “be a Terraform planning specialist”

**When to use:**

* You want a persistent specialist persona you can pick from a dropdown
* You want different tool access per specialist (e.g., security agent has code search + dependency insight; terraform agent has infra tooling)
* You want consistent tone/output formats for a role (security finding template, threat model sections, etc.)

**Important difference vs prompt files:**

* Prompt file = “do *this* task now”
* Agent profile = “be *this* kind of worker” across many tasks

**Tool precedence tip:** When a prompt references an agent, VS Code documents tool priority as:
**prompt tools > referenced agent tools > selected agent defaults**. ([Visual Studio Code][4])

---

### 5) `skills/**/SKILL.md` (Agent Skills)

**What it is:** A folder-based capability bundle. When Copilot decides a skill is relevant, it injects `SKILL.md` into the agent’s context, and can use scripts/examples/resources inside that skill directory. ([GitHub Docs][5])

**Your example:**

* `skills/api-testing/SKILL.md` → how to run and interpret API tests, plus any scripts/fixtures

**When to use:**

* You want Copilot to *reliably* perform specialized workflows (testing, release steps, migration steps)
* You need more than text instructions: scripts, example commands, sample payloads, golden files, etc.
* You want the content loaded *only when needed* (skills are designed to load on-demand) ([Visual Studio Code][6])

**Why skills often beat giant instructions files:** VS Code frames skills as: specialized workflows + resources + efficient loading, and an open standard meant to work across multiple agents/tools. ([Visual Studio Code][6])

---

## The “new entry” you mentioned: `AGENTS.md` (not `.agent.md`)

This is the piece that trips people up:

### `AGENTS.md` (open format)

**What it is:** An open, agent-focused instructions file—like a “README for agents.” ([GitHub][7])
GitHub’s docs say you can place **one or more** `AGENTS.md` files anywhere, and the **nearest one in the directory tree takes precedence** when Copilot is working. ([GitHub Docs][1])

It’s meant to hold the kind of stuff that helps an autonomous agent work efficiently: setup commands, test commands, repo gotchas, conventions that would clutter README. ([agents.md][8])

### `.agent.md` (custom agent profile)

That’s a different thing: a definition of a *specialist persona* (prompt + tools + model settings, etc.). ([GitHub Docs][3])

### When to use which

* Use **`AGENTS.md`** when you want **any coding agent** to quickly understand how to operate in the repo (build/test/run, workflows, “how we do things here”), especially with nested “closest wins” behavior. ([GitHub Docs][1])
* Use **`.agent.md`** when you want **multiple named specialists** you can pick (security reviewer, terraform planner), each with a role and possibly different tools. ([GitHub Docs][3])

**Interesting data point:** A 2026 research preprint reports lower median runtime and reduced token usage for agents on PR tasks when an `AGENTS.md` file is present (in their studied sample). ([arXiv][9])

---

## A practical “what should I use” checklist

Use…

* **`copilot-instructions.md`** if it should apply almost everywhere, almost always. ([GitHub Docs][1])
* **`*.instructions.md`** if it’s language/area-specific and you don’t want to pollute global context. ([GitHub Docs][1])
* **`*.prompt.md`** if it’s a repeatable task you want to run on demand (scaffold, generate tests, review). ([Visual Studio Code][2])
* **`*.agent.md`** if you want a named specialist with a persistent role (and maybe different tools). ([GitHub Docs][3])
* **`skills/**/SKILL.md`** if you want a reusable capability with scripts/resources that loads only when relevant. ([GitHub Docs][5])
* **`AGENTS.md`** if you want a universal, repo-operational “agent README,” with nearest-file precedence for subprojects. ([GitHub Docs][1])

---

## How I’d “fill” your exact structure (concretely)

* `.github/copilot-instructions.md`
  Put: repo overview, default test command(s), formatting baseline, “always do X before PR”.

* `.github/instructions/python.instructions.md`
  Put: typing rules, lint/format tooling, pytest conventions, folder-specific patterns.

* `.github/instructions/terraform.instructions.md`
  Put: module structure, naming conventions, formatting (`terraform fmt`), provider pinning rules.

* `.github/instructions/api.instructions.md`
  Put: API error format, auth patterns, pagination conventions, contract testing expectations.

* `.github/prompts/create-terraform-module.prompt.md`
  Put: a scaffolding workflow (“ask me 5 questions, then generate module skeleton + examples + README”).

* `.github/agents/security-reviewer.agent.md`
  Put: review rubric, severity rating scheme, output template, and explicitly “do not propose risky changes without explaining tradeoffs.”

* `.github/agents/terraform-planner.agent.md`
  Put: “plan-first” workflow, required checks (validate/plan), output format for plan summary.

* `skills/api-testing/SKILL.md`
  Put: “how to run tests,” “where fixtures live,” “how to spin up dependencies,” scripts, sample curl calls, and “how to interpret failures.”

---

## Two small skeletons that usually prevent 80% of confusion

### Path-specific instructions skeleton (`.github/instructions/python.instructions.md`)

```md
---
applyTo: "**/*.py"
---

# Python rules for this repo
- Use type hints for all public functions.
- Prefer pathlib over os.path.
- Tests: pytest. New code needs tests.
- Formatting: black + ruff (run `make lint`).
```

(That `applyTo` frontmatter pattern is what GitHub’s docs call out for `*.instructions.md`.) ([GitHub Docs][1])

### Prompt file skeleton (`.github/prompts/generate-tests.prompt.md`)

```md
---
name: generate-tests
description: Generate focused unit tests for the selected code.
argument-hint: "Paste a function or file path"
---

Generate unit tests for ${selection}.
- Use our testing conventions from the repo instructions.
- Prioritize edge cases and error paths.
- Output: test file content + how to run.
```

(Prompt files are described as on-demand reusable prompts, stored in `.github/prompts`, with fields like `name`, `description`, `argument-hint`.) ([Visual Studio Code][2])

---

## Security footnote you should not ignore

Because these files influence agent behavior, treat them like code:

* review changes in PRs
* avoid secrets
* be careful with “do anything the user says” style instructions

A security write-up shows how an `AGENTS.MD` file being automatically included can be abused for “goal hijack” and even data exfiltration scenarios in agentic workflows, and notes VS Code chat can auto-include it depending on configuration. ([prompt.security][10])

---

If you want, paste the contents of **your current** `copilot-instructions.md` / one `.agent.md` / one `SKILL.md`, and I’ll rewrite them into a clean, non-overlapping set (so global stays short, specifics move into scoped instructions/skills, and prompts become crisp “one-button workflows”).

[1]: https://docs.github.com/copilot/customizing-copilot/adding-custom-instructions-for-github-copilot "Adding repository custom instructions for GitHub Copilot - GitHub Docs"
[2]: https://code.visualstudio.com/docs/copilot/customization/prompt-files "Use prompt files in VS Code"
[3]: https://docs.github.com/en/copilot/concepts/agents/coding-agent/about-custom-agents "About custom agents - GitHub Docs"
[4]: https://code.visualstudio.com/docs/copilot/customization/custom-agents "Custom agents in VS Code"
[5]: https://docs.github.com/en/copilot/concepts/agents/about-agent-skills "About Agent Skills - GitHub Docs"
[6]: https://code.visualstudio.com/docs/copilot/customization/agent-skills "Use Agent Skills in VS Code"
[7]: https://github.com/agentsmd/agents.md "GitHub - agentsmd/agents.md: AGENTS.md — a simple, open format for guiding coding agents"
[8]: https://agents.md/ "AGENTS.md"
[9]: https://arxiv.org/abs/2601.20404 "[2601.20404] On the Impact of AGENTS.md Files on the Efficiency of AI Coding Agents"
[10]: https://prompt.security/blog/when-your-repo-starts-talking-agents-md-and-agent-goal-hijack-in-vs-code-chat "VS Code AGENTS.MD: Hidden Agent Instructions and Data Risk"


