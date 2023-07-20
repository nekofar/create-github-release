# Create Release GitHub Action

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
