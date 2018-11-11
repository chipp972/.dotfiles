#!/usr/bin/env bash

# git and utils

sudo apt install -y git git-flow htop xclip

# nvm
if [ ! -d "$HOME/.nvm" ]; then
  git clone https://github.com/creationix/nvm.git "$HOME/.nvm"
fi

# browser

if [ -z "$(which chromium-browser)" ]; then
  sudo apt install chromium
fi

# vscode

installExtensions () { # $1 = code | code-insiders
  VSCODE_EXECUTABLE=$1
  PLUGINS=$(cat "$CONFIG_HOME/src/install/vscode-extensions.txt")
  for plugin in $PLUGINS
  do
    $VSCODE_EXECUTABLE --install-extension $plugin
  done
}

if [ -n "$(which code)" ]; then
  installExtensions "code"
elif [ -n "$(which code-insiders)" ]; then
  installExtensions "code-insiders"
else
  sudo apt install -y code-insiders
  installExtensions "code-insiders"
fi

# bash-it

if [ ! -d "$HOME/.bash_it" ]; then
  git clone --depth=1 https://github.com/Bash-it/bash-it.git "$HOME/.bash_it"
  source "$HOME/.bash_it/install.sh" --silent --no-modify-config
fi

# install neovim
if [ -z "$(which vim)" ]; then
  sudo apt install -y neovim

  # vim-plug
  VIM_AUTOLOAD_FOLDER="$HOME"/.local/share/nvim/site/autoload
  mkdir -p $VIM_AUTOLOAD_FOLDER
  wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  mv plug.vim $VIM_AUTOLOAD_FOLDER/

  # vim plugin install
  vim +PlugInstall +qall
fi

