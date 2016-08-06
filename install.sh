#!/bin/sh

# check if root
UID=$(id -u)
if [ "$UID" != 0 ]; then
	echo "Please run as root"
	exit 0
fi

NO_INSTALL=$1
CONFIG_HOME=$(dirname $(readlink -f $0))

# delete log
rm -f "$CONFIG_HOME"/install.log

# install softwares
if [ ! "$NO_INSTALL" ]; then
	sudo sh "$CONFIG_HOME"/scripts/software_install.sh
fi

# vm configurations
if [ "$IS_VM" ]; then
	sudo sh "$CONFIG_HOME"/scripts/vm_install.sh
fi

# create the symlinks
sudo zsh "$CONFIG_HOME"/scripts/link.sh

# end message
echo "Installation done"
echo "Please logout for changes to take effect"
echo "Use PlugInstall and UpdateRemotePlugins in nvim to get plugins working"
echo "Use package-sync in atom to synchronize packages"
