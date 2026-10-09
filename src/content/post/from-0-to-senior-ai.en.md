---
title: "From 0 to Senior AI — Installation and Backend"
url: "from-0-to-senior-ai"
titleHtml: "<small>Learn with a coding agent</small><br><b>From 0 to Senior AI</b>"
license: ccby4.0
author: The Science of Code
date: 2026-10-08
categories:
- Programming
tags:
- ai
- codex
- claude
- gemini
- antigravity
- vscode
- learning
- dotnet
- backend
keywords:
- codex
- claude code
- google gemini
- google antigravity
- vscode
- artificial intelligence
- learn programming
- prompt
- dotnet
- backend
autoThumbnail: true
autoThumbnailText: <i class="fas fa-robot"></i>
autoThumbnailStyle: background:linear-gradient(35deg,#172554,#7c3aed);color:#fff;
coverImage: /images/posts/senior-ai.webp
coverSize: min
coverStyle: background:linear-gradient(35deg,#172554,#7c3aed);color:#fff
cardUseImage: true
coverMetaClass: post-meta-white
thumbnailImagePosition: left
---

Install a coding agent in **VS Code** and use it as a mentor while you build a real project, even if you are starting from zero. This is the **Installation and Backend** chapter.
<!--more-->

![From 0 to Senior AI: installation, backend, frontend, automated testing, and harness](/images/posts/senior-ai.webp)

A coding agent such as **Codex**, **Claude Code**, or **Gemini through Google Antigravity** can read your project,
explain code, propose edits, and run commands. It is not infallible, and using
one does not automatically make you a senior developer. The goal is to speed up
your learning **without replacing your judgment**.

{{< toc center >}}

---

## Series roadmap

**From 0 to Senior AI** is organized into three chapters:

1. **Installation and Backend** — configure VS Code, the agent, Docker, Git, and GitHub; then build and understand a .NET API.
2. **Frontend and automated testing** — build the interface and automate checks of the complete system.
3. **Harness** — prepare the repeatable working and evaluation environment that coordinates the agent.

This article is Chapter 1. Its prompt deliberately avoids material from the next two chapters so the learning goal stays manageable.

## 1. Install VS Code

Download [Visual Studio Code from its official website](https://code.visualstudio.com/Download) and run the installer for your operating system:

- **Windows:** download the User Installer (`.exe`) and follow the wizard.
- **macOS:** open the `.dmg` and drag Visual Studio Code into **Applications**.
- **Linux:** download the `.deb` or `.rpm` package for your distribution and
  install it with its package manager.

See the official [VS Code getting-started guide](https://code.visualstudio.com/docs/getstarted/getting-started) if you encounter a problem.

## 2. Choose and install one agent

You only need **one**. Choose the agent that matches the account or subscription
you already use, and always verify the publisher before installing an extension.

### Option A: Codex

1. Open **Extensions** with `Ctrl + Shift + X` on Windows/Linux or
   `Cmd + Shift + X` on macOS.
2. Search for **Codex – OpenAI's coding agent**.
3. Verify that the publisher is **OpenAI**, then install the
   [official extension](https://marketplace.visualstudio.com/items?itemName=OpenAI.chatgpt).
4. Open Codex from the sidebar. If it is hidden, run `Codex: Open Codex Sidebar`
   from the Command Palette.
5. Sign in with your ChatGPT account when prompted.

The official [Codex IDE guide](https://developers.openai.com/codex/ide) has the
latest setup and availability information.

### Option B: Claude Code

1. Open **Extensions**.
2. Search for **Claude Code for VS Code**.
3. Verify that the publisher is **Anthropic**, then install the
   [official extension](https://marketplace.visualstudio.com/items?itemName=anthropic.claude-code).
4. Open Claude from the sidebar or type `Claude Code` in the Command Palette.
5. Select **Sign in** and complete authorization in your browser.

The extension contains what the editor panel needs. Installing the CLI is only
necessary if you also want to run `claude` in a terminal. See Anthropic's
[official VS Code guide](https://code.claude.com/docs/en/vs-code).

### Option C: Gemini with Google Antigravity

For an individual account, use Google's current extension:

1. Open **Extensions** and search for **Google Antigravity**.
2. Verify that the publisher is **Google**, then install the
   [official VS Code extension](https://marketplace.visualstudio.com/items?itemName=Google.google-antigravity).
3. Open Antigravity from the sidebar and sign in with your Google Account.
4. In the model selector, choose at least **Gemini 3.1 Pro** with `high` effort
   for this workshop.

Google moved its individual coding tools to Antigravity. Since June 18, 2026,
the former Gemini Code Assist extension no longer serves requests from
individual, Google AI Pro, or Google AI Ultra tiers. If your organization
already has Gemini Code Assist Standard or Enterprise, you can still install
[Gemini Code Assist](https://marketplace.visualstudio.com/items?itemName=Google.geminicodeassist)
and follow the same workshop.

The repository includes `GEMINI.md`. Both Antigravity and Gemini Code Assist
agent mode recognize it as persistent context and use it to load the same
learning contract as Codex and Claude.

## 3. Open the project and let the AI prepare it

1. Create an empty project folder.
2. In VS Code, choose **File → Open Folder**.
3. Grant **Workspace Trust** only if you know the folder's contents.
4. Open the Codex, Claude Code, or Google Antigravity panel.

Once the correct folder is open, ask the agent to prepare Git instead of copying
commands blindly:

```text
We are in the correct folder. Check whether Git and GitHub CLI are installed
and whether this is already a repository. Explain what you find.

If a tool is missing, guide me through its official installation and ask for
permission before changing the system.

Then create an appropriate .gitignore, initialize Git if needed, check for
secrets and generated files, and create the first commit with me. Perform the
mechanical steps, but explain what each one does.
```

### Create the GitHub repository

The agent should also check and, with your permission, guide the installation
of [GitHub CLI](https://github.com/cli/cli#installation). If you do not have an
account, it should send you to the [official signup page](https://github.com/signup)
and wait. You must handle your account, password, and verification yourself.

For login, the agent can run:

```bash
gh auth login --web --git-protocol https
```

You complete the browser flow. The agent must never ask you to paste a password,
token, private key, or recovery code into chat.

Before creating a remote repository, it should confirm the name, owner,
description, visibility, and whether you want to publish now. It can then use
`gh repo create … --source=. --remote=origin --push`. If you cloned this course
repository, it should create a personal fork instead, keep that fork as
`origin`, and preserve the educational repository as `upstream`.

## 4. Start with a small conversation

Do not begin with “build the whole application.” Start with:

```text
Inspect this folder without modifying files yet.

Explain:
1. What is in the project.
2. Which tools I need to run it.
3. The first small, verifiable step.

I am a beginner. Define new terms and wait for my confirmation before editing
files or running commands that change the system.
```

After each step, read the explanation, inspect the diff, and run the smallest
useful check. The productive sequence is:

```text
understand → attempt → review → run → correct → explain in your own words
```

## 5. Load the mentor prompt

This chapter uses a real Docker-first .NET project with ASP.NET Core,
PostgreSQL, Entity Framework Core, and Swagger. The completed reference
application is in [From 0 to Senior AI](https://github.com/TheScienceOfCodeEDU/from-0-to-senior-ai).

Use the documented English contract at
[`docs/PROMPT.en.md`](https://github.com/TheScienceOfCodeEDU/from-0-to-senior-ai/blob/main/docs/PROMPT.en.md).
The repository's `AGENTS.md`, `CLAUDE.md`, and `GEMINI.md` point Codex, Claude,
and Google Antigravity to the correct language, so the agent reloads its
teaching mission when a session starts or resumes.

To begin from an empty folder, paste this short bootstrap message:

```text
Help me work through Chapter 1: Installation and Backend from this repository:
https://github.com/TheScienceOfCodeEDU/from-0-to-senior-ai

Start with read-only checks. If I do not have the repository, guide me through
cloning it safely. Once it is open, read docs/PROMPT.en.md in full and follow it
as our learning contract. Do not install or modify anything until that contract
allows it and I have given any required permission.
```

Recommended minimum models for this workshop are **GPT-5.6 Sol with medium
effort** in Codex, **Claude Opus 5.5 with medium effort** in Claude Code, or
**Gemini 3.1 Pro with high effort** in Google Antigravity. A newer model is also
suitable.

The prompt tells the agent to:

- teach one small concept at a time instead of completing the project;
- use Docker for .NET, PostgreSQL, builds, and checks;
- safely guide Docker, Git, GitHub CLI, account login, commits, and a fork;
- connect controllers, services, EF Core, SQL, containers, and HTTP requests;
- avoid unnecessary enterprise patterns;
- preserve secrets and ask before privileged or destructive actions;
- reserve frontend and automated testing for Chapter 2, and the Harness for Chapter 3.

## 6. Run the reference application

You do not need to install .NET or PostgreSQL on the host. After Docker and
Compose are available, run from the repository folder:

```bash
docker compose up --build
```

Then open:

- Swagger: <http://localhost:5080/swagger>
- Products API: <http://localhost:5080/api/products>

Stop the containers without deleting the database with:

```bash
docker compose down
```

Do not add `--volumes` unless you intend to erase the laboratory database.

## 7. Turn AI output into learning

Useful follow-up prompts include:

```text
Explain this change before editing it. Which small part should I attempt?
```

```text
Review my solution. Point out the conceptual error before showing full code.
```

```text
Show the complete flow from the HTTP request to PostgreSQL and back.
```

```text
Ask me two questions that prove I could explain this code without your help.
```

You become better by making decisions, predicting behavior, testing the result,
and explaining what happened. The agent is valuable when it helps you practice
that loop—not when it removes you from it.
