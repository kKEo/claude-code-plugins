# Troubleshooting the installer

Find the message or symptom in the left column. The skill stops at the first failure and shows the command's own error, so the text you see comes from `claude plugin`.

## While installing

| Symptom | Cause | Fix |
|---|---|---|
| The marketplace cannot be cloned | No network, or GitHub is not reachable from this machine | Check `git ls-remote https://github.com/kKEo/claude-code-plugins-incubator` in a terminal. Behind a proxy, set it up for git first |
| The plugin is not found in the marketplace | The local copy of the marketplace is older than the plugin | `/plugin marketplace update km-plugin-registry`, then ask again |
| The scope is refused | `project` and `local` need a project folder | Start Claude Code inside the repository, or use `user` |
| "`km-plugin-registry` points at …" and the skill stops | That name was added from another source, such as a local checkout | `claude plugin marketplace remove km-plugin-registry`, then ask again. Skip this if you added the local copy on purpose; install from it with `/plugin install` yourself |
| The skill stops because `session-cost@km-plugins` is enabled | The released copy of the mod is already on | `claude plugin disable session-cost@km-plugins`, then ask again |
| The mod is reported as installed but disabled | It was switched off earlier | `claude plugin enable session-cost@km-plugin-registry` |
| Claude asks for permission for a `claude plugin` command | Expected: the skill pre-approves no command | Read the command. Accept it if it is one of the six on [Commands and permissions](commands.md); decline it otherwise |

## After installing

| Symptom | Cause | Fix |
|---|---|---|
| `/session-cost` is an unknown command | The mod is installed but not loaded into this session | `/reload-plugins`, or start a new session |
| The update is reported but nothing changed | An update applies after a reload | `/reload-plugins`, or start a new session |
| Two panes or two status lines | Two copies of the mod are enabled | `claude plugin list` shows both; disable one |
| The skill is not offered when you ask | The installer itself is not loaded | `/plugin install session-cost-installer@km-plugins`, then `/reload-plugins` |
| The pane does not appear | The terminal is too narrow to dock a pane, or the pane is closed | Widen the terminal and type `/session-cost on` |

## Checking the state yourself

```bash
claude plugin marketplace list          # is km-plugin-registry there, and from where
claude plugin list                      # is session-cost@km-plugin-registry there, and enabled
claude plugin details session-cost@km-plugin-registry   # what the plugin contains
```

## Starting over

To go back to a clean state and install again:

```
claude plugin uninstall session-cost@km-plugin-registry
claude plugin marketplace remove km-plugin-registry
```

Then ask Claude to install session-cost.

## Where to report a problem

- The installer: [github.com/kKEo/claude-code-plugins/issues](https://github.com/kKEo/claude-code-plugins/issues)
- The mod: [github.com/kKEo/claude-code-plugins-incubator/issues](https://github.com/kKEo/claude-code-plugins-incubator/issues)
