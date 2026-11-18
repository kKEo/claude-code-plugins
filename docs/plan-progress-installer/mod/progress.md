# Where progress comes from

A step in the pane is done when something says so. The mod listens to three sources and uses the first that has anything to say.

## The three sources

| Order | Source | How Claude produces it |
|---|---|---|
| 1 | The session's tasks | `TaskCreate`, `TaskUpdate`, `TaskList` |
| 2 | The session's todos | `TodoWrite` |
| 3 | The plan's own steps | Checkboxes in the plan file, and the mod's `mark_step` tool |

First match wins. If the session has tasks, the bar counts tasks. If it has none but has todos, it counts todos. Otherwise it counts plan steps: the checkboxes when the plan has any, else every step.

## Tasks and todos

The mod watches the calls Claude makes to its task and todo tools and keeps a copy of the list. It does not call those tools itself.

Each task or todo is paired with the plan step whose text is most alike, and passes its state on to that step. That is how a task called "Write endpoint tests" ticks the step "3.1 Cover the endpoint". Items that resemble no step are listed below the tree.

## The `mark_step` tool

Some sessions have no task or todo tools, or Claude simply does not use them for a short plan. Without another source the bar would stay at 0%. So the mod registers a tool of its own:

```
mcp__plan-progress__mark_step
  steps:  ["2"]        all of phase 2
          ["2.3"]      one step
          ["Add the endpoint"]   a step by its text
  status: in_progress | completed | pending
```

Called with an empty `steps` list, it returns the plan's outline with the ids.

**How Claude learns to use it.** When you approve a plan with `ExitPlanMode`, the mod adds a note to the conversation: the outline of the plan with its step ids, and a request to mark each phase or step when it is started and again when it is finished. The tool's description says the same.

**What you will see.** Short `mark_step` calls between Claude's other tool calls, and the glyphs in the pane changing as they arrive.

## The current item

The line above the views names what is being worked on. It is the task or todo that is in progress, in its active wording when it has one ("Running tests"), or else the step Claude marked `in_progress`.

## The percentage

```
done  = counted items that are completed
total = counted items
```

*Counted items* are the tasks, or the todos, or the plan's checkboxes, or all the plan's steps, by the order above. Because the source can change during a session, so can the total: a plan of 8 steps shows `0/8` until Claude creates 5 tasks, and `0/5` after.

## When progress looks wrong

| What you see | Reason | What to do |
|---|---|---|
| The bar stays at 0% | No tasks, no todos, and Claude is not calling `mark_step` | Ask: "mark the plan steps as you go" |
| The total changed | The source changed, for example tasks appeared | Nothing; it now counts tasks |
| A finished step is still pending | The task that covered it was paired with another step, or with none | Ask Claude to mark step `2.3` completed |
| A step lost its tick after a plan edit | Its wording changed; marks are kept by text | Ask Claude to mark it again |
| Items listed below the tree | Tasks that resemble no step | Nothing; they are counted like the others |
| Everything was cleared | Another plan file was loaded | Expected; marks belong to one plan |
