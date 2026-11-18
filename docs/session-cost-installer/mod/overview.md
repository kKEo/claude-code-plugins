# What the mod does

`session-cost` is a Claude Code *mod*: a small TypeScript module that draws into the Claude Code interface instead of adding skills or agents. It records every model request the session sends and shows its tokens and cost in a pane beside the chat. It collects the whole time, whether the pane is open or closed.

![Workflow of session-cost: a model request ends, the mod records its tokens, costs it and adds it to the totals](../images/workflow-session-cost.svg)

## What a "model request" is

Each time Claude Code calls a model, that is one request. A single prompt of yours usually causes several: one per step of the turn, one for each step a subagent takes, and now and then one that compacts the conversation. `/cost` shows you only the running total. The mod shows the requests behind it, one row each.

## Where it shows up

| Place | What you see |
|---|---|
| The pane beside the chat | A header with the session totals, and one of four views below it |
| The status line under the prompt | `$0.544 · 3 req · 130k tok` |
| The chip above the prompt | The same summary and a `usage` button that toggles the pane |

The status line and the chip can each be switched off; see [Settings](settings.md).

## The header

The header is the same on every view. It sums the session:

- the cost as `/cost` reports it, and the price-table estimate beside it;
- the number of requests, and how many were main, subagent and compaction requests;
- token totals: input, output, cache read and cache write. With the *Cache TTL split* option on, `(1h …)` after the write total says how much of it used the one-hour cache lifetime;
- the cache hit rate;
- the installed version of the mod, dim, as `v0.6.0`.

## The four views

| Key | View | Shows |
|---|---|---|
| `r` | Requests | One entry per request, newest first |
| `m` | Models | Requests, tokens, cache hit rate and both costs per model |
| `h` | History | This session, today, the last 7 days, the last 30 days, a row per day and the 10 most recent sessions |
| `s` | Stats | A usage profile of the session. Only with the *Stats tab* option on |

[The four views](views.md) describes every column.

## How it works

![How session-cost works: when a model request ends the mod records it, costs it from the /cost total and list prices, adds it to the totals, saves them in the plugin store and draws the pane, the status line and the chip](../images/how-session-cost.svg)

The numbers match the picture.

1. **Record it.** A hook passes every model request through unchanged. When the response ends, the mod notes metadata only: the model, the effort, where the request came from, how long it took, the stop reason, the names of the tools called and the four token counts.
2. **Cost it.** The request gets its share of the increase in the `/cost` total, and an estimate from list prices. [How cost is counted](cost.md) explains both.
3. **Add it up** into totals per session, per model and per calendar day. The totals are saved in the plugin's local store and drawn in the pane, the status line and the chip.

## What it does not do

- It does not read prompts, responses, tool inputs or tool results.
- It makes no network request of any kind.
- It starts no process, runs no shell command, calls no tool, agent or model, and hooks no tool call.
- It does not change a request or a response.

[Data and privacy](data-privacy.md) has the full account.

## Limits worth knowing

- The pane draws the newest 300 requests; the totals count all of them.
- The session keeps the newest 1000 rows. Totals go on counting past that.
- Spend from before the mod was loaded cannot be given to a request. The header lists it as `unattributed`.
- The estimate uses a built-in table of list prices. It cannot see fast mode, partner pricing or a price that changed after the table was written.
