# Glossary

| Term | Meaning |
|---|---|
| Checkbox | A bullet written `- [ ]` or `- [x]` in the plan. When a plan has any, only they are counted |
| Current item | The task, todo or step being worked on now, shown above the views |
| `ExitPlanMode` | The tool Claude calls to present a plan for your approval |
| Incubator | The repository `kKEo/claude-code-plugins-incubator`, where plugins are developed. Its marketplace is `km-plugin-registry` |
| Mark | The state Claude gave a step through `mark_step`. Kept by the step's text |
| `mark_step` | The mod's tool, `mcp__plan-progress__mark_step`, through which Claude reports which steps it started or finished |
| Marketplace | A repository with a `.claude-plugin/marketplace.json` that lists plugins Claude Code can install |
| Mod | A plugin that is a TypeScript hooks module drawing into the Claude Code interface: panes, status lines, commands, tools |
| Outline | The plan's phases and steps with their ids, as the mod gives it to Claude |
| Pane | A panel docked beside the chat |
| Phase | A unit of work in the plan, opened by a heading |
| Plan file | The markdown file Claude writes in plan mode, under `~/.claude/plans/` |
| Plan mode | The Claude Code mode in which Claude plans and changes nothing until you approve |
| Plugin id | `name@marketplace`, for example `plan-progress@km-plugin-registry` |
| Scope | Where an installation is recorded: `user`, `project` or `local` |
| Skill | A set of instructions in a `SKILL.md` that Claude follows when a request matches its description |
| Status line | The line under the prompt |
| Step | A bullet at the outermost indent of a phase. Its id is `phase.step`, such as `2.3` |
| Task | An item Claude tracks with `TaskCreate` and `TaskUpdate` |
| Todo | An item Claude tracks with `TodoWrite` |
