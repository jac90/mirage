PREFIX ?= _build/root
TARGETDIR=$(PREFIX)/mirage/os
OS = $(shell uname -s | tr '[A-Z]' '[a-z]' | sed -e 's/darwin/macosx/g')
ARCH = $(shell uname -m)

ifeq ($(OS) $(ARCH),linux x86_64)
XEN_INSTALL=install-xen
XEN_BUILD=xen.otarget
else
XEN_BUILD=
XEN_INSTALL=
endif

.PHONY: clean all depend install unix xen
all: depend
	ocamlbuild $(JOBS) unix.otarget $(XEN_BUILD)

unix:
	ocamlbuild $(JOBS) unix.otarget

xen:
	ocamlbuild $(JOBS) xen.otarget

depend: $(EVMAKE) $(EVLIB)
	ln -nfs tap_stubs_$(OS).c runtime_unix/tap_stubs_os.c
	ln -nfs ev_$(OS).c runtime_unix/ev_os.c

install: install-unix $(XEN_INSTALL)
	@ :

install-unix:
	mkdir -p $(TARGETDIR)/unix
	cp _build/unix/oS.cmi _build/unix/oS.cmxa _build/unix/oS.a $(TARGETDIR)/unix
	cp _build/runtime_unix/libunixrun.a _build/runtime_unix/main.o $(TARGETDIR)/unix

install-xen:
	mkdir -p $(TARGETDIR)/xen
	cp _build/xen/oS.cmi _build/xen/oS.cmxa _build/xen/oS.a $(TARGETDIR)/xen
	cp runtime_xen/kernel/mirage-x86_64.lds $(TARGETDIR)/xen/
	cp _build/runtime_xen/dietlibc/libdiet.a $(TARGETDIR)/xen/
	cp _build/runtime_xen/libm/libm.a $(TARGETDIR)/xen/
	cp _build/runtime_xen/ocaml/libocaml.a $(TARGETDIR)/xen/
	cp _build/runtime_xen/kernel/libxen.a $(TARGETDIR)/xen/
	cp _build/runtime_xen/kernel/libxencaml.a $(TARGETDIR)/xen/
	cp _build/runtime_xen/kernel/x86_64.o $(TARGETDIR)/xen/

clean:
	ocamlbuild -clean
	rm -f runtime_unix/tap_stubs_os.c runtime_unix/ev_os.c
