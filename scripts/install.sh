#!/bin/bash

CONFIG_HOME=$HOME/.dotfiles

# install the softwares
sudo apt-get install make cmake tig tmux zsh python npm
sudo apt-get install python-dev python-pip python3-dev python3-pip python2.7

# install prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "$HOME/.zprezto"

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

# install vim-plug
curl -fLo "$CONFIG_HOME"/nvim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# create the symlinks
"$CONFIG_HOME"/scripts/link.sh

# change default shell to zsh
chsh -s /bin/zsh


# additionals softwares
## languages
sudo apt-get install golang markdown gcc
## linters
sudo apt-get install shellcheck pylint
sudo npm install jsonlint -g
# install fuzzy finder
git clone --depth 1 https://github.com/junegunn/fzf.git "$HOME"/.fzf
"$HOME"/.fzf/install

# upgradeand update packages
sudo apt-get upgrade
sudo apt-get update

# end message
echo "Installation done"
echo "Please logout for changes to take effect"
echo "Use PlugInstall and UpdateRemotePlugins in nvim to get plugins working"
