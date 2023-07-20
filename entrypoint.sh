#!/bin/bash

# Bail on first non-zero exist status, and bail any referenced variable is unset.
set -eu

# Clear the GITHUB_TOKEN environment variable
unset GITHUB_TOKEN

# Check if both title, notes and notes file are not provided.
generate_notes_flag=""
if [[ -z "$INPUT_TITLE" && -z "$INPUT_NOTES" && -z "$INPUT_NOTES_FILE" ]]; then
 generate_notes_flag="--generate-notes"
fi

# Check if draft, prerelease, and latest options are set to true.
draft_flag=$([ "$INPUT_DRAFT" = "true" ] && echo "--draft" || echo "")
prerelease_flag=$([ "$INPUT_PRERELEASE" = "true" ] && echo "--prerelease" || echo "")
latest_flag=$([ "$INPUT_LATEST" = "true" ] && echo "--latest" || echo "")

# Check if discussion_category is provided.
discussion_category_flag=""
if [ -n "$INPUT_DISCUSSION_CATEGORY" ]; then
 discussion_category_flag="--discussion-category $INPUT_DISCUSSION_CATEGORY"
fi

# Use the provided token or GITHUB_TOKEN for authentication
gh auth login --with-token <<< "$INPUT_TOKEN"

# Prepare the arguments for gh release create command
arguments=()

# Check if title is provided.
if [ -n "$INPUT_TITLE" ]; then
 arguments+=("--title" "$INPUT_TITLE")
fi

# Check if notes file is provided.
if [ -n "$INPUT_NOTES_FILE" ]; then
 arguments+=("--notes-file" "$INPUT_NOTES_FILE")
elif [ -n "$INPUT_NOTES" ]; then
 printf -v formatted_notes '%q' "$INPUT_NOTES"
 arguments+=("--notes" "$formatted_notes")
fi

# Append optional flags to the arguments array
arguments+=("$draft_flag" "$prerelease_flag" "$latest_flag" "$discussion_category_flag" "$generate_notes_flag")

# Append tag and files to the arguments array
arguments+=("$INPUT_TAG" "$INPUT_FILES")

# Create the GitHub release with the specified arguments
gh release create "${arguments[@]}"
