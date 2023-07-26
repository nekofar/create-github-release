#!/bin/bash

# Bail on first non-zero exit status, and bail if any referenced variable is unset.
set -eu

# Function to add non-empty arguments to the array
add_argument() {
  if [ -n "$1" ]; then
    arguments[${#arguments[@]}]="$2"
  fi
}

# Check for missing required parameters
if [ -z "$INPUT_TAG" ]; then
  echo "Error: 'tag' input is required but not provided."
  exit 1
fi

# Set title equal to the tag if no title is provided.
if [ -z "$INPUT_TITLE" ]; then
  INPUT_TITLE="$INPUT_TAG"
fi

# Check if a given GitHub token could be valid
# If it's not, an error message outputs and the script exits.
if ! echo "$INPUT_TOKEN" | grep -E '^(gh[ps]_[a-zA-Z0-9]{36}|github_pat_[a-zA-Z0-9]{22}_[a-zA-Z0-9]{59})$' >/dev/null; then
  echo "Error: 'token' input does not appear to be a valid GitHub token."
  exit 1
fi

# Setting GitHub token as environment variable
export GITHUB_TOKEN=${INPUT_TOKEN:-$GITHUB_TOKEN}

# Check if both notes and notes file are not provided.
generate_notes_flag=""
if [ -z "$INPUT_NOTES" -a -z "$INPUT_NOTES_FILE" ]; then
  generate_notes_flag="--generate-notes"
fi

# Check if draft, prerelease, and latest options are set to true.
draft_flag=$([ "$INPUT_DRAFT" = "true" ] && echo "--draft" || echo "")
prerelease_flag=$([ "$INPUT_PRERELEASE" = "true" ] && echo "--prerelease" || echo "")
latest_flag=$([ "$INPUT_LATEST" = "true" ] && echo "--latest" || echo "")

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
