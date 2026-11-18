# Settings

The options are in `/config`, under the plugin. They are stored in `pluginConfigs["session-cost"].options`. A change reloads the mod with the new values; the session's data survives the reload.

| Option | Field | Default | Meaning |
|---|---|---|---|
| Open pane at start | `autoOpen` | off | Open the pane by itself when a session starts |
| Cost status line | `statusLine` | on | Show `$… · n req · … tok` under the prompt |
| Cost chip above the prompt | `band` | on | Show the one-line chip above the prompt. The keyboard toggle needs it |
| Toggle key action | `toggleAction` | `app:toggleReplTab` | The engine action the chip's button borrows for the [keyboard toggle](commands.md#a-keyboard-toggle) |
| History days | `historyDays` | 30 | How many days of per-session, per-day totals to keep for the History view |
| Cache TTL split | `cacheTtlSplit` | off | Tell 1-hour from 5-minute cache writes per request |
| Stats tab | `stats` | off | Gather the session's usage profile and show the Stats view |

## The two options that are off by default

Both add something the mod otherwise does not do, which is why you have to ask for them.

**Cache TTL split.** Claude Code's hooks report only the total of cache-write tokens. To tell the 1-hour from the 5-minute writes, the mod reads the usage numbers in the session's transcript files after each request that wrote to the cache. This is the only case in which the mod reads a file that holds your conversation, and it takes only the token counts from it; see [Data and privacy](data-privacy.md). A transcript over 4 MiB cannot be read, which is a limit of the mod API, so a long session shows the plain `cw` count again from that point.

**Stats tab.** Off, nothing is gathered and the tab is hidden. On, the profile covers requests from the moment it was turned on. `/session-cost reset` clears it.

## Setting options at install time

The `claude` command line can set an option while installing:

```bash
claude plugin install session-cost@km-plugin-registry --config stats=true --config cacheTtlSplit=true
```

The installer skill does not pass options; it installs with the defaults and points you here.

## Suggested setups

| You want | Set |
|---|---|
| Only a discreet total | Leave the defaults; never open the pane |
| The pane always there | *Open pane at start* on |
| No extra line above the prompt | *Cost chip above the prompt* off. The keyboard toggle stops working |
| To understand your cache spend | *Cache TTL split* on and *Stats tab* on |
| A longer memory | *History days* at 90 |
