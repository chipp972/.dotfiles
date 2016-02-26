#!/bin/bash

CONFIG_HOME=$HOME/.dotfiles

# create the symlinks
"$CONFIG_HOME"/scripts/link.sh


# install softwares (need sudo)
NO_INSTALL=$1
if [ ! "$NO_INSTALL" ]; then
	"$CONFIG_HOME"/scripts/software_install.sh
fi

# install prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "$HOME/.zprezto"

# install fuzzy finder
git clone --depth 1 https://github.com/junegunn/fzf.git "$HOME"/.fzf
"$HOME"/.fzf/install

# install vim-plug
curl -fLo "$CONFIG_HOME"/nvim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# vm configurations
if [ "$IS_VM" ]; then
	"$CONFIG_HOME"/scripts/vm_install.sh
fi

# end message
echo "Installation done"
echo "Please logout for changes to take effect"
echo "Use PlugInstall and UpdateRemotePlugins in nvim to get plugins working"
