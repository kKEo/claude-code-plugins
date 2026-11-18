# What the installer does

`session-cost-installer` is a Claude Code plugin with one skill, `install-session-cost`. The skill sets up the [session-cost mod](../mod/overview.md), the pane that lists every model request of a session with its tokens and cost, so that you do not have to type the install commands yourself or know which marketplace the mod lives in.

![Workflow of session-cost-installer: you ask, the skill checks the marketplace and what is installed, installs or updates the mod, and you reload](../images/workflow-session-cost-installer.svg)

## In one paragraph

You ask Claude to "install session-cost". The skill checks whether the incubator marketplace `km-plugin-registry` is known to your Claude Code, adds it from `kKEo/claude-code-plugins-incubator` when it is not, and refreshes it when it is. It then installs `session-cost@km-plugin-registry`, or updates it when it is already installed, checks that the plugin is listed and enabled, and tells you the version and the one step that is left for you: `/reload-plugins`.

## Two marketplaces, two names

The installer and the mod come from different places. That is the point of the plugin.

| | Where the installer lives | Where the mod comes from |
|---|---|---|
| Repository | `kKEo/claude-code-plugins` | `kKEo/claude-code-plugins-incubator` |
| Marketplace name | `km-plugins` | `km-plugin-registry` |
| Plugin id | `session-cost-installer@km-plugins` | `session-cost@km-plugin-registry` |
| Holds | released plugins | every plugin while it is developed |

The incubator's `master` branch is what its marketplace serves, so the mod you get is the newest work. It can change, or break, between two updates.

## What it is good for

- **Claude does the setup.** In a scripted or headless session, or when you would rather ask than type, one sentence is enough.
- **The checks come with it.** A stale marketplace copy, a marketplace name that points at a fork, and a second enabled copy of the mod are all noticed before anything is installed.
- **Updating is the same request.** Ask again later and the skill refreshes the marketplace and updates the mod.

## What it does not do

- It does not open the pane or reload plugins. A skill cannot type slash commands; `/reload-plugins` and `/session-cost` are yours to type.
- It does not change the mod's options. Those are in `/config`, under the plugin; see [Settings](../mod/settings.md).
- It does not work around a failure. If a command fails, it shows the error and stops; see [Troubleshooting](troubleshooting.md).
- It does not enable, disable or uninstall anything by itself. When one of those is needed it names the command and leaves it to you.

## The pieces

```
plugins/session-cost-installer/
├── .claude-plugin/plugin.json            # the manifest: name, version, description
├── skills/install-session-cost/SKILL.md   # the skill: the steps Claude follows
├── README.md
└── LICENSE
```

There are no hooks, agents, MCP servers or scripts. Everything the plugin does is written in `SKILL.md`, and Claude carries it out with the `claude plugin` command line.
