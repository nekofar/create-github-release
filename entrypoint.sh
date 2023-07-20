#!/bin/bash

# Bail on first non-zero exit status, and bail if any referenced variable is unset.
set -eu

# Clear the GITHUB_TOKEN environment variable
unset GITHUB_TOKEN

# Function to add non-empty arguments to the array
function add_argument {
  if [ -n "$1" ]; then
    arguments+=("$2")
  fi
}

# Check for missing required parameters
if [ -z "$INPUT_TAG" ]; then
  echo "Error: 'tag' input is required but not provided."
  exit 1
fi

# Check if both title, notes, and notes file are not provided.
generate_notes_flag=""
if [[ -z "$INPUT_TITLE" && -z "$INPUT_NOTES" && -z "$INPUT_NOTES_FILE" ]]; then
  generate_notes_flag="--generate-notes"
fi

# Check if draft, prerelease, and latest options are set to true.
draft_flag=$([ "$INPUT_DRAFT" = "true" ] && echo "--draft" || echo "")
prerelease_flag=$([ "$INPUT_PRERELEASE" = "true" ] && echo "--prerelease" || echo "")
latest_flag=$([ "$INPUT_LATEST" = "true" ] && echo "--latest" || echo "")

# Use the provided token or GITHUB_TOKEN for authentication
gh auth login --with-token <<< "$INPUT_TOKEN"

# Prepare the arguments for gh release create command
arguments=()

# Append optional flags to the arguments array
add_argument "$draft_flag" "$draft_flag"
add_argument "$prerelease_flag" "$prerelease_flag"
add_argument "$latest_flag" "$latest_flag"
add_argument "$generate_notes_flag" "$generate_notes_flag"

# Append tag and files to the arguments array
add_argument "$INPUT_TAG" "$INPUT_TAG"
add_argument "$INPUT_FILES" "$INPUT_FILES"

# Check if title is provided and add it to the arguments array
add_argument "$INPUT_TITLE" "--title"
add_argument "$INPUT_TITLE" "$INPUT_TITLE"

# Check if notes file is provided and add it to the arguments array
add_argument "$INPUT_NOTES_FILE" "--notes-file"
add_argument "$INPUT_NOTES_FILE" "$INPUT_NOTES_FILE"

# Check if release notes are provided and add them to the arguments array
add_argument "$INPUT_NOTES" "--notes"
add_argument "$INPUT_NOTES" "$INPUT_NOTES"

# Check if discussion_category is provided.
add_argument "$INPUT_DISCUSSION_CATEGORY" "--discussion-category"
add_argument "$INPUT_DISCUSSION_CATEGORY" "$INPUT_DISCUSSION_CATEGORY"

# Create the GitHub release with the specified arguments
gh release create "${arguments[@]}"
