.PHONY: init notebook
.DEFAULT_GOAL := help

NAMESPACE := tomdewildt
NAME := stable-diffusion-experiment

help: ## Show this help
	@echo "${NAMESPACE}/${NAME}"
	@echo
	@fgrep -h "##" $(MAKEFILE_LIST) | \
	fgrep -v fgrep | sed -e 's/## */##/' | column -t -s##

##

init: ## Initialize the environment
	for f in requirements/*.txt; do \
		pip install -r "$$f"; \
	done

##

notebook: ## Run the notebook server
	jupyter lab
