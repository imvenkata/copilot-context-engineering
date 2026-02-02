
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
