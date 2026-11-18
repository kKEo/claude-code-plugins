# Commands and keyboard

## The slash command

```
/session-cost                                  toggle the pane
/session-cost on|off                           open or close it explicitly
/session-cost requests|models|history|stats    open it on that view
/session-cost reset                            clear this session's data
```

| Argument | Effect |
|---|---|
| none, `toggle` | Opens the pane when closed, closes it when open |
| `on`, `open`, `show` | Opens it |
| `off`, `close`, `hide` | Closes it |
| `requests`, `models`, `history` | Opens it on that view |
| `stats` | Opens it on the Stats view. Needs the *Stats tab* option |
| `days` | Opens History. The separate Days view of earlier versions is now a section of it |
| `reset` | Clears this session's requests, totals and day split, and deletes the history entry saved for the session |
| anything else | Replies "Unknown argument" and does nothing |

The command reads its argument against that fixed list. It runs nothing else.

**After a reset.** The session's history counts only spend since the reset. The header, the chip and the status line keep showing the full `/cost` total, because that is Claude Code's figure and the mod cannot reset it; the header lists the part from before the reset as `unattributed`.

## In the pane

| Key | Effect |
|---|---|
| `r`, `m`, `h`, `s` | Switch to Requests, Models, History, Stats |
| `ctrl+x tab` | Move the keyboard between the chat and the pane |
| `ctrl+x x` | Close the pane, while it holds the keyboard |

The pane's own close mark closes it too.

## A keyboard toggle

A mod cannot register a global shortcut, and `keybindings.json` cannot run a slash command. The mod goes round that: the chip's button is tied to an engine keybinding action that has no key by default, `app:toggleReplTab`. Bind a chord to that action and the chord presses the button.

In `~/.claude/keybindings.json`:

```json
{
  "$schema": "https://www.schemastore.org/claude-code-keybindings.json",
  "$docs": "https://code.claude.com/docs/en/keybindings",
  "bindings": [
    { "context": "Global", "bindings": { "ctrl+x c": "app:toggleReplTab" } }
  ]
}
```

The chord works while:

- the chip is on (the *Cost chip above the prompt* option), even with the band collapsed. While you collapse the band the mod drops the cost text and keeps only the button, so the shortcut still works;
- no dialog is up.

If `app:toggleReplTab` already does something in your setup, pick another action under *Toggle key action* in the mod's options and bind that one instead. The choices are `app:toggleReplTab`, `app:toggleDiffNoiseFilter`, `app:toggleDiffPreSession` and `app:redraw`.
