#!/bin/sh

CONFIG_HOME=$(dirname $(dirname $(readlink -f $0)))

# install softwares
sudo apt-get install gcc make cmake tig tmux zsh golang markdown -y
sudo apt-get install python-dev python3-dev python-pip python3-pip python python2.7 -y
sudo apt-get install openssh-server -y

# install nvim
IS_LINUX=$(uname -a | grep linux -i)
NEOVIM_INSTALLED=$(command -v nvim)
if [ "$IS_LINUX" -a ! "$NEOVIM_INSTALLED" ]; then
  sudo apt-get install software-properties-common -y
  sudo add-apt-repository ppa:neovim-ppa/unstable -y
  sudo apt-get update
  sudo apt-get install neovim -y
  sudo pip3 install neovim -y
fi
# alias vim and vi to nvim
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60

# install nodejs
NODE_INSTALLED=$(command -v node)
if [ "$IS_LINUX" -a ! "$NODE_INSTALLED" ]; then
  curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
  sudo apt-get install -y nodejs build-essential
fi

# install atom
ATOM_INSTALLED=$(command -v atom atom-beta)
if [ "$IS_LINUX" -a ! "$ATOM_INSTALLED" ]; then
  sudo add-apt-repository ppa:webupd8team/atom
  sudo apt-get update
  sudo apt-get install atom
fi

# install prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "$HOME/.zprezto"

# install fuzzy finder
git clone --depth 1 https://github.com/junegunn/fzf.git "$HOME"/.fzf
"$HOME"/.fzf/install -y

# install vim-plug
sudo curl -fLo "$CONFIG_HOME"/nvim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# linters
sudo apt-get install shellcheck pylint -y

# upgrade and update packages
sudo apt-get autoremove -y
sudo apt-get upgrade -y
sudo apt-get update
cd "$HOME/.zprezto" && git pull && git submodule update --init --recursive 

# permissions
sudo chown -R $(whoami) "$HOME/.zprezto"
sudo chown -R $(whoami) "$HOME/.fzf"
sudo chown -R $(whoami) "$CONFIG_HOME"
sudo chown -R $(whoami) "$HOME/.atom"
