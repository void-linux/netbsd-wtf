PREFIX ?= /usr
BINDIR ?= $(PREFIX)/bin
DATADIR ?= $(PREFIX)/share
MANDIR ?= $(PREFIX)/share/man
ACRONYMSDIR = $(DESTDIR)$(DATADIR)/wtf

all:
	sed -e "s|@@ACRONYMSDIR@@|$(ACRONYMSDIR)|g" wtf.in > wtf

install:
	install -d $(DESTDIR)$(BINDIR)
	install -m755 wtf $(DESTDIR)$(BINDIR)
	install -d $(DESTDIR)$(MANDIR)/man6
	install -m644 wtf.6 $(DESTDIR)$(MANDIR)/man6
	install -d $(DESTDIR)$(DATADIR)/wtf
	install -m644 acronyms* $(DESTDIR)$(DATADIR)/wtf

clean:
	-rm -f wtf
