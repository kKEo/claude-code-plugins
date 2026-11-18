# Commands and keyboard

## The slash command

```
/plan-progress            toggle the pane
/plan-progress on|off     open or close it explicitly
/plan-progress plan       open it on the plan view
/plan-progress progress   open it on the progress view
/plan-progress <path>     load a specific plan file
```

| Argument | Effect |
|---|---|
| none | Opens the pane when closed, closes it when open. Opening loads the newest `~/.claude/plans/*.md` when no plan is known |
| `on`, `open`, `show`, `toggle` | Opens it |
| `off`, `close`, `hide` | Closes it |
| `plan` | Opens it on the Plan view |
| `progress` | Opens it on the Progress view |
| anything else | Read as the path of a plan file to load |

**Loading a plan by hand.** `/plan-progress docs/plan.md` shows any markdown file as a plan, split by the rules on [How a plan is split](plan-format.md). This is how you use the pane for a plan that was not written in plan mode: a checklist in your repository, a migration runbook, a release list. Loading a different file clears the marks of the previous one.

## In the pane

| Key | Effect |
|---|---|
| `g` | Progress view |
| `p` | Plan view |
| `ctrl+x tab` | Move the keyboard between the chat and the pane |
| `ctrl+x x` | Close the pane, while it holds the keyboard |

The pane's own close mark closes it too.

## The tool Claude uses

`mcp__plan-progress__mark_step` is for Claude, not for you, but you can steer it in plain words:

```
mark step 2.1 as done
mark phase 3 as in progress
show me the plan outline
```

Depending on your permission settings, Claude Code may ask before Claude calls the tool, as for any tool; allowing it for the session, or always, stops the question. [Where progress comes from](progress.md) describes the tool.
