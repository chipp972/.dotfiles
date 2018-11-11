#!/usr/bin/env bash

SETUP_SCRIPTS=$(ls "$CONFIG_HOME/src/setup/*.sh")
for script in $SETUP_SCRIPTS
do
  source $script
done
