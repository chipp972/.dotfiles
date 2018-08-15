#!/usr/bin/env bash

# copy config files
cp -a "$CONFIG_HOME"/config_files/. "$HOME"/

# font install
fc-cache -f -v

