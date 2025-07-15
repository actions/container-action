# Copilot Instructions

This GitHub Action is written as a Docker container that invokes an entrypoint
script. The entrypoint script is responsible for invoking the main logic of the
action.

## Repository Structure

| Path                 | Description                         |
| -------------------- | ----------------------------------- |
| `.devcontainer/`     | Development Container Configuration |
| `.github/`           | GitHub Configuration                |
| `.markdown-lint.yml` | Markdown Linter Configuration       |
| `.prettierrc.yml`    | Prettier Formatter Configuration    |
| `.yaml-lint.yml`     | YAML Linter Configuration           |
| `action.yml`         | GitHub Action Metadata              |
| `CODEOWNERS`         | Code Owners File                    |
| `Dockerfile`         | Dockerfile for the Action           |
| `entrypoint.sh`      | Entrypoint Script                   |
| `LICENSE`            | License File                        |
| `README.md`          | Project Documentation               |

## General Coding Guidelines

- Follow standard shell scripting conventions and best practices
- Changes should maintain consistency with existing patterns and style
- Document changes clearly and thoroughly, including updates to existing
  comments when appropriate
- Do not include basic, unnecessary comments that simply restate what the code
  is doing (focus on explaining _why_, not _what_)
- Use consistent error handling patterns throughout the codebase
- Keep functions focused and manageable
- Use descriptive variable and function names that clearly convey their purpose
- When suggesting code changes, always opt for the most maintainable approach.
  Try your best to keep the code clean and follow "Don't Repeat Yourself" (DRY)
  principles
- Avoid unnecessary complexity and always consider the long-term maintainability
  of the code

### Versioning

GitHub Actions are versioned using branch and tag names. The version should
follow [Semantic Versioning](https://semver.org/) principles.

## Pull Request Guidelines

When creating a pull request (PR), please ensure that:

- Keep changes focused and minimal (avoid large changes, or consider breaking
  them into separate, smaller PRs)
- Formatting checks pass
- Linting checks pass
- If necessary, the `README.md` file is updated to reflect any changes in
  functionality or usage

The body of the PR should include:

- A summary of the changes
- A special note of any changes to dependencies
- A link to any relevant issues or discussions
- Any additional context that may be helpful for reviewers

## Code Review Guidelines

When performing a code review, please follow these guidelines:

- If there are changes that modify the functionality/usage of the action,
  validate that there are changes in the `README.md` file that document the new
  or modified functionality
