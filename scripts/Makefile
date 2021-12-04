
include ../Makefile.inc

all: install-grat-os setup-grat-os flushmem which mkinitramfs

%: %.in
	sed -e "s/#VERSION#/$(VERSION)/" $< > $@


.PHONY:	install clean distclean dist

install: all
	install -D -m0755 install-grat-os $(SBINDIR)/install-grat-os
	install -D -m0755 setup-grat-os $(SBINDIR)/setup-grat-os
	install -D -m0755 flushmem $(SBINDIR)/flushmem
	install -D -m0755 mkinitramfs $(SBINDIR)/mkinitramfs
	install -D -m0755 which $(BINDIR)/which

clean:
	rm -f install-grat-os
	rm -f setup-grat-os
	rm -f flushmem
	rm -f which
	rm -f mkinitramfs

distclean: clean

# End of file
