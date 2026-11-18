# Glossary

| Term | Meaning |
|---|---|
| Cache hit rate | The share of prompt tokens that were read from the prompt cache instead of being sent as new input |
| Cache read (`cr`) | Prompt tokens served from the cache. The cheapest kind of token |
| Cache write (`cw`) | Prompt tokens stored in the cache for later requests. Dearer than plain input |
| Cache lifetime (TTL) | How long a cache write stays usable: 5 minutes or 1 hour. The longer one costs more to write |
| Chip | The one-line entry the mod draws above the prompt, with the summary and a button |
| Compaction | A request in which Claude Code summarises a long conversation to make room |
| Estimate | A request's cost worked out from its token counts and list prices |
| Incubator | The repository `kKEo/claude-code-plugins-incubator`, where plugins are developed. Its marketplace is `km-plugin-registry` |
| Ledger | The running session total that `/cost` reports. A request's *ledger share* is its part of that total |
| Marketplace | A repository with a `.claude-plugin/marketplace.json` that lists plugins Claude Code can install |
| Mod | A plugin that is a TypeScript hooks module drawing into the Claude Code interface: panes, status lines, chips, commands |
| Model request | One call from Claude Code to a model. One prompt usually causes several |
| Pane | A panel docked beside the chat |
| Plugin id | `name@marketplace`, for example `session-cost@km-plugin-registry` |
| Plugin store | Local storage Claude Code gives a plugin, kept across sessions |
| Scope | Where an installation is recorded: `user`, `project` or `local` |
| Skill | A set of instructions in a `SKILL.md` that Claude follows when a request matches its description |
| Status line | The line under the prompt |
| Subagent | An agent Claude starts for part of a task. Its requests appear as `sub:<agent>` |
| Unattributed | Spend in the `/cost` total that the mod could not give to a request |
