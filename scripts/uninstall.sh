#!/bin/sh

CONFIG_HOME=$(dirname $(dirname $(readlink -f $0)))

# delete all links
for rcfile in $(ls "$CONFIG_HOME"/rcfiles/)
do
	rm -f "$HOME/.$rcfile"
done
