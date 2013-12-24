PREFIX = $(HOME)

DOTFILES = $(wildcard .*rc) \
           $(wildcard .bash_*) \
           .config \
           .gitattributes \
           .gitconfig \
           .imapfilter \
           .jedit \
           .profile \
           .quiltrc-dpkg \
           .screenlayout \
           .screenrc \
           .signatures \
           .vim \
           .xinitrc \
           .Xmodmap \
           .Xresources

.PHONY: all
all: test

.PHONY: clean
clean:
	$(CURDIR)/scripts/cleanup.sh --verbose

.PHONY: test
test:
	find . \( -name '*.md' -o -name '*.markdown' \) -exec markdown {} \;

.PHONY: install
install:
	$(CURDIR)/scripts/make-links.sh -v $(addprefix $(CURDIR)/, $(DOTFILES)) $(PREFIX)

include make-includes/variables.mk
