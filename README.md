# DOTFILES #

## Description ##

My configuration files and automatic installation scripts for Arch based OS.
It will install :

* yaourt
* terminator
*

## Required ##

You need to install git, nodejs and npm :

```bash
sudo pacman -S git nodejs npm
```

## Usage ##

To install:

```bash
git clone https://github.com/chipp972/.dotfiles
sudo sh .dotfiles/install.sh
```

To uninstall:

```bash
sh .dotfiles/scripts/uninstall.sh
rm -rf .dotfiles
```

## Todo ##

* [ ] Ask for languages to use and download only the right plugins
* [ ] Find a way to auto update and download nvim plugins
