# DOTFILES #

## Description ##

My configuration files and automatic installation scripts for linux (debian based OS)

## Utilisation ##

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

* set an option to install the config on systems
  you don't own (detection of tmux, zsh, vim or nvim etc.)
* ask for languages to use and download only the right plugins
* add configurations for vim plugins + snippets + syntax
* find a way to auto update and download vim plugins
* list all shortcuts
