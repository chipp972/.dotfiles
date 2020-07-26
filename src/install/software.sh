#!/usr/bin/env bash

# git and utils

sudo apt install -y git make curl build-essential openssl libssl-dev unzip

sudo snap install snap-store htop
sudo snap install --classic code-insiders
sudo snap install --classic flutter

# nvm
if [ ! -d "$HOME"/.nvm ]; then
  git clone https://github.com/creationix/nvm.git "$HOME"/.nvm
fi

# browser

if [ -z "$(which google-chrome)" ]; then
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  sudo apt install ./google-chrome-stable_current_amd64.deb
  rm ./google-chrome-stable_current_amd64.deb
fi

# bash-it

if [ ! -d "$HOME"/.bash_it ]; then
  git clone --depth=1 https://github.com/Bash-it/bash-it.git "$HOME"/.bash_it
  source "$HOME"/.bash_it/install.sh --silent --no-modify-config
fi

# install neovim
if [ -z "$(which vim)" ]; then
  sudo snap install --classic --beta nvim

  # vim-plug
  VIM_AUTOLOAD_FOLDER="$HOME"/.local/share/nvim/site/autoload
  mkdir -p $VIM_AUTOLOAD_FOLDER
  wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  mv plug.vim $VIM_AUTOLOAD_FOLDER/

  # vim plugin install
  vim +PlugInstall +qall
fi

