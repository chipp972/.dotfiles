#!/bin/sh

CONFIG_HOME=$(dirname $(dirname $(readlink -f $0)))

# install nodejs
NODE_INSTALLED=$(command -v node)
if [ "$IS_LINUX" -a ! "$NODE_INSTALLED" ]; then
  curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -
  sudo apt-get install -y nodejs build-essential
fi

# terminal
yaourt -S terminator --noconfirm

# fonts
yaourt -S ttf-fira-code

# utils
yaourt -S htop-vim-solarized-git xclip

# install vscode
yaourt -S --m-arg "--skipchecksums" visual-studio-code-insiders

# install bash-it
git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
~/.bash_it/install.sh --silent --no-modify-config
bash-it update

# install neovim
yaourt -S neovim neovim-plug

