# Install and run the installer

This page takes you from nothing to a working plan-progress pane. It takes about two minutes.

## Before you start

- Claude Code with plugin support. `claude plugin --help` in a terminal prints the plugin commands when it has it.
- Network access to GitHub from the machine. Both marketplaces are cloned from there.

## 1. Add this marketplace and install the installer

At the prompt of a Claude Code session:

```
/plugin marketplace add kKEo/claude-code-plugins
/plugin install plan-progress-installer@km-plugins
/reload-plugins
```

## 2. Ask for the mod

In plain words:

```
install plan-progress
```

or with the skill's command, which also takes the scope:

```
/plan-progress-installer:install-plan-progress
/plan-progress-installer:install-plan-progress project
/plan-progress-installer:install-plan-progress local
```

Claude Code asks for your permission before each `claude plugin` command the skill runs, unless your settings already allow it. [Commands and permissions](commands.md) lists the six commands, so you can check each prompt against it.

## 3. Reload and open the pane

When the skill reports that the mod is installed, type:

```
/reload-plugins
/plan-progress
```

The first loads the mod into the running session; the second opens its pane. [What the mod does](../mod/overview.md) describes what you now see.

## Choosing a scope

The scope decides where the installation is recorded, and so who gets the mod.

| Scope | Recorded in | Who gets the mod |
|---|---|---|
| `user` (default) | your user settings | you, in every project |
| `project` | the project's shared settings | everyone who works in this repository and trusts its settings |
| `local` | the project's local settings | you, in this repository only |

`project` and `local` need the session to be running inside a project folder. Any other word is refused: the skill lists the three accepted values and stops.

## Updating later

Ask again:

```
update plan-progress to the incubator version
```

The skill refreshes the marketplace, runs the update and reports the version before and after. An update takes effect after `/reload-plugins`, or in the next session.

## Removing the installer

The installer is only needed while it runs. Removing it leaves the mod in place:

```
claude plugin uninstall plan-progress-installer@km-plugins
```

To remove the mod itself, see [Update and remove](../mod/update-remove.md).
