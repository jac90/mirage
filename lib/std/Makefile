PREFIX ?= ~/mir-inst/lib

.PHONY: all lib syntax clean install
all: syntax lib
	@ :

syntax:
	ocamlbuild $(JOBS) -use-ocamlfind syntax.otarget

lib: syntax
	ocamlbuild $(JOBS) -X syntax lib.otarget

TARGETDIR=$(DESTDIR)$(PREFIX)/mirage/std
install:
	mkdir -p $(TARGETDIR)/lib $(TARGETDIR)/syntax
	cp _build/lib/*.cmi _build/lib/*.cmxa _build/lib/*.a $(TARGETDIR)/lib
	cp _build/syntax/pa_*.cma $(TARGETDIR)/syntax

clean:
	ocamlbuild -clean
