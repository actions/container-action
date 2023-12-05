# Container Action Template

[![GitHub Super-Linter](https://github.com/actions/container-action/actions/workflows/linter.yml/badge.svg)](https://github.com/super-linter/super-linter)
![CI](https://github.com/actions/container-action/actions/workflows/ci.yml/badge.svg)

Use this template to bootstrap the creation of a container action. :rocket:

This template includes compilation support, tests, a validation workflow,
publishing, and versioning guidance.

If you are new, there's also a simpler introduction in the
[Hello World Docker Action](https://github.com/actions/hello-world-docker-action)
repository.

If you would like to use the
[GitHub Actions Toolkit](https://github.com/actions/toolkit) in your container
action, see the
[Container Toolkit Action](https://github.com/actions/container-toolkit-action)
repository.

## Create Your Own Action

To create your own action, you can use this repository as a template! Just
follow the below instructions:

1. Click the **Use this template** button at the top of the repository
1. Select **Create a new repository**
1. Select an owner and name for your new repository
1. Click **Create repository**
1. Clone your new repository

> [!IMPORTANT]
>
> Make sure to remove or update the [`CODEOWNERS`](./CODEOWNERS) file! For
> details on how to use this file, see
> [About code owners](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-code-owners).

## Initial Setup

After you've cloned the repository to your local machine or codespace, you'll
need to perform some initial setup steps before you can develop your action.

> [!NOTE]
>
> You'll need to have a reasonably modern version of
> [Docker](https://www.docker.com/get-started/) handy (e.g. docker engine
> version 20 or later).

1. :hammer_and_wrench: Build the container

   Make sure to replace `actions/container-action` with an appropriate label for
   your container.

   ```bash
   docker build -t actions/container-action .
   ```

1. :white_check_mark: Test the container

   You can pass individual environment variables using the `--env` or `-e` flag.

   ```bash
   $ docker run --env INPUT_WHO_TO_GREET="Mona Lisa Octocat" actions/container-action
   ::notice file=entrypoint.sh,line=7::Hello, Mona Lisa Octocat!
   ```

   Or you can pass a file with environment variables using `--env-file`.

   ```bash
   $ cat ./.env.test
   INPUT_WHO_TO_GREET="Mona Lisa Octocat"

   $ docker run --env-file ./.env.test actions/container-action
   ::notice file=entrypoint.sh,line=7::Hello, Mona Lisa Octocat!
   ```

## Update the Action Metadata

The [`action.yml`](action.yml) file defines metadata about your action, such as
input(s) and output(s). For details about this file, see
[Metadata syntax for GitHub Actions](https://docs.github.com/en/actions/creating-actions/metadata-syntax-for-github-actions).

When you copy this repository, update `action.yml` with the name, description,
inputs, and outputs for your action.

## Update the Action Code

In this template, the container action runs a shell script,
[`entrypoint.sh`](./entrypoint.sh), when the container is launched. Since you
can choose any base Docker image and language you like, you can change this to
suite your needs. There are a few main things to remember when writing code for
container actions:

- Inputs are accessed using argument identifiers or environment variables
  (depending on what you set in your `action.yml`). For example, the first input
  to this action, `who-to-greet`, can be accessed in the entrypoint script using
  the `$INPUT_WHO_TO_GREET` environment variable.

  ```bash
  GREETING="Hello, $INPUT_WHO_TO_GREET!"
  ```

- GitHub Actions supports a number of different workflow commands such as
  creating outputs, setting environment variables, and more. These are
  accomplished by writing to different `GITHUB_*` environment variables. For
  more information, see
  [Workflow commands](https://docs.github.com/en/actions/using-workflows/workflow-commands-for-github-actions).

  | Scenario              | Example                                         |
  | --------------------- | ----------------------------------------------- |
  | Set environment vars  | `echo "MY_VAR=my-value" >> "$GITHUB_ENV"`       |
  | Set outputs           | `echo "greeting=$GREETING" >> "$GITHUB_OUTPUT"` |
  | Prepend to `PATH`     | `echo "$HOME/.local/bin" >> "$GITHUB_PATH"`     |
  | Set `pre`/`post` vars | `echo "MY_VAR=my-value" >> "$GITHUB_STATE"`     |
  | Set step summary      | `echo "{markdown}" >> "$GITHUB_STEP_SUMMARY"`   |

  You can write multiline strings using the following syntax:

  ```bash
  {
    echo "JSON_RESPONSE<<EOF"
    curl https://example.com
    echo "EOF"
  } >> "$GITHUB_ENV"
  ```

- Make sure that the script being run is executable!

  ```bash
  git add entrypoint.sh
  git update-index --chmod=+x entrypoint.sh
  ```

So, what are you waiting for? Go ahead and start customizing your action!

1. Create a new branch

   ```bash
   git checkout -b releases/v1
   ```

1. Replace the contents of `entrypoint.sh` with your action code
1. Build and test the container

   ```bash
   docker build -t actions/container-action .
   docker run actions/container-action "Mona Lisa Octocat"
   ```

1. Commit your changes

   ```bash
   git add .
   git commit -m "My first action is ready!"
   ```

1. Push them to your repository

   ```bash
   git push -u origin releases/v1
   ```

1. Create a pull request and get feedback on your action
1. Merge the pull request into the `main` branch

Your action is now published! :rocket:

For information about versioning your action, see
[Versioning](https://github.com/actions/toolkit/blob/master/docs/action-versioning.md)
in the GitHub Actions toolkit.

## Validate the Action

You can now validate the action by referencing it in a workflow file. For
example, [`ci.yml`](./.github/workflows/ci.yml) demonstrates how to reference an
action in the same repository.

```yaml
steps:
  - name: Checkout
    id: checkout
    uses: actions/checkout@v3

  - name: Test Local Action
    id: test-action
    uses: ./
    with:
      who-to-greet: Mona Lisa Octocat

  - name: Print Output
    id: output
    run: echo "${{ steps.test-action.outputs.greeting }}"
```

For example workflow runs, check out the
[Actions tab](https://github.com/actions/container-action/actions)! :rocket:

## Usage

After testing, you can create version tag(s) that developers can use to
reference different stable versions of your action. For more information, see
[Versioning](https://github.com/actions/toolkit/blob/master/docs/action-versioning.md)
in the GitHub Actions toolkit.

To include the action in a workflow in another repository, you can use the
`uses` syntax with the `@` symbol to reference a specific branch, tag, or commit
hash.

```yaml
steps:
  - name: Checkout
    id: checkout
    uses: actions/checkout@v3

  - name: Test Local Action
    id: test-action
    uses: actions/container-action@v1 # Commit with the `v1` tag
    with:
      who-to-greet: Mona Lisa Octocat

  - name: Print Output
    id: output
    run: echo "${{ steps.test-action.outputs.greeting }}"
```
