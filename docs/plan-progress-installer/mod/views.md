# The two views

Press `g` or `p` while the pane holds the keyboard (`ctrl+x tab` moves the keyboard to the pane), or open the pane on a view with `/plan-progress progress` or `/plan-progress plan`.

## Above both views

- **A progress bar** with the share of done items, such as `███████░░░░░ 60%`, and the count of done items.
- **The current item**: the task or todo that is in progress, or else the step Claude marked as started.
- **The plan's file name.**

## Progress (`g`)

The plan as a tree of phases and steps, roughly like this:

```
1. Setup
  ✓ 1.1 Create the migration
  ✓ 1.2 Add the model
2. API
  ▶ 2.1 Add the endpoint
  · 2.2 Validate the input
3. Tests
  · 3.1 Cover the endpoint
```

| Part | Meaning |
|---|---|
| Phase title | A heading of the plan that opens a unit of work |
| Step id | `2.3` is the third step of phase 2. Claude uses the same ids when it reports progress |
| `✓` | Done |
| `▶` | In progress |
| `·` | Pending |

**Tasks that match no step.** Claude often creates tasks whose wording differs from the plan's. The mod pairs each task or todo with the plan step whose text is most alike. One that resembles no step is listed below the tree, so nothing Claude is tracking is hidden.

## Plan (`p`)

The plan's markdown as Claude wrote it, including the sections the Progress view leaves out: context, risks, verification notes. Use it to re-read what was agreed without scrolling the chat.

## When the pane is empty

No plan is known yet. Either plan in plan mode, or type `/plan-progress`, which loads the newest `*.md` under `~/.claude/plans/` when no plan is known, or name a file with `/plan-progress <path>`.

## When the plan changes

The mod re-reads the plan file whenever Claude edits it. Marks are kept by step text, not by position, so adding a step or reordering phases keeps what was already ticked. Rewording a step loses its mark, since it is a different step as far as the mod can tell. Loading a different plan file clears all marks.
