#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SKILLS_SOURCE="$SCRIPT_DIR/skills"
STARTER_DIR="$SCRIPT_DIR/project-starter"
EXAMPLES_DIR="$SCRIPT_DIR/examples"

# Default values
DEFAULT_BASE_PATH="$SCRIPT_DIR/projects"
REMOTE_URL=""
BASE_PATH=""
PROJECT_NAME=""

# Parse arguments
show_usage() {
  echo "Process Docs Setup"
  echo "=================="
  echo ""
  echo "Usage: ./setup.sh <project-name> [OPTIONS]"
  echo ""
  echo "Creates a new, fully independent documentation project with:"
  echo "  - Skills copied into the project (no dependency on parent repo)"
  echo "  - Templates and examples"
  echo "  - Numbered working folders"
  echo "  - Git repository initialized"
  echo ""
  echo "Options:"
  echo "  --path <dir>       Create project at custom location (default: ./projects/)"
  echo "  --remote <url>     Create GitHub repo and push (e.g., jetbrodocs/my-project)"
  echo "  --help             Show this help message"
  echo ""
  echo "Examples:"
  echo "  ./setup.sh my-project"
  echo "  ./setup.sh my-project --path ~/Documents"
  echo "  ./setup.sh my-project --path ~/Documents --remote jetbrodocs/my-project"
  echo ""
  echo "Existing projects in ./projects/:"
  if [ -d "$DEFAULT_BASE_PATH" ]; then
    for dir in "$DEFAULT_BASE_PATH"/*/; do
      [ -d "$dir" ] && echo "  - $(basename "$dir")"
    done
  else
    echo "  (none)"
  fi
}

# Parse command line arguments
if [ $# -eq 0 ]; then
  show_usage
  exit 0
fi

# Check for --help flag first
if [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
  show_usage
  exit 0
fi

PROJECT_NAME="$1"
shift

while [ $# -gt 0 ]; do
  case "$1" in
    --path)
      BASE_PATH="$2"
      shift 2
      ;;
    --remote)
      REMOTE_URL="$2"
      shift 2
      ;;
    --help|-h)
      show_usage
      exit 0
      ;;
    *)
      echo "Error: Unknown option '$1'"
      echo ""
      show_usage
      exit 1
      ;;
  esac
done

# Use default path if not specified
if [ -z "$BASE_PATH" ]; then
  BASE_PATH="$DEFAULT_BASE_PATH"
fi

# Expand tilde in path
BASE_PATH="${BASE_PATH/#\~/$HOME}"

PROJECT_DIR="$BASE_PATH/$PROJECT_NAME"

# Validate inputs
if [ -z "$PROJECT_NAME" ]; then
  echo "Error: Project name is required"
  show_usage
  exit 1
fi

if [ -d "$PROJECT_DIR" ]; then
  echo "Error: Project '$PROJECT_NAME' already exists at $PROJECT_DIR"
  exit 1
fi

if [ ! -d "$STARTER_DIR" ]; then
  echo "Error: project-starter/ directory not found at $STARTER_DIR"
  exit 1
fi

if [ ! -d "$SKILLS_SOURCE" ]; then
  echo "Error: skills/ directory not found at $SKILLS_SOURCE"
  exit 1
fi

echo "Process Docs Setup"
echo "=================="
echo ""
echo "Creating independent project: $PROJECT_NAME"
echo "Location: $PROJECT_DIR"
echo ""

# Create base directory if needed
mkdir -p "$BASE_PATH"

# Copy starter template
echo "→ Copying project template..."
cp -r "$STARTER_DIR" "$PROJECT_DIR"

# Copy skills into the project
echo "→ Copying skills (making project independent)..."
cp -r "$SKILLS_SOURCE" "$PROJECT_DIR/skills"

# Copy examples into the project for reference
echo "→ Copying examples..."
if [ -d "$EXAMPLES_DIR" ]; then
  cp -r "$EXAMPLES_DIR" "$PROJECT_DIR/examples"
fi

# Initialize git
echo "→ Initializing git repository..."
git -C "$PROJECT_DIR" init --quiet
git -C "$PROJECT_DIR" add .
git -C "$PROJECT_DIR" commit -m "Initial commit: project setup from process-docs template" --quiet

echo ""
echo "✓ Project created successfully!"
echo ""
echo "Project details:"
echo "  Name: $PROJECT_NAME"
echo "  Location: $PROJECT_DIR"
echo "  Git: initialized with initial commit"
echo "  Skills: copied (5 skills)"
echo "  Status: fully independent (no dependency on process-docs)"
echo ""

# Handle GitHub remote if specified
if [ -n "$REMOTE_URL" ]; then
  echo "→ Creating GitHub repository..."

  # Check if gh CLI is available
  if ! command -v gh &> /dev/null; then
    echo "Warning: gh CLI not found. Skipping GitHub repo creation."
    echo "Install with: brew install gh"
    echo "Then run: gh repo create $REMOTE_URL --public --source=$PROJECT_DIR --push"
  else
    # Create repo and push
    if gh repo create "$REMOTE_URL" --public --description "Documentation project created from process-docs template"; then
      echo "→ Adding remote and pushing..."
      git -C "$PROJECT_DIR" remote add origin "https://github.com/$REMOTE_URL.git"
      git -C "$PROJECT_DIR" push -u origin main
      echo ""
      echo "✓ GitHub repository created and pushed!"
      echo "  URL: https://github.com/$REMOTE_URL"
    else
      echo "Warning: Failed to create GitHub repository"
    fi
  fi
  echo ""
fi

echo "Next steps:"
echo "  1. cd $PROJECT_DIR"
echo "  2. Edit CLAUDE.md with your project details"
echo "  3. Start documenting in 00-inbox/"
echo ""
echo "Available skills:"
echo "  - documentation-writer"
echo "  - documentation-reviewer"
echo "  - observation-capture"
echo "  - process-mapping"
echo "  - solution-design"
echo ""
echo "This project is fully independent and can be:"
echo "  - Moved anywhere on your filesystem"
echo "  - Shared without the process-docs repository"
echo "  - Customized (modify skills, templates as needed)"
echo ""
