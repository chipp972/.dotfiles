#!/bin/bash

# install the softwares
sudo apt-get install make cmake tig tmux zsh python nodejs npm -y
sudo apt-get install python-dev python-pip python3-dev python3-pip python2.7 -y
sudo apt-get install openssh-server -y

# install nvim
IS_UBUNTU=$(uname -a | grep ubuntu -i)
NEOVIM_INSTALLED=$(command -v nvim)
if [ "$IS_UBUNTU" -a ! "$NEOVIM_INSTALLED" ]; then
  sudo apt-get install software-properties-common
  sudo add-apt-repository ppa:neovim-ppa/unstable
  sudo apt-get update
  sudo apt-get install neovim
  sudo pip3 install neovim
fi

# alias vim and vi to nvim
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60

# additionals softwares
## languages
sudo apt-get install golang markdown gcc
## linters
sudo apt-get install shellcheck pylint
sudo npm install jsonlint -g

# change default shell to zsh
chsh -s /bin/zsh

# upgrade and update packages
sudo apt-get upgrade
sudo apt-get update


