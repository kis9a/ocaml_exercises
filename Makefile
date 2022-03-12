SOURCES := $(shell find . -name '*.ml')
PROFILE_PATH := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
PROFILE_NAME := $(shell basename $(PROFILE_PATH))

.PHONY: install
install:
	dune install

.PHONY: uninstall
uninstall:
	dune uninstall

.PHONY: build
build:
	@dune build

.PHONY: test
test:
	dune runtest -f

.PHONY: clean
clean:
	@dune clean

.PHONY: format
format: ## push all
	@$(foreach v, $(SOURCES), ocamlformat -i $(v);)
