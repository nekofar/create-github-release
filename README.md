# Create GitHub Release Action

[![GitHub release (latest SemVer including pre-releases)](https://img.shields.io/github/v/release/nekofar/create-github-release?include_prereleases)](https://github.com/nekofar/create-github-release/releases)
[![GitHub Workflow Status (branch)](https://img.shields.io/github/actions/workflow/status/nekofar/create-github-release/prepare.yml)](https://github.com/nekofar/create-github-release/actions/workflows/prepare.yml)
[![GitHub](https://img.shields.io/github/license/nekofar/create-github-release)](https://github.com/nekofar/create-github-release/blob/master/LICENSE)
[![Twitter Follow](https://img.shields.io/badge/follow-%40nekofar-1DA1F2?logo=twitter&style=flat)](https://twitter.com/nekofar)
[![Donate](https://img.shields.io/badge/donate-nekofar.crypto-a2b9bc?logo=ko-fi&logoColor=white)](https://ud.me/nekofar.crypto)

GitHub Action to create a new release with optional notes and files.

> **Warning**
> Please note this is an experimental project and is currently under development. As such, it may not be suitable for
> use in production environments. Use at your own risk and discretion.

## Usage

```yaml
# This workflow is named "Create Release"
name: Create Release

# The workflow is triggered on push events with tags that start with 'v'
on:
  push:
    tags:
      - 'v*'

jobs:
  create_release:
    # Runs the job on the latest Ubuntu version
    runs-on: ubuntu-latest

    steps:
      # Checks out a copy of your repository
      - name: Checkout code
        uses: actions/checkout@v2

      - name: Create Release
        # Uses the create-github-release action
        uses: nekofar/create-github-release@v1
        with:
          # Defines the tag name for the release (e.g., v1.0.0).
          tag: ${{ github.ref_name }}

          # (Optional) Files to include in the release
          files: |
            dist/release-assets/*  

          # (Optional) Defines the title of the release
          title: Release ${{ github.ref_name }}

          # (Optional) Allows multiline release notes
          notes: |
            This is the release notes for version ${{ github.ref_name }}.
            Add any important information here.

          # (Optional) Set to "true" to create a draft release. Default is "false"
          draft: false

          # (Optional) Set to "true" to create a pre-release. Default is "false"
          prerelease: false

          # (Optional) Set to "true" to mark this release as the latest. Default is "false"
          latest: true

          # (Optional) GitHub token for authentication. Default: ${{ github.token }}. If not provided, it will use the repository's default token
          token: ${{ github.token }}          
```

## Options

The configuration used in the GitHub Action workflow includes several options for customization. Each of these
configuration options has a specific use and can be tailored to suit your specific workflow needs. Below is a table
depicting these options:

| Option       | Description                                                                                                                                         |
|--------------|-----------------------------------------------------------------------------------------------------------------------------------------------------|
| `tag`        | This defines the tag name for the release (e.g., v1.0.0).                                                                                           |
| `files`      | (Optional) This specifies any files that you wish to include in the release.                                                                        |
| `title`      | (Optional) This defines the title of the release.                                                                                                   |
| `notes`      | (Optional) This allows multiline release notes.                                                                                                     |
| `draft`      | (Optional) This can be set to "true" to create a draft release. The default is "false".                                                             |
| `prerelease` | (Optional) This can be set to "true" to create a pre-release. The default is "false".                                                               |
| `latest`     | (Optional) This can be set to "true" to mark this release as the latest. The default is "false".                                                    |
| `token`      | (Optional) This is the GitHub token for authentication. The default is `github.token`. If not provided, it will use the repository's default token. |

Each option should be carefully considered to ensure that your workflow proceeds as expected.

## Contributing

We value your input and help! If you're interested in contributing, please reference
our [Contributing Guidelines](./CONTRIBUTING.md). Contributions aren't just about code - any bug reports, feedback, or
documentation enhancements are welcomed. Thanks for helping to improve this project!
