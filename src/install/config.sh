#!/usr/bin/env bash

GIT_EMAIL=""
GIT_NAME=""
DEFAULT_PROJECT_FOLDER="/home/$(whoami)/Documents"

read -p "What is your email (git) " GIT_EMAIL

read -p "What is your name (git) " GIT_NAME

read -p "What is your project folder ? (default: $DEFAULT_PROJECT_FOLDER) " PROJECT_FOLDER
if [[ -z "$PROJECT_FOLDER" ]]; then
  PROJECT_FOLDER="$DEFAULT_PROJECT_FOLDER"
fi

PS3="What version of node do you want to be installed via nvm ? (default: latest)"
select NVM_NODE_VERSION in "Latest node version" "Latest lts"
do
  if [ "$NVM_NODE_VERSION" == "Latest lts" ]; then
    NVM_NODE_VERSION="lts/*"
  else
    NVM_NODE_VERSION="node"
  fi
  break
done

# sanitize fs path for regexp
PROJECT_FOLDER=$(sed 's/\//\\\//g' <<< "$PROJECT_FOLDER")

# put personalized config files in a temporary folder
rm -rf "$CONFIG_HOME"/tmp
cp -a "$CONFIG_HOME"/config_files/. "$CONFIG_HOME"/tmp

# replace placeholders
find "$CONFIG_HOME"/tmp -type f -print0 | while IFS= read -r -d '' file
do
  sed -i "s/{PROJECT_FOLDER}/$PROJECT_FOLDER/g" "$file"
  sed -i "s/{GIT_EMAIL}/$GIT_EMAIL/g" "$file"
  sed -i "s/{GIT_NAME}/$GIT_NAME/g" "$file"
  sed -i "s/{NVM_NODE_VERSION}/$NVM_NODE_VERSION/g" "$file"
done

# copy personalized config files and remove temporary folder
cp -a "$CONFIG_HOME"/tmp/. "$HOME"
rm -rf "$CONFIG_HOME"/tmp

# font install
fc-cache -f -v

