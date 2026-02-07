#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SKILLS_SOURCE="$SCRIPT_DIR/skills"
SKILLS_TARGET="$HOME/.claude/skills"

echo "Documentation Skills Setup"
echo "========================="
echo ""

# Check that skills source directory exists
if [ ! -d "$SKILLS_SOURCE" ]; then
  echo "Error: skills/ directory not found at $SKILLS_SOURCE"
  echo "Are you running this from the documentation-skills repository?"
  exit 1
fi

# Create target directory if it doesn't exist
if [ ! -d "$SKILLS_TARGET" ]; then
  echo "Creating $SKILLS_TARGET"
  mkdir -p "$SKILLS_TARGET"
fi

echo "Linking skills from $SKILLS_SOURCE to $SKILLS_TARGET"
echo ""

linked=0
skipped=0

for skill_file in "$SKILLS_SOURCE"/*.md; do
  filename="$(basename "$skill_file")"
  target="$SKILLS_TARGET/$filename"

  if [ -e "$target" ] || [ -L "$target" ]; then
    # File or symlink already exists
    if [ -L "$target" ] && [ "$(readlink "$target")" = "$skill_file" ]; then
      echo "  Already linked: $filename"
      skipped=$((skipped + 1))
      continue
    fi

    printf "  %s already exists. Overwrite? [y/N] " "$filename"
    read -r answer
    if [ "$answer" != "y" ] && [ "$answer" != "Y" ]; then
      echo "  Skipped: $filename"
      skipped=$((skipped + 1))
      continue
    fi
    rm "$target"
  fi

  ln -s "$skill_file" "$target"
  echo "  Linked: $filename"
  linked=$((linked + 1))
done

echo ""
echo "Done. $linked skill(s) linked, $skipped skipped."
echo ""
echo "Skills are now available at $SKILLS_TARGET"
echo "To start a new project, copy project-starter/ to your working location:"
echo ""
echo "  cp -r $SCRIPT_DIR/project-starter /path/to/my-project"
