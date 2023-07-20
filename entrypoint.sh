#!/bin/bash

# Bail on first non-zero exist status, and bail any referenced variable is unset.
set -eu

# Clear the GITHUB_TOKEN environment variable
unset GITHUB_TOKEN

# Check if both title and notes are not provided, then use --generate-notes flag
generate_notes_flag=""
if [[ -z "$INPUT_TITLE" && -z "$INPUT_NOTES" && -z "$INPUT_NOTESFILE" ]]; then
  generate_notes_flag="--generate-notes"
fi

# Check if draft, prerelease, latest, and discussion_category are set to true or false
draft_flag=""
if [ "$INPUT_DRAFT" = "true" ]; then
  draft_flag="--draft"
fi

prerelease_flag=""
if [ "$INPUT_PRERELEASE" = "true" ]; then
  prerelease_flag="--prerelease"
fi

latest_flag=""
if [ "$INPUT_LATEST" = "true" ]; then
  latest_flag="--latest"
fi

discussion_category_flag=""
if [ -n "$INPUT_DISCUSSION_CATEGORY" ]; then
  discussion_category_flag="--discussion-category $INPUT_DISCUSSION_CATEGORY"
fi

# Use the provided token or GITHUB_TOKEN for authentication
gh auth login --with-token <<< "$INPUT_TOKEN"

# Prepare the arguments for gh release create command
arguments=()

# Append --title flag if title is provided
if [ -n "$INPUT_TITLE" ]; then
  arguments+=("--title" "$INPUT_TITLE")
fi

# Append --notes-file flag if notesFile is provided
if [ -n "$INPUT_NOTESFILE" ]; then
  arguments+=("--notes-file" "$INPUT_NOTESFILE")
elif [ -n "$INPUT_NOTES" ]; then
  # Append --notes flag with the provided release notes to the arguments
  printf -v formatted_notes '%q' "$INPUT_NOTES"
  arguments+=("--notes" "$formatted_notes")
fi

# Append optional flags to the arguments array
arguments+=("$draft_flag" "$prerelease_flag" "$latest_flag" "$discussion_category_flag" "$generate_notes_flag")

# Append tag and files to the arguments array
arguments+=("$INPUT_TAG" "$INPUT_FILES")

# Create the GitHub release with the specified arguments
gh release create "${arguments[@]}"
