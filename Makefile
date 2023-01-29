.DEFAULT_GOAL := help

.PHONY: build
build:  ## Build public static files
	zola build --output-dir docs

.PHONY: check
check:  ## Check zola configuration
	zola check

.PHONY: precommit
precommit:  ## Fix code formatting and linting
	pre-commit run --all-files

.PHONY: run
run:  ## Run zola run server
	zola serve

.PHONY: help
help:
	@echo "[Help] Makefile list commands:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
