# The four views

Press the key in the left column while the pane holds the keyboard (`ctrl+x tab` moves the keyboard to the pane), or open the pane on a view with `/session-cost requests|models|history|stats`.

## Requests (`r`)

One entry per request, newest first. A dim row such as `── Sat 07 Nov ──` marks where the day changes.

| Part | Meaning |
|---|---|
| Time | When the response ended |
| Model | The model's short name, then the effort the request asked for, dim: `opus-5-5 high`. Models without effort, and compactions, show none |
| Kind | `main` for the conversation, `sub:<agent>` for a subagent, `compact` for a compaction |
| Duration | Written flush right on a 7-cell bar. The bar is filled in proportion to the slowest request drawn, and the slowest one is highlighted |
| Stop reason | Why the response ended. A request that called tools shows them instead of `tool_use`: `→ Read ×3, Bash`. MCP tools appear by their short name |
| `in`, `out` | Input and output tokens |
| `cr` | Cache-read tokens, in green: five steps from light to vivid by the share of the request's prompt that was read from the cache |
| `cw` | Cache-write tokens, in red, on the same five-step scale. A zero count is dim. With *Cache TTL split* on, a dim `1h`, `5m` or `1h 8k+5m 4k` says which cache lifetime the write used |
| Cost | Two figures: the request's share of the `/cost` ledger and the estimate, `$0.020 / est $0.029`. A share marked `~` was split between overlapping requests |

**How to read it.** A long green `cr` and a small red `cw` is a request that reused the cache: cheap. A large red `cw` with little `cr` is a request that wrote the cache anew, usually after a pause longer than the cache lifetime or after the prompt changed near its start: expensive. A run of `sub:` rows is a subagent at work.

## Models (`m`)

One row per model with the number of requests, the token totals, the cache hit rate and both costs. Use it to see how much of a session's spend went to a smaller model used by subagents and how much to the main one.

## History (`h`)

Four windows, then two lists:

| Section | Shows |
|---|---|
| This session | The session's totals |
| Today, last 7 days, last *N* days | Spend in each window. *N* is the *History days* option, 30 by default |
| By day | One row per day with spend in the last *N* days, newest first: this session's cost and requests beside the cost of all sessions and how many had spend that day. A session open across several days says how many it spans |
| Recent sessions | The 10 most recent sessions |

The windows are calendar days and count only the part of each session spent in them. A session left open from Monday to Wednesday is counted on each of the three days for what it spent that day; see [How days are counted](cost.md#how-days-are-counted).

## Stats (`s`)

Hidden unless the *Stats tab* option is on. When it is on, the mod gathers a usage profile of the session from that moment; requests from before are not in it.

**Cost breakdown.** The estimate split into input, output, cache read, 5-minute writes, 1-hour writes and writes of unknown lifetime, each with its share of the whole.

**Cache TTL.** One-hour, 5-minute and unknown write tokens, the cache hit rate overall and per kind of request, and the *1-hour premium*: 1-hour write tokens multiplied by the difference between the 1-hour and the 5-minute write price. It is what the longer lifetime cost you.

**Idle gaps.** Gaps on the main thread, measured from the start of one request to the start of the next, in three bands: under 5 minutes, 5 to 60 minutes, over 60 minutes. Below them:

- gaps a 1-hour write kept warm, with `saved ~`: the next request's cache read priced as a 5-minute re-write, minus the read;
- gaps after a 5-minute write;
- misses seen: a gap past the lifetime followed by a request that read under 10% of its prompt from the cache;
- `1h net`: saved minus premium. Positive means the 1-hour cache paid for itself in this session.

These are estimates. They assume that what one request wrote is what the next one reads.

**Requests.** The count by kind, average tokens per request, duration at the median, the 90th percentile and the maximum (over the newest 2000), the top models by estimate and the top tools.

Without *Cache TTL split*, every write counts as unknown and the TTL figures stay empty. Turn both options on to use this view fully.
