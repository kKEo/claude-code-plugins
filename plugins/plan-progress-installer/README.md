# plan-progress-installer

One skill that installs the [plan-progress](https://github.com/kKEo/claude-code-plugins-incubator/tree/master/plugins/plan-progress) mod from the incubator marketplace `km-plugin-registry` (`kKEo/claude-code-plugins-incubator`), or updates it when it is already installed. It adds the marketplace first when it is missing.

The full description, of the installer and of the mod, is the book [plan-progress-installer and the plan-progress mod](https://kkeo.github.io/claude-code-plugins/plan-progress-installer/) ([source](../../docs/plan-progress-installer/README.md)).

## Usage

Ask in plain words ("install plan-progress"), or use the command:

```
/plan-progress-installer:install-plan-progress            # install for this user
/plan-progress-installer:install-plan-progress project    # install into this project's shared settings
/plan-progress-installer:install-plan-progress local      # this project, this user only
```

When it is done, type `/reload-plugins` and then `/plan-progress`. A skill cannot type slash commands, so that step is yours.

## What it does

1. Looks for the marketplace `km-plugin-registry`. Adds it from `kKEo/claude-code-plugins-incubator` when it is absent, refreshes it when it is present, and stops when that name points at another source.
2. Looks for an installed `plan-progress`. Stops when the released copy `plan-progress@km-plugins` is enabled, because two copies would draw two panes.
3. Runs `claude plugin install plan-progress@km-plugin-registry --scope <scope>`, or `claude plugin update plan-progress@km-plugin-registry`.
4. Confirms the plugin is listed and enabled, and reports the version.

## What it runs

Only these commands. The skill pre-approves none of them, so Claude Code asks you before each one that your permission settings do not already allow:

```
claude plugin marketplace list --json
claude plugin marketplace add kKEo/claude-code-plugins-incubator
claude plugin marketplace update km-plugin-registry
claude plugin list --json
claude plugin install plan-progress@km-plugin-registry --scope <scope>
claude plugin update plan-progress@km-plugin-registry
```

Adding the marketplace clones the repository from GitHub; the install writes the plugin into your Claude Code settings for the chosen scope. The skill reads and edits no file itself.

## Installation

```
/plugin marketplace add kKEo/claude-code-plugins
/plugin install plan-progress-installer@km-plugins
/reload-plugins
```

## Why it names another marketplace

This marketplace, `km-plugins`, holds released plugins. The skill installs plan-progress from the incubator, `km-plugin-registry`, where the mod is developed: you get the newest work, and it can change or break between two updates.
