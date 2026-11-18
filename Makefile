# Documentation targets. One book per plugin lives in docs/<plugin>/; docs/index.html is the landing page.

BOOKS  := $(patsubst docs/%/book.toml,%,$(wildcard docs/*/book.toml))
BOOK   ?= session-cost-installer
MDBOOK ?= mdbook
PORT   ?= 8000

.PHONY: check docs docs-check docs-build docs-serve docs-site docs-clean

## Check the marketplace manifest and the plugin folders.
check:
	scripts/check-marketplace

## Check the docs against the marketplace, then build every book.
docs: docs-check docs-build

## Every plugin has a book, every book is on the landing page, every link resolves.
docs-check:
	scripts/docs-check

## Build every book into site/<plugin>/ and copy the landing page to the site root.
docs-build:
	@command -v $(MDBOOK) >/dev/null || { echo "mdbook not found; install it or set MDBOOK=/path/to/mdbook" >&2; exit 1; }
	@for b in $(BOOKS); do $(MDBOOK) build docs/$$b || exit 1; done
	@cp docs/index.html site/index.html && touch site/.nojekyll
	@echo "site built in site/ ($(BOOKS))"

## Serve one book locally with live reload: make docs-serve BOOK=plan-progress-installer
docs-serve:
	$(MDBOOK) serve docs/$(BOOK) --open

## Build everything and serve the whole site from the landing page: make docs-site PORT=8080
docs-site: docs-build
	@echo "serving site/ at http://localhost:$(PORT)/ (Ctrl+C to stop)"
	@python3 -m http.server $(PORT) --bind 127.0.0.1 --directory site

docs-clean:
	rm -rf site
