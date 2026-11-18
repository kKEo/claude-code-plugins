# What the mod does

`plan-progress` is a Claude Code *mod*: a small TypeScript module that draws into the Claude Code interface instead of adding skills or agents. It keeps the current plan and its progress in a pane beside the chat, so that during a long piece of work you can see at a glance what was agreed, what is done and what Claude is doing now.

![Workflow of plan-progress: Claude writes a plan, the mod picks it up, Claude works and marks steps, and the mod shows progress](../images/workflow-plan-progress.svg)

## The problem it solves

In plan mode Claude writes a plan, you approve it, and the plan scrolls away. From then on the only trace of it is in the chat, mixed with tool calls. The mod keeps the plan in view and turns it into a checklist that fills in as the work goes on.

## Where it shows up

| Place | What you see |
|---|---|
| The pane beside the chat | A progress bar, the item being worked on, the plan's file name, and one of two views below |
| The status line under the prompt | `plan 3/5 ✓ · Running tests` |

The pane opens by itself in a fullscreen terminal wide enough to dock it. Both the automatic opening and the status line can be switched off; see [Settings](settings.md).

## The two views

| Key | View | Shows |
|---|---|---|
| `g` | Progress | The plan's phases and steps, each step with its id and a glyph: `✓` done, `▶` in progress, `·` pending |
| `p` | Plan | The plan's markdown itself |

[The two views](views.md) describes both.

## How it works

![How plan-progress works: Claude writes a plan file, the mod picks it up, Claude works through it with tasks, todos and the mark_step tool, and the mod works out each step state for the pane, the progress bar and the status line](../images/how-plan-progress.svg)

The numbers match the picture.

1. **Claude writes the plan** in plan mode: a markdown file under `~/.claude/plans/` with phases and steps.
2. **The mod picks it up.** It learns the file's path from the plan-mode reminders and from `ExitPlanMode`, reads the file and splits it into phases and steps. It reads it again whenever Claude edits it.
3. **Claude works through it,** creating tasks and todos, or ticking the plan's own checkboxes.
4. **Claude marks steps** through the mod's own tool, `mark_step`, when there are no tasks or todos to follow. When you approve a plan, the mod adds a note with the step outline and asks Claude to report on it.
5. **The mod works out each step's state** and draws it in the pane, the progress bar and the status line.

[Where progress comes from](progress.md) explains steps 3 to 5 in detail.

## What it adds to a session

| Addition | What it is |
|---|---|
| A pane, *Plan progress* | Drawn by the mod |
| A slash command, `/plan-progress` | Toggles the pane, switches the view, loads a plan file |
| A tool, `mcp__plan-progress__mark_step` | Claude calls it to say which steps it started or finished |
| A note after `ExitPlanMode` | The plan's outline with step ids, and a request to report progress on it |
| A status-line entry | The summary under the prompt |

The tool and the note are the two things that change what Claude sees. They cost some tokens: the outline once per approved plan, and a short tool call per step.

## What it does not do

- It does not change the plan file. It only reads it.
- It does not write anything to disk; its state lives in the session.
- It makes no network request.
- It does not judge whether a step was done well. A step is done when a task, a todo, a checkbox or Claude says so.
