# Process Docs

A reusable repository of Claude skills and templates for structured documentation projects. Skills live here alongside your projects — no global installation needed. Each project gets its own folder and its own git repo, while sharing the same skills and templates.

## Prerequisites

- [Claude Code](https://docs.anthropic.com/en/docs/claude-code) or [Claude Cowork](https://docs.anthropic.com/en/docs/cowork)
- Git

## Installation

```bash
git clone <your-repo-url> ~/process-docs
cd ~/process-docs
```

That's it. Skills live in `skills/` and are available when you open this repo or any project within it in Claude Code.

## Starting a New Project

```bash
./setup.sh my-project-name
```

This copies the project starter into `projects/my-project-name/` and initializes a git repo for it. The `projects/` directory is gitignored — each project tracks its own history independently.

Then edit the project config:

```bash
# Open CLAUDE.md and fill in the project description, glossary, and team info
code projects/my-project-name/CLAUDE.md
```

The project folder comes with:
- `CLAUDE.md` — project-level config (edit this per project)
- `templates/` — ready-to-use templates for observations, processes, analysis, and review logs
- Numbered working folders (`00-inbox/` through `50-review-logs/`) for organizing your documentation

## Updating Skills

When skills are improved, just pull:

```bash
cd ~/process-docs
git pull
```

All projects in `projects/` automatically see the updated skills since they live in the parent repo.

## Team Usage

Every team member clones the same repository. They get identical skills, templates, and examples.

```bash
git clone <your-repo-url> ~/process-docs
cd ~/process-docs
./setup.sh their-project-name
```

For collaborating on the same project, team members share that project's git repo separately.

## Repository Structure

```
process-docs/
├── README.md                      # This file
├── setup.sh                       # Creates new projects from the starter
├── .gitignore                     # Ignores projects/ directory
├── skills/                        # Skills (available to all projects)
│   ├── documentation-writer.md
│   ├── documentation-reviewer.md
│   ├── observation-capture.md
│   ├── process-mapping.md
│   └── solution-design.md
├── project-starter/               # Template copied for each new project
│   ├── CLAUDE.md
│   ├── templates/
│   ├── 00-inbox/
│   ├── 10-observations/
│   ├── 20-process-maps/
│   ├── 30-analysis/
│   ├── 40-solution-design/
│   └── 50-review-logs/
├── examples/                      # Filled-in examples for reference
│   ├── observation-example.md
│   └── process-example.md
└── projects/                      # Your projects (gitignored, each has own git)
    ├── rg-faith/
    └── ultra-tech-bm-materials/
```

## Skills Overview

| Skill | Purpose |
|---|---|
| `documentation-writer` | Universal writing standards — concrete language, short sentences, no filler |
| `documentation-reviewer` | Audit methodology — completeness, consistency, and depth checks |
| `observation-capture` | Capturing site visit observations with structured detail |
| `process-mapping` | Building process documentation from observations |
| `solution-design` | Translating process docs into digital solution requirements |
