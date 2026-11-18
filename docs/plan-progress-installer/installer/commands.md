# Commands and permissions

This page lists everything the installer runs, what each command changes, and how Claude Code asks you before running them.

## The six commands

| Command | Reads or writes | Effect |
|---|---|---|
| `claude plugin marketplace list --json` | reads | Lists the marketplaces Claude Code knows, with their sources |
| `claude plugin marketplace add kKEo/claude-code-plugins-incubator` | writes | Clones the incubator from GitHub into `~/.claude/plugins/marketplaces/` and records it in your user settings |
| `claude plugin marketplace update km-plugin-registry` | writes | Pulls the newest state of that clone |
| `claude plugin list --json` | reads | Lists the installed plugins with version, scope and whether each is enabled |
| `claude plugin install plan-progress@km-plugin-registry --scope <scope>` | writes | Copies the mod into Claude Code's plugin cache and records it in the settings of the scope |
| `claude plugin update plan-progress@km-plugin-registry` | writes | Replaces the cached copy with the newest version |

The skill itself opens no file, edits no file and makes no network request. The network traffic is the `claude` command line talking to GitHub when a marketplace is added or refreshed.

## Permission prompts

The skill pre-approves nothing: it has no `allowed-tools` list. Every command above is an ordinary Bash call, so Claude Code asks you before each one unless your own permission settings already allow it. In a first run that is up to five questions: the listings, the marketplace step and the install or update.

The prompt shows the exact command. Compare it with the table above before you accept: the marketplace source, the marketplace name and the plugin id should be the ones on this page. Decline anything else. If you decline a command, the skill says which step was skipped and stops.

To be asked less often, allow the two read-only commands yourself, in `.claude/settings.json` or with "always allow" in the prompt:

```json
{
  "permissions": {
    "allow": [
      "Bash(claude plugin marketplace list:*)",
      "Bash(claude plugin list:*)"
    ]
  }
}
```

The commands that change what is switched on, `enable`, `disable` and `uninstall`, are never run by the skill. It names them when they are needed and you run them.

## The skill's command

```
/plan-progress-installer:install-plan-progress [user|project|local]
```

| Argument | Meaning |
|---|---|
| none | Same as `user` |
| `user` | Install for you, in every project |
| `project` | Install into this repository's shared settings |
| `local` | Install for you, in this repository only |
| anything else | Refused; the three values are listed and nothing runs |

The skill is also started by asking for it. Its description tells Claude to use it when you ask to install plan-progress, set up its pane, get the newest plan-progress or update it to the incubator version.

## Doing the same by hand

The skill does nothing you could not type. Without it:

```
/plugin marketplace add kKEo/claude-code-plugins-incubator
/plugin install plan-progress@km-plugin-registry
/reload-plugins
```

and later, to update:

```
/plugin marketplace update km-plugin-registry
/plugin update plan-progress@km-plugin-registry
/reload-plugins
```
