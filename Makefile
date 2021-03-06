.PHONY: all clean tools
.DEFAULT: all
-include Makefile.config

SUDO ?= sudo
export SUDO

DESTDIR ?=
export DESTDIR

PREFIX ?= $(HOME)/mir-inst
export PREFIX

JOBS=-j 6
export JOBS

all: tools
	cd lib && $(MAKE)

tools:
	@cd tools && $(MAKE) tools

install:
	rm -rf _build
	./assemble.sh
	mkdir -p $(PREFIX)
	cp -r _build/* $(PREFIX)/

clean:
	@cd tools && $(MAKE) clean
	@cd lib && $(MAKE) clean
