# Process Docs

A project template and toolkit for structured documentation projects. Use this to bootstrap new documentation projects that are fully independent from the start.

## Prerequisites

- [Claude Code](https://docs.anthropic.com/en/docs/claude-code) or [Claude Cowork](https://docs.anthropic.com/en/docs/cowork)
- Git
- (Optional) [GitHub CLI](https://cli.github.com/) for automatic repo creation

## Quick Start

Clone this repository:

```bash
git clone https://github.com/jetbrodocs/process-docs.git
cd process-docs
```

Create a new project:

```bash
# Create project in ./projects/ (default)
./setup.sh my-project-name

# Create project anywhere
./setup.sh my-project-name --path ~/Documents

# Create project with GitHub repo
./setup.sh my-project-name --path ~/Documents --remote jetbrodocs/my-project-name
```

## What You Get

Each new project is **fully independent** and includes:

- **5 Claude skills** for documentation workflows (copied into project)
- **4 templates** for observations, processes, analysis, and review logs
- **Numbered folders** for organizing documentation (00-inbox through 50-review-logs)
- **CLAUDE.md** config file for project-specific settings
- **Examples** for reference
- **Git repository** initialized with first commit

## Project Independence

Projects created with this template are **completely self-contained**:

- ✅ No dependency on the process-docs repository
- ✅ Can be moved anywhere on your filesystem
- ✅ Can be shared/cloned without the parent repo
- ✅ Skills, templates, and examples are copied (not referenced)
- ✅ Customize anything without affecting the template

## Skills Included

Each project gets these 5 skills:

| Skill | Purpose |
|---|---|
| `documentation-writer` | Universal writing standards — concrete language, short sentences, no filler |
| `documentation-reviewer` | Audit methodology — completeness, consistency, and depth checks |
| `observation-capture` | Capturing site visit observations with structured detail |
| `process-mapping` | Building process documentation from observations |
| `solution-design` | Translating process docs into digital solution requirements |

## Repository Structure

```
process-docs/
├── README.md                      # This file
├── setup.sh                       # Project creation script
├── .gitignore                     # Ignores projects/ directory
├── skills/                        # Skills (copied to each project)
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
├── examples/                      # Example documentation
│   ├── observation-example.md
│   └── process-example.md
└── projects/                      # Default location for new projects (gitignored)
```

## Team Usage

### Option 1: Shared Template Repository

Every team member clones the process-docs repository:

```bash
git clone https://github.com/jetbrodocs/process-docs.git
cd process-docs
./setup.sh their-project-name
```

### Option 2: Direct Project Sharing

Create a project once and share its repository directly:

```bash
# Team lead creates project
./setup.sh team-project --remote jetbrodocs/team-project

# Team members clone the project
git clone https://github.com/jetbrodocs/team-project.git
```

The project repository is self-contained — no need for team members to have process-docs.

## Customizing the Template

To customize the template for your organization:

1. Fork this repository
2. Modify skills, templates, or examples
3. Update `project-starter/CLAUDE.md` with your defaults
4. Team members clone your fork instead

## Folder Structure (in each project)

| Folder | Purpose |
|---|---|
| `00-inbox/` | Raw notes, uploads, unprocessed material |
| `10-observations/` | Structured observations from site visits |
| `20-process-maps/` | Process documentation built from observations |
| `30-analysis/` | Analysis documents, findings, comparisons |
| `40-solution-design/` | Requirements, data models, architecture, tech decisions |
| `50-review-logs/` | Review session logs with gaps and questions |

## Examples

See the `examples/` directory for:
- Sample observation documentation
- Sample process map
- Best practices for structuring your documentation

## Contributing

Improvements to the template, skills, or documentation are welcome! Open an issue or pull request.

## License

MIT License - feel free to use this template for any purpose.
