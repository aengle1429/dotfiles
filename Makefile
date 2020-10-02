# https://stackoverflow.com/questions/18136918/how-to-get-current-relative-directory-of-your-makefile
DOTFILES_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

all:	nvim tmux zsh

nvim:
	test -f ~/.config/nvim/init.vim || ( \
	  mkdir -p ~/.config/nvim/ && \
	  ln -s $(DOTFILES_DIR)/vimrc ~/.config/nvim/init.vim \
	)
	test -f ~/.config/nvim/plug-config/coc.vim || ( \
	  mkdir -p ~/.config/nvim/plug-config/ && \
	  ln -s $(DOTFILES_DIR)/mycstyle.vim ~/.config/nvim/plug-config/coc.vim \
	)

tmux:
	test -f ~/.tmux.conf || \
	  ln -s $(DOTFILES_DIR)/tmux.conf ~/.tmux.conf

zsh:
	test -f ~/.zshrc || \
	  ln -s $(DOTFILES_DIR)/zshrc ~/.zshrc
