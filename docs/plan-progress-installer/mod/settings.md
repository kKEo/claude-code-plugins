# Settings

Two switches, in `/config` under the plugin. They are stored in `pluginConfigs["plan-progress"].options`. A change reloads the mod with the new values.

| Option | Field | Default | Meaning |
|---|---|---|---|
| Open pane at start | `autoOpen` | on | Open the pane by itself when a session starts. Off, the pane opens only with `/plan-progress` |
| Plan status line | `statusLine` | on | Show the `plan 3/5 ✓ · …` summary under the prompt |

## When the pane opens by itself

With *Open pane at start* on, the pane opens at the start of an interactive session in a fullscreen terminal wide enough to dock it. In a narrow terminal, or in a headless session, it does not open; the mod still follows the plan, and the status line still shows the summary.

## Setting options at install time

The `claude` command line can set an option while installing:

```bash
claude plugin install plan-progress@km-plugin-registry --config autoOpen=false
```

The installer skill does not pass options; it installs with the defaults and points you here.

## Suggested setups

| You want | Set |
|---|---|
| The plan always in view | Leave the defaults |
| The pane only when you ask | *Open pane at start* off; type `/plan-progress` when you want it |
| Only the one-line summary | *Open pane at start* off, *Plan status line* on |
| Nothing drawn until you ask | Both off. The mod still follows the plan, so `/plan-progress` shows it at once |
