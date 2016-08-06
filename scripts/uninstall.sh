#!/bin/zsh

setopt EXTENDED_GLOB

# delete all links
for rcfile in "$CONFIG_HOME"/rcfiles/^README.md(.N)
do
	rm -f "$HOME/.${rcfile:t}"
done

# uninstall fzf
"$HOME/.fzf/uninstall"
rm -rf "$HOME/.fzf"

# uninstall zprezto
rm -rf "$HOME/.zprezto"
