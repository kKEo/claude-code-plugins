# Update and remove

## Updating

The mod does not check for updates itself. Either ask the installer:

```
update session-cost to the incubator version
```

or type the two commands it would run:

```
/plugin marketplace update km-plugin-registry
/plugin update session-cost@km-plugin-registry
```

Then `/reload-plugins`, or start a new session. The header of the pane shows the version that is running, `v0.6.0`, so you can see that the update took.

A session that was already running when a new version loads has its per-day split rebuilt from the rows it kept.

## Switching it off for a while

```bash
claude plugin disable session-cost@km-plugin-registry
claude plugin enable session-cost@km-plugin-registry
```

To keep the mod but hide it, switch off *Cost status line* and *Cost chip above the prompt* in its options and leave the pane closed. It goes on recording.

## Removing

```bash
claude plugin uninstall session-cost@km-plugin-registry
```

To remove the incubator marketplace as well, when you use no other plugin from it:

```bash
claude plugin marketplace remove km-plugin-registry
```

## The released copy and the incubator copy

session-cost exists in two marketplaces, and Claude Code treats the two as separate plugins:

| Id | From | Changes |
|---|---|---|
| `session-cost@km-plugin-registry` | the incubator | with every commit to its `master` |
| `session-cost@km-plugins` | the released marketplace, when it is published there | only when a version is promoted |

Enable one of them. With both on you get two panes, two status lines and two chips, each counting the same requests. The installer refuses to install the incubator copy while the released one is enabled, for that reason.

To move from one to the other:

```bash
claude plugin disable session-cost@km-plugins
```

then ask the installer for the incubator copy.
