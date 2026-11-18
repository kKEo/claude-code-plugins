# Update and remove

## Updating

The mod does not check for updates itself. Either ask the installer:

```
update plan-progress to the incubator version
```

or type the two commands it would run:

```
/plugin marketplace update km-plugin-registry
/plugin update plan-progress@km-plugin-registry
```

Then `/reload-plugins`, or start a new session.

## Switching it off for a while

```bash
claude plugin disable plan-progress@km-plugin-registry
claude plugin enable plan-progress@km-plugin-registry
```

Disabled, the mod adds no tool and no note to the conversation. To keep it but hide it, switch off both options in [Settings](settings.md); it goes on following the plan.

## Removing

```bash
claude plugin uninstall plan-progress@km-plugin-registry
```

To remove the incubator marketplace as well, when you use no other plugin from it:

```bash
claude plugin marketplace remove km-plugin-registry
```

The mod leaves nothing behind. Your plan files under `~/.claude/plans/` belong to Claude Code and are not touched.

## One copy at a time

plan-progress is published in the incubator only. If it is released to `km-plugins` one day, `plan-progress@km-plugins` and `plan-progress@km-plugin-registry` will be two separate plugins to Claude Code. Enable one of them: with both on you would get two panes, two status lines and two `mark_step` tools. The installer already refuses to install the incubator copy while a released one is enabled.
