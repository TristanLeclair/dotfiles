#!/bin/bash

# Base directories
SOURCE_BASE="$HOME/.local/share/db_ui"
REPO_BASE="$HOME/projects/sql"

# Path to the current script directory (assuming the script is run from its own directory)
SCRIPT_DIR="$(dirname "$BASH_SOURCE")"

# Loop through each directory in the source base
for dir in "$SOURCE_BASE"/*; do
  if [ -d "$dir" ]; then
    dirname=$(basename "$dir")
    repo_dir="$REPO_BASE/$dirname"
    queries_dir="$repo_dir/queries"

    mkdir -p "$queries_dir"

    # Initialize git if not already initialized
    if [ ! -d "$repo_dir/.git" ]; then
      git -C "$repo_dir" init
    fi

    # Copy and rename files (adding .sql extension)
    for file in "$dir"/*; do
      base_file=$(basename "$file")
      cp "$file" "$queries_dir/$base_file.sql"
    done

    # Add changes to the staging area
    git -C "$repo_dir" add .

    # Commit the changes
    if git -C "$repo_dir" diff --staged --quiet; then
      echo "No changes to commit in $dirname."
    else
      git -C "$repo_dir" commit -m "Update queries: $(date)"
      echo "Committed changes in $dirname."
    fi
  fi
done

