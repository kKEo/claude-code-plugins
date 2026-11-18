# FAQ

## The installer

**Why install a plugin to install a plugin?**
You do not have to. `/plugin install plan-progress@km-plugin-registry` works once the incubator marketplace is added. The installer is for the cases where Claude does the setup, and for the checks it makes on the way: a stale marketplace, a marketplace name that points at a fork, a second enabled copy.

**Does it install anything besides plan-progress?**
No. Its steps name that one plugin and that one marketplace, and Claude Code shows you each command before it runs, so you can decline anything else.

**Why do I still have to type `/reload-plugins`?**
A skill cannot type slash commands. The mod is on disk after the install and is loaded into the session by the reload.

**Can I remove the installer afterwards?**
Yes. `claude plugin uninstall plan-progress-installer@km-plugins` leaves the mod in place.

## The mod

**The pane is empty.**
No plan is known. Plan in plan mode, type `/plan-progress` to load the newest plan under `~/.claude/plans/`, or name a file with `/plan-progress <path>`.

**The bar stays at 0%.**
Nothing is reporting progress: the session has no tasks or todos and Claude is not calling `mark_step`. Ask Claude to mark the plan steps as it goes. See [Where progress comes from](mod/progress.md).

**Why did the total change from 8 to 5?**
The source changed. With no tasks the mod counts the plan's 8 steps; once Claude created 5 tasks it counts those.

**Does it work without plan mode?**
Yes. `/plan-progress <path>` loads any markdown file and splits it the same way.

**Can I tick a step myself?**
Not with a key. Ask Claude, "mark step 2.1 as done", or tick the checkbox in the plan file if the plan uses checkboxes.

**Some sections of my plan are missing from the Progress view.**
Sections such as Context, Risks or Verification are not phases. They are still in the Plan view. See [How a plan is split](mod/plan-format.md).

**A step lost its tick after Claude edited the plan.**
Marks are kept by step text. A reworded step is a new step.

**Does it cost tokens?**
A little. The tool's definition and, once per approved plan, a note with the outline are added to the conversation, and each `mark_step` call is a short tool call. With the mod disabled none of this is added.

**Does it change my plan file?**
No. It only reads it.

**Does it send anything anywhere?**
No. It makes no network request and writes nothing to disk.

**The pane did not open by itself.**
The terminal is not fullscreen or not wide enough to dock a pane, or *Open pane at start* is off. `/plan-progress on` opens it.

**Claude asks permission for `mark_step` every time.**
Choose to allow the tool for the session, or always, the first time it asks.
