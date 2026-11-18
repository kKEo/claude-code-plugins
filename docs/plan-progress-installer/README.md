# plan-progress-installer and the plan-progress mod

This book describes two things that belong together:

- **The installer**, `plan-progress-installer`: a plugin from the `km-plugins` marketplace whose one skill installs or updates the mod for you.
- **The mod**, `plan-progress`: what the installer installs. It keeps the current plan and its progress in a pane beside the chat.

![Workflow of plan-progress-installer: you ask, the skill checks the marketplace and what is installed, installs or updates the mod, and you reload](images/workflow-plan-progress-installer.svg)

## Start here

| If you want to… | Read |
|---|---|
| Get the pane working in two minutes | [Install and run the installer](installer/get-started.md) |
| Know what the installer will do before you let it | [How the installer works](installer/how-it-works.md) and [Commands and permissions](installer/commands.md) |
| Understand what you see in the pane | [What the mod does](mod/overview.md) and [The two views](mod/views.md) |
| Know why a step is, or is not, ticked | [Where progress comes from](mod/progress.md) |
| Write plans the mod splits well | [How a plan is split](mod/plan-format.md) |
| Know what the mod reads and keeps | [Data and privacy](mod/data-privacy.md) |
| Fix something | [Troubleshooting the installer](installer/troubleshooting.md) and the [FAQ](faq.md) |

## The short version

```
/plugin marketplace add kKEo/claude-code-plugins
/plugin install plan-progress-installer@km-plugins
/reload-plugins
install plan-progress
/reload-plugins
/plan-progress
```

The fourth line is a sentence to Claude, not a command. It starts the installer skill.

## Versions this book describes

`plan-progress-installer` 0.1.0 and `plan-progress` 0.2.0. The mod is developed in the incubator and changes often; its own [README](https://github.com/kKEo/claude-code-plugins-incubator/tree/master/plugins/plan-progress) is the authority when this book and the mod disagree.
