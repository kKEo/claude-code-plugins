# How cost is counted

Every request shows two dollar figures. They come from different sources and answer different questions.

| Figure | Source | Answers |
|---|---|---|
| Ledger share | The session total that `/cost` reports | What did Claude Code say this cost? |
| Estimate (`est`) | The token counts multiplied by list prices | What should this have cost at list price? |

## The ledger share

Claude Code reports dollars only as one running total for the session, the `/cost` ledger. It does not say what each request cost. The mod works that out:

1. When a request's response ends and no other request is still running, the mod reads the total.
2. The increase since the last reading becomes that request's cost.

So the ledger column always adds up to `/cost`.

**Overlapping requests.** Parallel subagents run requests at the same time, and the total cannot be read between them. When they have all ended, the increase is split between them in proportion to their estimates. Those shares are marked `~`.

**Unattributed spend.** Some spend belongs to no request the mod saw:

- spend from before the mod was loaded;
- spend Claude Code makes outside model requests, such as generating a title or running a classifier.

The header shows it as `unattributed`, so the figures still add up to `/cost`.

## The estimate

The estimate prices the four token counts with a table of Anthropic first-party list prices built into the mod (`hooks/pricing.ts`). Cache reads are cheap, input is the base price, and cache writes cost more than input: 1.25 times for the 5-minute lifetime and 2 times for the 1-hour lifetime.

The estimate cannot see:

- fast mode;
- partner pricing (Bedrock, Vertex);
- Haiku 5.5's higher rate for prompts over 100K tokens ($0.50 and $2.50 per million instead of $0.10 and $0.50);
- prices that changed after the table was written.

A model the table does not know shows `?`.

**Cache writes.** Claude Code's hooks report only the total of cache-write tokens, not how many used each lifetime. Unless told otherwise the mod prices all of them at the 5-minute rate. With the *Cache TTL split* option on, and when the split for the request was found, 1-hour writes are priced at twice the input price.

## When the two figures differ

| What you see | Likely reason |
|---|---|
| Ledger a little above the estimate, on every request | 1-hour cache writes priced at the 5-minute rate. Turn *Cache TTL split* on |
| Ledger well above the estimate | Fast mode, or a price the table does not have |
| Ledger well below the estimate | Partner or discounted pricing |
| `~` shares that look odd one by one | Overlapping requests. Their sum is right; the split is proportional |
| `est ?` | A model missing from the price table |

When they disagree, the ledger is what Claude Code counted. The estimate is a cross-check.

## How days are counted

A request counts on the local calendar day its response ended, so one session can spread over several days.

- A ledger share follows its request's day.
- Growth of `/cost` read while no request was waiting counts on the day it was read.
- Spend from before the mod was loaded is in no day.
- A session that was already running when this version of the mod loaded has its days rebuilt from the rows it kept, with anything past the 1000-row cap put on the earliest day.
- Sessions saved by an older version of the mod count whole on the day of their last request.

## A worked example

The figures are made up to show the mechanism. You send one prompt; Claude reads three files and answers.

| # | Request | `/cost` after | Ledger share | Estimate |
|---|---|---|---|---|
| 1 | main, calls Read ×3 | $0.031 | $0.031 | $0.029 |
| 2 | main, final answer | $0.048 | $0.017 | $0.017 |

The header shows `$0.048`, two requests. Suppose request 1 wrote the conversation into the cache with the 1-hour lifetime; the estimate priced that write at the 5-minute rate, which is why it is two tenths of a cent under the ledger. Request 2 read it back from the cache and both figures agree.
