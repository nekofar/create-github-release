# Create GitHub Release Action

[![GitHub release (latest SemVer including pre-releases)](https://img.shields.io/github/v/release/nekofar/create-github-release?include_prereleases)](https://github.com/nekofar/create-github-release/releases)
[![GitHub Workflow Status (branch)](https://img.shields.io/github/actions/workflow/status/nekofar/create-github-release/build.yml)](https://github.com/nekofar/create-github-release/actions/workflows/build.yml)
[![GitHub](https://img.shields.io/github/license/nekofar/create-github-release)](https://github.com/nekofar/create-github-release/blob/master/LICENSE)
[![Twitter Follow](https://img.shields.io/badge/follow-%40nekofar-1DA1F2?logo=twitter&style=flat)](https://twitter.com/nekofar)
[![Donate](https://img.shields.io/badge/donate-nekofar.crypto-a2b9bc?logo=ko-fi&logoColor=white)](https://ud.me/nekofar.crypto)

GitHub Action to create a new release with optional notes and files.

## Inputs

### `tag` (required)

The tag name for the release (e.g., v1.0.0).

### `files`

Optional files to include in the release. You can provide the files in a single line or multiple lines. Examples:

```yaml
# Single line format
files: somefile somefolder/*
```
```yaml
# Multiple lines format
files: |
    somefile
    somefolder/*
```

### `title`
Optional release title.

### `notes`
Optional release notes. You can provide multiline notes.

### `notesFile`
Optional path to a file containing release notes. If provided, this will take precedence over notes.

### `draft`
Set to "true" to create a draft release. Default is false.

### `prerelease`
Set to "true" to create a pre-release. Default is false.

### `latest`
Set to "true" to mark this release as the latest. Default is false.

### `discussionCategory`
Optional discussion category for the release.

### `token`
GitHub token to authenticate with the repository. Default: ${{ github.token }}. If not provided, it will use the repository's default token for authentication.

## Example Usage

```yaml
name: Create Release

on:
    push:
    tags:
      - 'v*' # Create a release for tags starting with 'v'

jobs:
    create_release:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v2
    
      - name: Create Release
        uses: nekofar/create-github-release@v1
        with:
            tag: ${{ github.ref }}
            files: |
              dist/release-assets/*
            title: Release ${{ github.ref }}
            notes: |
              This is the release notes for version ${{ github.ref }}.
              Add any important information here.
            draft: false
            prerelease: false
            latest: true
        env:
            GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```

## License
This project is licensed under the [MIT License](LICENSE).
