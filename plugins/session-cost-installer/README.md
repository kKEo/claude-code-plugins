# session-cost-installer

One skill that installs the [session-cost](https://github.com/kKEo/claude-code-plugins-incubator/tree/master/plugins/session-cost) mod from the incubator marketplace `km-plugin-registry` (`kKEo/claude-code-plugins-incubator`), or updates it when it is already installed. It adds the marketplace first when it is missing.

## Usage

Ask in plain words ("install session-cost"), or use the command:

```
/session-cost-installer:install-session-cost            # install for this user
/session-cost-installer:install-session-cost project    # install into this project's shared settings
/session-cost-installer:install-session-cost local      # this project, this user only
```

When it is done, type `/reload-plugins` and then `/session-cost`. A skill cannot type slash commands, so that step is yours.

## What it does

1. Looks for the marketplace `km-plugin-registry`. Adds it from `kKEo/claude-code-plugins-incubator` when it is absent, refreshes it when it is present, and stops when that name points at another source.
2. Looks for an installed `session-cost`. Stops when the released copy `session-cost@km-plugins` is enabled, because two copies would draw two panes.
3. Runs `claude plugin install session-cost@km-plugin-registry --scope <scope>`, or `claude plugin update session-cost@km-plugin-registry`.
4. Confirms the plugin is listed and enabled, and reports the version.

## What it runs

Only these commands, which are also the only ones its `allowed-tools` let through without a prompt:

```
claude plugin marketplace list --json
claude plugin marketplace add kKEo/claude-code-plugins-incubator
claude plugin marketplace update km-plugin-registry
claude plugin list --json
claude plugin install session-cost@km-plugin-registry --scope <scope>
claude plugin update session-cost@km-plugin-registry
```

Adding the marketplace clones the repository from GitHub; the install writes the plugin into your Claude Code settings for the chosen scope. The skill reads and edits no file itself.

## Installation

```
/plugin marketplace add kKEo/claude-code-plugins
/plugin install session-cost-installer@km-plugins
/reload-plugins
```

## Why it names another marketplace

This marketplace, `km-plugins`, holds released plugins. The skill installs session-cost from the incubator, `km-plugin-registry`, where the mod is developed: you get the newest work, and it can change or break between two updates.
