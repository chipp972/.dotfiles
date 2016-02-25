#!/bin/zsh
# create symlinks for rc files

CONFIG_HOME=$HOME/.dotfiles

rm -f $HOME/.gitconfig $HOME/.zshrc

setopt EXTENDED_GLOB
for rcfile in "$CONFIG_HOME"/rcfiles/^README.md(.N)
do
	ln -s "$rcfile" "$HOME/.${rcfile:t}"
done

