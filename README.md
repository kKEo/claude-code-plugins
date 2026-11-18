# Claude Code Plugins

A Claude Code plugin marketplace (`km-plugins`). The manifest `.claude-plugin/marketplace.json` lists the plugins; each plugin lives under `plugins/<name>/`.

## Plugins

| Plugin | What it does |
|---|---|
| [session-cost-installer](plugins/session-cost-installer/) | A skill that installs or updates the session-cost mod from the `kKEo/claude-code-plugins-incubator` marketplace, adding that marketplace first when it is missing |
| [plan-progress-installer](plugins/plan-progress-installer/) | The same for the plan-progress mod, the pane showing the current plan and its progress |

## Install

```
/plugin marketplace add kKEo/claude-code-plugins
/plugin install session-cost-installer@km-plugins
/plugin install plan-progress-installer@km-plugins
/reload-plugins
```

Then ask Claude to "install session-cost" or "install plan-progress", or type `/session-cost-installer:install-session-cost` or `/plan-progress-installer:install-plan-progress`.

## Documentation

Every plugin has a book that describes the installer and the mod it installs. The books are published with a landing page at [kkeo.github.io/claude-code-plugins](https://kkeo.github.io/claude-code-plugins/).

| Book | Source |
|---|---|
| session-cost-installer and the session-cost mod | [docs/session-cost-installer/](docs/session-cost-installer/README.md) |
| plan-progress-installer and the plan-progress mod | [docs/plan-progress-installer/](docs/plan-progress-installer/README.md) |

Each book is a GitBook space (`.gitbook.yaml`, `SUMMARY.md`) that mdBook also builds (`book.toml`). `docs/index.html` is the landing page.

```bash
make docs-check                          # a book per plugin, landing page links, relative links
make docs                                # docs-check, then build every book into site/ (needs mdbook)
make docs-serve BOOK=plan-progress-installer   # one book with live reload
make docs-site                           # build, then serve the whole site at http://localhost:8000/
```

`.github/workflows/docs.yml` builds the site on every pull request and deploys it to GitHub Pages on a push to `master`. Set Settings → Pages → Source to "GitHub Actions" once.

## Checks

`make check` runs `scripts/check-marketplace`, which verifies the manifest and every plugin folder; CI runs it on each push and pull request.

## License

MIT. Each plugin carries its own LICENSE.
