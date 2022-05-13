
include ../Makefile.inc

all:


.PHONY:	install clean distclean

create-dirs:
	install -d -m 755 $(SERVICEDIR)
	install -d -m 755 $(SERVICEDIR)/setup-grat-os
	install -d -m 755 $(VARDIR)/log
	install -d -m 700 $(ROOTDIR)
	install -d -m 755 $(ETCDIR)/X11/xorg.conf.d

files: create-dirs
	install -m 644 lib/init-functions $(SERVICEDIR)/init-functions
	install -m 644 lib/init.in	$(SERVICEDIR)/init.in
	for EXT in ar da de es fi fr it nl nn pt sv tr ru; do \
		install -m 644 lib/setup-grat-os.$${EXT} \
$(SERVICEDIR)/setup-grat-os/setup-grat-os.$${EXT}; \
	done

links: files
	ln -sf ../proc/self/mounts $(ETCDIR)/mtab
	ln -sf ../etc/bashrc $(ROOTDIR)/bashrc
	ln -sf ../etc/fstab $(ROOTDIR)/fstab
	ln -sf ../etc/profile.d $(ROOTDIR)/profile.d
	ln -sf services  $(LIBDIR)/lsb
	ln -sf /run/lock $(VARDIR)/lock
	ln -sf /run	 $(VARDIR)/run

install: links

clean:

distclean: clean

# End of file
