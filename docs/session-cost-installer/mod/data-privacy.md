# Data and privacy

The mod keeps its data on your computer and sends none of it anywhere. This page says exactly what it reads, what it keeps and for how long. The mod's own [privacy policy](https://github.com/kKEo/claude-code-plugins-incubator/blob/master/plugins/session-cost/PRIVACY.md) is the binding text.

## What it collects

For each model request, metadata only:

- the token counts, the model and the effort;
- the start and end time, and the stop reason;
- the names of the tools called;
- whether a subagent made the request, and the turn and subagent ids Claude Code assigns.

It also reads the session's running cost and its start time. The history across sessions is stored under the session's id.

## What it does not read

Prompts, responses, tool inputs, tool results, or any of your files.

There are two exceptions, both narrow:

| It reads | When | What it takes |
|---|---|---|
| Its own `.claude-plugin/plugin.json` | Always | The version, to show `v0.6.0` in the header |
| The session's transcript files under `~/.claude/projects/` (or `$CLAUDE_CONFIG_DIR/projects/`) | Only with *Cache TTL split* on | The 1-hour and 5-minute cache-write counts of each response. The files hold the conversation; the mod keeps only those counts |

## What it sends

Nothing. The mod fetches nothing and sends nothing. There is no analytics and no telemetry, and no data goes to the author or to any third party.

## What it runs

Nothing. It starts no process, runs no shell command, calls no tool, agent or model, and hooks no tool call. Its hook on model requests passes every request through unchanged.

## Where the data is kept

| Data | Kept in | Lifetime |
|---|---|---|
| The request list (the newest 1000), the running totals, the day split | The session's plugin state | The session. It survives `/reload-plugins` and a change of settings |
| Per-session totals, split by day | The plugin's local store inside Claude Code | Days older than *History days* are pruned; a session is removed once it has no day left |
| The Stats profile | The session's plugin state | The session. It is not saved to history |

`/clear` saves the ending session's totals to history and starts the list over.

## Deleting it

| To delete | Do |
|---|---|
| This session's data and its history entry | `/session-cost reset` |
| Old history | Lower *History days*; older days are pruned |
| Everything | Uninstall the mod; see [Update and remove](update-remove.md) |

## What the installer adds to this picture

The installer runs `claude plugin` commands and reads their output: the list of your marketplaces and the list of your installed plugins. It keeps nothing. Adding the marketplace clones a public repository from GitHub, which GitHub can see like any other clone.
