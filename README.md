# Process Docs

A reusable repository of Claude skills and templates for structured documentation projects. Clone it once, link the skills to your Claude configuration, and use the project starter to kick off any documentation engagement — factory process capture, customer research, technical architecture, or anything else that needs rigorous, consistent documentation.

## Prerequisites

- [Claude Code](https://docs.anthropic.com/en/docs/claude-code) or [Claude Cowork](https://docs.anthropic.com/en/docs/cowork)
- Git

## Installation

```bash
# 1. Clone the repository
git clone <your-repo-url> ~/process-docs

# 2. Run the setup script to link skills to your Claude config
cd ~/process-docs
./setup.sh
```

That's it. The setup script symlinks each skill file into `~/.claude/skills/` so Claude Code can find them in any project.

## Starting a New Project

```bash
# Copy the project starter to your working location
cp -r ~/process-docs/project-starter ~/projects/my-new-project

# Edit the project-level config
cd ~/projects/my-new-project
# Open CLAUDE.md and fill in the project description, glossary, and team info
```

The project folder comes with:
- `CLAUDE.md` — project-level config (edit this per project)
- `templates/` — ready-to-use templates for observations, processes, analysis, and review logs
- Numbered working folders (`00-inbox/` through `50-review-logs/`) for organizing your documentation

## Updating Skills

When skills are improved in this repository, pull the latest and re-run setup:

```bash
cd ~/process-docs
git pull
./setup.sh
```

Existing symlinks will be detected and you'll be asked before overwriting.

## Team Usage

Every team member clones the same repository and runs `setup.sh`. This gives everyone identical skills and templates, ensuring consistent documentation quality across projects.

```bash
# Each team member runs:
git clone <your-repo-url> ~/process-docs
cd ~/process-docs && ./setup.sh
```

## Repository Structure

```
process-docs/
├── README.md                      # This file
├── setup.sh                       # Links skills to ~/.claude/skills/
├── skills/                        # Universal skills (linked to ~/.claude/skills/)
│   ├── documentation-writer.md
│   ├── documentation-reviewer.md
│   ├── observation-capture.md
│   ├── process-mapping.md
│   └── solution-design.md
├── project-starter/               # Copy this folder to start a new project
│   ├── CLAUDE.md
│   ├── templates/
│   ├── 00-inbox/
│   ├── 10-observations/
│   ├── 20-process-maps/
│   ├── 30-analysis/
│   ├── 40-solution-design/
│   └── 50-review-logs/
└── examples/                      # Filled-in examples for reference
    ├── observation-example.md
    └── process-example.md
```

## Skills Overview

| Skill | Purpose |
|---|---|
| `documentation-writer` | Universal writing standards — concrete language, short sentences, no filler |
| `documentation-reviewer` | Audit methodology — completeness, consistency, and depth checks |
| `observation-capture` | Capturing site visit observations with structured detail |
| `process-mapping` | Building process documentation from observations |
| `solution-design` | Translating process docs into digital solution requirements |
