BIN = $(shell find . -type f -name '*.bdf' | sed -E 's|.*/(.*)\.bdf|bin/\1.otb|g')

PREFIX ?= $(DESTDIR)/usr
FNTDIR  = $(PREFIX)/share/fonts/X11/misc

all : $(BIN)

bin/%.otb : src/%.bdf
	@mkdir -p bin
	fonttosfnt -o $@ $<

clean :
	rm -rf bin

install : all
	install -Dm644 bin/*.otb -t "$(FNTDIR)"

uninstall :
	@echo "uninstalling fonts..."
	@for font in src/*.bdf; do \
		font=$${font##*/}; \
		font=$${font%.bdf}.otb; \
		rm "$(FNTDIR)/$$font"; \
	done

.PHONY : all clean install uninstall
