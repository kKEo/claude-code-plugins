# session-cost-installer and the session-cost mod

This book describes two things that belong together:

- **The installer**, `session-cost-installer`: a plugin from the `km-plugins` marketplace whose one skill installs or updates the mod for you.
- **The mod**, `session-cost`: what the installer installs. It records every model request of a Claude Code session and shows its tokens and cost in a pane beside the chat.

![Workflow of session-cost-installer: you ask, the skill checks the marketplace and what is installed, installs or updates the mod, and you reload](images/workflow-session-cost-installer.svg)

## Start here

| If you want to… | Read |
|---|---|
| Get the pane working in two minutes | [Install and run the installer](installer/get-started.md) |
| Know what the installer will do before you let it | [How the installer works](installer/how-it-works.md) and [Commands and permissions](installer/commands.md) |
| Understand what you see in the pane | [What the mod does](mod/overview.md) and [The four views](mod/views.md) |
| Know where the dollar figures come from | [How cost is counted](mod/cost.md) |
| Know what the mod reads, keeps and sends | [Data and privacy](mod/data-privacy.md) |
| Fix something | [Troubleshooting the installer](installer/troubleshooting.md) and the [FAQ](faq.md) |

## The short version

```
/plugin marketplace add kKEo/claude-code-plugins
/plugin install session-cost-installer@km-plugins
/reload-plugins
install session-cost
/reload-plugins
/session-cost
```

The fourth line is a sentence to Claude, not a command. It starts the installer skill.

## Versions this book describes

`session-cost-installer` 0.1.0 and `session-cost` 0.6.0. The mod is developed in the incubator and changes often; its own [README](https://github.com/kKEo/claude-code-plugins-incubator/tree/master/plugins/session-cost) is the authority when this book and the mod disagree.
