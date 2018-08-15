#!/usr/bin/env bash

# git

sudo apt install -y git git-flow

# htop

sudo snap install htop

# nvm
if [ ! -d "$HOME"/.nvm ]; then
  git clone https://github.com/creationix/nvm.git "$HOME"/.nvm
fi

# browser

sudo snap install chromium

# vscode

sudo snap install vscode --channel=edge
EXTENSIONS=$(cat "$CONFIG_HOME"/src/install/vscode-extensions.txt)
for ext in $EXTENSIONS
do
  code --install-extension $ext
done

# bash-it

if [ ! -d "$HOME"/.bash_it ]; then
  git clone --depth=1 https://github.com/Bash-it/bash-it.git "$HOME"/.bash_it
  source "$HOME"/.bash_it/install.sh --silent --no-modify-config
fi

# install neovim
sudo apt install -y neovim

# vim-plug
VIM_AUTOLOAD_FOLDER="$HOME"/.local/share/nvim/site/autoload
mkdir -p $VIM_AUTOLOAD_FOLDER
wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mv plug.vim $VIM_AUTOLOAD_FOLDER/

# vim plugin install
vim +PlugInstall +qall

# xclip
sudo apt install -y xclip
