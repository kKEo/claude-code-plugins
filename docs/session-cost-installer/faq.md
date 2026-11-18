# FAQ

## The installer

**Why install a plugin to install a plugin?**
You do not have to. `/plugin install session-cost@km-plugin-registry` works once the incubator marketplace is added. The installer is for the cases where Claude does the setup, and for the checks it makes on the way: a stale marketplace, a marketplace name that points at a fork, a second enabled copy.

**Does it install anything besides session-cost?**
No. Its steps name that one plugin and that one marketplace, and Claude Code shows you each command before it runs, so you can decline anything else.

**Why do I still have to type `/reload-plugins`?**
A skill cannot type slash commands. The mod is on disk after the install and is loaded into the session by the reload.

**Can I remove the installer afterwards?**
Yes. `claude plugin uninstall session-cost-installer@km-plugins` leaves the mod in place.

## The mod

**Does it slow the session down?**
It adds no model request and no network call. It notes a few numbers when a response ends.

**Why are there two costs on each row?**
One is the request's share of the `/cost` total, the other an estimate from list prices. See [How cost is counted](mod/cost.md).

**The costs in the pane do not add up to `/cost`.**
The ledger shares plus `unattributed` in the header do. `unattributed` is spend from before the mod loaded, or spend outside model requests.

**What does `~` before a cost mean?**
The request overlapped with others, usually parallel subagents, and the increase in `/cost` was split between them in proportion to their estimates.

**What does `est ?` mean?**
The model is not in the mod's price table. The ledger share is still right.

**Does it read my prompts or my code?**
No. It records token counts, model names, times and tool names. With *Cache TTL split* on it also reads token counts from the session's transcript files and keeps only those. See [Data and privacy](mod/data-privacy.md).

**Does it send anything anywhere?**
No. It makes no network request.

**Where did the Days and Version views go?**
Days is now the *By day* section of History; `/session-cost days` opens History. The Version view and its update check were removed; the installed version is shown in the header.

**Why is the Stats tab missing?**
It is off by default. Turn on *Stats tab* in the mod's options.

**Why are the cache TTL figures empty?**
*Cache TTL split* is off, or the transcript has grown past 4 MiB and can no longer be read.

**I see two panes.**
Two copies of the mod are enabled, one from each marketplace. Disable one; see [Update and remove](mod/update-remove.md).

**The keyboard shortcut does nothing.**
It needs the chip to be on, a chord bound to the *Toggle key action* in `~/.claude/keybindings.json`, and no dialog open. See [Commands and keyboard](mod/commands.md).
