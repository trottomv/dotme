.DEFAULT_GOAL := help

.PHONY: build
build:  ## Build public static files
	zola --config config.develop.toml build --output-dir docs

.PHONY: check
check:  ## Check zola configuration
	zola check

.PHONY: docker_build
docker_build:  ## Build public static files with docker
	docker run --rm -u "$(id -u):$(id -g)" -v $PWD:/app --workdir /app ghcr.io/getzola/zola:v0.17.1 build --force --output-dir docs

.PHONY: precommit
precommit:  ## Fix code formatting and linting
	pre-commit run --all-files

.PHONY: precommit_update
precommit_update:  ## Update pre_commit
	pre-commit autoupdate

.PHONY: run
run:  ## Run zola run server
	zola serve

.PHONY: help
help:
	@echo "[Help] Makefile list commands:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
