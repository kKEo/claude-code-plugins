# Data and privacy

The mod writes nothing to disk and sends nothing anywhere. Its state lives in the session.

## What it reads

| It reads | When | Why |
|---|---|---|
| The plan file | When plan mode names it, when Claude edits it, and when you load one with `/plan-progress <path>` | To show it and split it into steps |
| The names of the files in `~/.claude/plans/` | When the pane is opened and no plan is known | To find the newest plan |
| The calls to `TaskCreate`, `TaskUpdate`, `TaskList` and `TodoWrite` | As Claude makes them | To follow the task and todo lists |
| The calls to `Write` and `Edit` | As Claude makes them | To notice that the plan file was edited and read it again. It passes every call through unchanged |
| The plan-mode reminders and the `ExitPlanMode` call | In plan mode | To learn the plan file's path |

It does not read your prompts or Claude's responses.

## What it changes in the conversation

Two things, both visible to you:

- **A tool**, `mcp__plan-progress__mark_step`, which Claude can call to report progress.
- **A note after `ExitPlanMode`**, holding the plan's outline with step ids and a request to report progress on it.

It changes no other tool call and no file.

## What it keeps

| Data | Kept in | Lifetime |
|---|---|---|
| The plan's path and text, the task and todo lists, the marks, the current view | The session's plugin state | The session |

Nothing is kept across sessions. There is no history and no store on disk.

## What it sends

Nothing. The mod makes no network request. There is no analytics and no telemetry.

## What it runs

Nothing. It starts no process and runs no shell command.

## What the installer adds to this picture

The installer runs `claude plugin` commands and reads their output: the list of your marketplaces and the list of your installed plugins. It keeps nothing. Adding the marketplace clones a public repository from GitHub, which GitHub can see like any other clone.
