# Changelog

All notable changes to this project will be documented in this file.

## [1.0.13] - 2023-11-03

### Bug Fixes

- Solve some minor issues and update dependencies

## [1.0.12] - 2023-07-29

### Bug Fixes

- Remove export from `GITHUB_TOKEN` setting

### Refactor

- Trim input token and authenticate GitHub CLI

### Miscellaneous Tasks

- Update GitHub release action reference in workflow

## [1.0.11] - 2023-07-27

### Miscellaneous Tasks

- Add usage guard to prepare workflow
- Update workflow job name for clarity
- Update Github actions to use specific versions

## [1.0.10] - 2023-07-27

### Refactor

- Improve entrypoint script execution in `action.yml`

## [1.0.9] - 2023-07-27

### Refactor

- Add color to error messages in `entrypoint.sh`
- Updated indentation in `action.yml` for clarity
- Add debug mode to the entrypoint bash script

## [1.0.8] - 2023-07-26

### Bug Fixes

- Update conditional check in `entrypoint.sh`

## [1.0.7] - 2023-07-26

### Bug Fixes

- Update environment variable assignment in `entrypoint.sh`

### Refactor

- Update `entrypoint.sh` for better compatibility and readability
- Update handling of GitHub token in entrypoint.sh

## [1.0.6] - 2023-07-24

### Documentation

- Add GitHub issue templates for bugs and feature requests
- Add funding information to the project

### Miscellaneous Tasks

- Add dependabot configuration for GitHub Actions
- Add Stale Bot configuration file

## [1] - 2023-07-23

### Documentation

- Update name of action on `action.yml` (#1)
- Add branding to the GitHub Action

## [1.0.4] - 2023-07-23

### Bug Fixes

- Update GitHub token validation in `entrypoint.sh`

### Miscellaneous Tasks

- Update GitHub release creation action version

## [1.0.3] - 2023-07-23

### Documentation

- Remove experimental warning in README

## [1.0.2] - 2023-07-23

### Miscellaneous Tasks

- Refactor GitHub Actions workflows

## [1.0.1] - 2023-07-23

### Refactor

- Set default title to tag in entrypoint script
- Add validation for GitHub token in `entrypoint.sh`

### Miscellaneous Tasks

- Update release creation action version
- Update release trigger events in Github Actions

## [1.0.0-beta.7] - 2023-07-23

### Miscellaneous Tasks

- Optimize changelog and GitHub release workflow in `prepare.yml`

## [1.0.0-beta.6] - 2023-07-23

### Miscellaneous Tasks

- Prevent major version tag on prerelease

## [1.0.0-beta.5] - 2023-07-23

### Miscellaneous Tasks

- Add write permissions to release workflow

## [1.0.0-beta.4] - 2023-07-23

### Miscellaneous Tasks

- Remove `check` dependency from `draft` job

## [1.0.0-beta.3] - 2023-07-23

### Documentation

- Refactor README.md for clarity and simplify inputs section
- Add configuration options to README
- Refactor README and add CONTRIBUTING guide

### Miscellaneous Tasks

- Add separate workflows for preparation, release, and checks

## [1.0.0-beta.2] - 2023-07-20

### Miscellaneous Tasks

- Remove cliff.toml from release workflow

## [1.0.0-beta.1] - 2023-07-20

### Miscellaneous Tasks

- Add name to release step in GitHub Actions

## [1.0.0-alpha.22] - 2023-07-20

### Miscellaneous Tasks

- Add Shellcheck job to GitHub release workflow

## [1.0.0-alpha.21] - 2023-07-20

### Bug Fixes

- Update script flags in `entrypoint.sh`

### Documentation

- Update property names in `README.md`

### Miscellaneous Tasks

- Replace static notes with `CHANGES.md` in release workflow
- Update `fetch-depth` in GitHub Actions workflow

## [1.0.0-alpha.20] - 2023-07-20

### Refactor

- Update variable names to follow underscore naming convention
- Remove extra newline from `action.yml`

### Miscellaneous Tasks

- Remove unnecessary commands from release workflow
- Add step to print changelog in release workflow
- Update notes file key in GitHub release workflow
- Update release notes configuration in workflow

## [1.0.0-alpha.19] - 2023-07-20

### Miscellaneous Tasks

- Add directory listing command to release workflow

## [1.0.0-alpha.18] - 2023-07-20

### Miscellaneous Tasks

- Change release file in GitHub workflows

## [1.0.0-alpha.17] - 2023-07-20

### Miscellaneous Tasks

- Set prerelease flag in GitHub Actions workflow
- Add github token to release workflow
- Add CHANGES.md to release workflow

## [1.0.0-alpha.16] - 2023-07-20

### Miscellaneous Tasks

- Add changelog generation to release workflow

## [1.0.0-alpha.15] - 2023-07-20

### Refactor

- Update argument addition in `entrypoint.sh`

## [1.0.0-alpha.14] - 2023-07-20

### Miscellaneous Tasks

- Update actions/checkout version in GitHub workflow
- Update release tag and title in Github Workflow

## [1.0.0-alpha.13] - 2023-07-20

### Bug Fixes

- Add write permissions to release workflow

## [1.0.0-alpha.12] - 2023-07-20

### Bug Fixes

- Clear `GITHUB_TOKEN` in `entrypoint.sh`

## [1.0.0-alpha.11] - 2023-07-20

### Refactor

- Update `entrypoint.sh` for readability and modularity

## [1.0.0-alpha.10] - 2023-07-20

### Refactor

- Add verbose mode to entrypoint.sh script

## [1.0.0-alpha.9] - 2023-07-20

### Refactor

- Update notes file variable for clarity
- Update release flags-checking in `entrypoint.sh`

## [1.0.0-alpha.8] - 2023-07-20

### Refactor

- Add safety flags to Bash script

### Miscellaneous Tasks

- Update GitHub release action

## [1.0.0-alpha.7] - 2023-07-20

### Bug Fixes

- Clear `GITHUB_TOKEN` env var in `entrypoint.sh` script

### Documentation

- Add warning note to README

## [1.0.0-alpha.6] - 2023-07-20

### Bug Fixes

- Update `entrypoint.sh` file permissions

## [1.0.0-alpha.5] - 2023-07-20

### Bug Fixes

- Update `action.yml` to use dynamic path for script

## [1.0.0-alpha.4] - 2023-07-20

### Bug Fixes

- Update token description in `action.yml`

## [1.0.0-alpha.3] - 2023-07-20

### Bug Fixes

- Add shell definition in composite run

## [1.0.0-alpha.2] - 2023-07-20

### Miscellaneous Tasks

- Add GitHub action to create release

## [1.0.0-alpha.1] - 2023-07-20

### Documentation

- Update README with status badges

## [1.0.0-alpha.0] - 2023-07-20

### Features

- Add GitHub Release creation script and related documentation

<!-- generated by git-cliff -->
