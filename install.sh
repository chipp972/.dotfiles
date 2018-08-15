#!/usr/bin/env bash

export CONFIG_HOME=$(dirname $(readlink -f $0))

# install configs and softwares
bash "$CONFIG_HOME"/src/install/config.sh
bash "$CONFIG_HOME"/src/install/software.sh

# Add setup to .bashrc
echo "export CONFIG_HOME=$CONFIG_HOME" > "$HOME"/.bashrc
echo "source "$CONFIG_HOME"/setup.sh" >> "$HOME"/.bashrc

# reload bashrc
source "$HOME"/.bashrc

# install latest node and npm
nvm install
# update bash-it and enable plugins
bash-it update
bash-it enable plugin base alias-completion extract git node nvm ssh

# end message
echo "Installation done"
