#!/bin/sh
# create symlinks for the configuration files

# path to the folder
CONFIG_HOME=$(dirname $(dirname $(readlink -f $0)))

# link rc files
for rcfile in $(ls "$CONFIG_HOME"/rcfiles/)
do
	mv -f "$HOME/.$rcfile" "$HOME/.$rcfile.bak"
	ln -s "$CONFIG_HOME/rcfiles/$rcfile" "$HOME/.$rcfile"
	echo "linked $rcfile" >> "$CONFIG_HOME/install.log"
done

# link for nvim config
mv -f "$HOME"/.config/nvim "$HOME"/.config/nvim_bak
mkdir -p "$HOME/.config"
ln -s "$CONFIG_HOME/nvim" "$HOME"/.config/nvim
