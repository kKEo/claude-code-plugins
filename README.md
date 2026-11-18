# Claude Code Plugins

A Claude Code plugin marketplace (`km-plugins`). The manifest `.claude-plugin/marketplace.json` lists the plugins; each plugin lives under `plugins/<name>/`.

## Plugins

| Plugin | What it does |
|---|---|
| [session-cost-installer](plugins/session-cost-installer/) | A skill that installs or updates the session-cost mod from the `kKEo/claude-code-plugins-incubator` marketplace, adding that marketplace first when it is missing |

## Install

```
/plugin marketplace add kKEo/claude-code-plugins
/plugin install session-cost-installer@km-plugins
/reload-plugins
```

Then ask Claude to "install session-cost", or type `/session-cost-installer:install-session-cost`.

## Checks

`scripts/check-marketplace` verifies the manifest and every plugin folder; CI runs it on each push and pull request.

## License

MIT. Each plugin carries its own LICENSE.
