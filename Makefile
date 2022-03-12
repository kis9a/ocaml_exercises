SOURCES := $(shell find . -name '*.ml')
PROFILE_PATH := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
PROFILE_NAME := $(shell basename $(PROFILE_PATH))

.PHONY: format
format: ## push all
	@$(foreach v, $(SOURCES), ocamlformat -i $(v);)
