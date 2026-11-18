# How the installer works

The skill is a short procedure of five steps. Claude follows it in order and stops at the first step that cannot be completed.

![How plan-progress-installer works: the skill checks the marketplace, checks what is installed, installs or updates the mod with the claude command line, verifies it and reports](../images/how-plan-progress-installer.svg)

The numbers on the picture are steps 1 to 4 below; the report is step 5.

## Step 1: check the marketplace

The skill runs `claude plugin marketplace list --json` and looks for an entry named `km-plugin-registry`.

| What it finds | What it does |
|---|---|
| No such entry | `claude plugin marketplace add kKEo/claude-code-plugins-incubator` |
| The entry, and its `repo` or `url` names `kKEo/claude-code-plugins-incubator` | `claude plugin marketplace update km-plugin-registry`, so the newest version is the one installed |
| The entry, with any other source (a local folder, a fork) | Stops and tells you what the name points at |

The third row matters because marketplace names are local: anyone can add a folder of their own under the name `km-plugin-registry`. Installing from it would not be an install from the incubator, so the skill leaves the decision to you. Remove the entry with `claude plugin marketplace remove km-plugin-registry` and ask again if you want the real one.

## Step 2: check what is installed

The skill runs `claude plugin list --json` and looks for two ids.

| What it finds | What it does |
|---|---|
| `plan-progress@km-plugins` installed and enabled | Stops. Two enabled copies of the mod draw two panes and two status lines. It names the way out, `claude plugin disable plan-progress@km-plugins`, and does not run it |
| `plan-progress@km-plugin-registry` installed | Goes on to update |
| Neither | Goes on to install |

The first row guards against a released copy of plan-progress in `km-plugins`. None has been published so far, so today this check never fires; it is there so that the skill stays correct on the day the mod is released.

## Step 3: install or update

- Install: `claude plugin install plan-progress@km-plugin-registry --scope <scope>`, with the scope you named or `user`.
- Update: `claude plugin update plan-progress@km-plugin-registry`. The skill notes the version before and after.

## Step 4: verify

The skill runs `claude plugin list --json` once more and confirms that `plan-progress@km-plugin-registry` is listed with `"enabled": true`. A plugin that is installed but disabled is reported with the command that enables it, `claude plugin enable plan-progress@km-plugin-registry`; the skill does not enable it for you, since somebody switched it off on purpose.

## Step 5: report

A few lines:

- what happened: installed or updated, the version, the scope, and whether the marketplace had to be added;
- what you do next: `/reload-plugins`, then `/plan-progress`;
- where the options are: `/config`, under the plugin (opening the pane at start, and the plan status line).

## Why it stops instead of improvising

When a command fails, the skill shows the command and its error output unchanged, and stops. It is told not to retry with other flags, clone the repository by hand, copy files into `~/.claude/plugins` or edit a settings file. An installation done some other way would not be tracked by Claude Code: it could not be updated or removed with `/plugin`, and nobody would know where it came from.

## Decisions at a glance

| Situation | Outcome |
|---|---|
| Marketplace absent, mod absent | Marketplace added, mod installed |
| Marketplace present, mod absent | Marketplace refreshed, mod installed |
| Marketplace present, mod installed | Marketplace refreshed, mod updated |
| Marketplace name points elsewhere | Stop, nothing changed |
| Released copy `plan-progress@km-plugins` enabled | Stop, nothing installed (the marketplace may have been added or refreshed in step 1) |
| Mod installed but disabled | Reported, with the enable command |
| Scope is not `user`, `project` or `local` | Stop before step 1 |
| Any command fails | Error shown, stop |
