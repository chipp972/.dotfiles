#!/bin/bash

CONFIG_HOME=$HOME/.dotfiles

# install the softwares
sudo apt-get install make git tig tmux zsh

# install prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git $CONFIG_HOME/.prezto

# install nvim
IS_UBUNTU=$(uname -a | grep ubuntu -i)
if [ $IS_UBUNTU ]; then
	sudo apt-get install software-properties-common
	sudo add-apt-repository ppa:neovim-ppa/unstable
	sudo apt-get update
	sudo apt-get install neovim
	sudo apt-get install python-dev python-pip python3-dev python3-pip
fi

# alias vim and vi to nvim
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60

# install vim-plug
curl -fLo $CONFIG_HOME/nvim/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# create symlinks for rc files
setopt EXTENDED_GLOB
for rcfile in $CONFIG_HOME/rcfiles/
do
	ln -s $rcfile $HOME/.$rcfile
done

# 
