#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SKILLS_SOURCE="$SCRIPT_DIR/skills"
PROJECTS_DIR="$SCRIPT_DIR/projects"
STARTER_DIR="$SCRIPT_DIR/project-starter"

echo "Process Docs Setup"
echo "=================="
echo ""

if [ $# -eq 0 ]; then
  echo "Usage: ./setup.sh <project-name>"
  echo ""
  echo "Creates a new project in projects/<project-name> with the starter template."
  echo "The projects/ directory is gitignored — each project has its own git repo."
  echo ""
  echo "Existing projects:"
  if [ -d "$PROJECTS_DIR" ]; then
    for dir in "$PROJECTS_DIR"/*/; do
      [ -d "$dir" ] && echo "  - $(basename "$dir")"
    done
  else
    echo "  (none)"
  fi
  exit 0
fi

PROJECT_NAME="$1"
PROJECT_DIR="$PROJECTS_DIR/$PROJECT_NAME"

# Check if project already exists
if [ -d "$PROJECT_DIR" ]; then
  echo "Project '$PROJECT_NAME' already exists at $PROJECT_DIR"
  exit 1
fi

# Check that starter directory exists
if [ ! -d "$STARTER_DIR" ]; then
  echo "Error: project-starter/ directory not found at $STARTER_DIR"
  exit 1
fi

# Create projects directory if needed
mkdir -p "$PROJECTS_DIR"

# Copy starter
cp -r "$STARTER_DIR" "$PROJECT_DIR"

# Initialize git in the new project
git -C "$PROJECT_DIR" init --quiet

echo "Created project: $PROJECT_NAME"
echo "  Location: $PROJECT_DIR"
echo "  Git: initialized"
echo ""
echo "Skills are available at: $SKILLS_SOURCE"
echo "Open the project folder in Claude Code to start working."
echo ""
echo "Next step: edit $PROJECT_DIR/CLAUDE.md with your project details."
