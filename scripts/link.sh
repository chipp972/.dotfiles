#!/bin/zsh
# create symlinks for the configuration files

setopt EXTENDED_GLOB

# path to the folder
CONFIG_HOME=$(dirname $(dirname $(readlink -f $0)))
PACKAGESYNC=$(apm list | grep -o package-sync)

# link rc files
for rcfile in "$CONFIG_HOME"/rcfiles/^README.md(.N)
do
	rm -f "$HOME/.${rcfile:t}"
	ln -s "$rcfile" "$HOME/.${rcfile:t}"
	echo "linked $rcfile with $HOME/.${rcfile:t}" >> "$CONFIG_HOME/install.log"
done

# link for nvim config
rm -rf "$HOME"/.config/nvim
mkdir -p "$HOME/.config"
ln -s "$CONFIG_HOME/nvim" "$HOME"/.config/nvim

# link atom configuration files
for config in "$CONFIG_HOME"/atom/*
do
		rm -f "$HOME/.atom/${config:t}"
		ln -s "$config" "$HOME/.atom/${config:t}"
		echo "linked $config with $HOME/.atom/${config:t}" >> "$CONFIG_HOME/install.log"
done
# to synchronize packages in atom
if [ ! $PACKAGESYNC ]; then
	apm install package-sync
	echo "installed package-sync for atom" >> "$CONFIG_HOME/install.log"
fi

# change default shell to zsh
chsh -s /bin/zsh
