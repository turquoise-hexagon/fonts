PREFIX ?= $(DESTDIR)/usr
FONTDIR = $(PREFIX)/share/fonts/X11/misc

SRC = $(wildcard *.bdf)
BIN = $(SRC:.bdf=.otf)

all : $(BIN)

$(BIN) : $(SRC)
	fonttosfnt -o $@ $<

clean :
	rm $(BIN)

install : all
	install -Dm644 $(BIN) -t $(FONTDIR)

uninstall :
	rm -f $(addprefix $(FONTDIR)/,$(BIN))

.PHONY : all clean install uninstall
