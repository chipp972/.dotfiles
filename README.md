# DOTFILES #

## Description ##

Configuration files and automatic installation scripts for Ubuntu.

| Package name           | dev | server | perso |
| ---------------------- | --- | ------ | ----- |
| terminator             |  X  |        |       |
| neovim                 |  X  |    X   |       |
| neovim-plug            |  X  |    X   |       |
| xclip                  |  X  |    X   |       |
| ttf-fira-code          |  X  |        |       |
| htop-vim-solarized-git |  X  |    X   |       |
| docker                 |  X  |    X   |       |
| docker-compose         |  X  |    X   |       |
| vscode-insiders        |  X  |        |       |

Note: no option provided => dev + perso

## Required ##

You need to install git, nodejs, npm :

```bash
curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash -
sudo apt-get install -y nodejs build-essential git
```

## Usage ##

To install:

```bash
git clone https://github.com/chipp972/.dotfiles
cd /path/to/.dotfiles
npm install && sudo node install.js
```

## Notes ##

To update vscode-insiders :

```bash
cd ~/Download/
yaourt -G visual-studio-code-insiders
cd visual-studio-code-insiders
makepkg -si --skipchecksums --needed
```

## Todo ##

* [ ] Ask for languages to use and download only the right plugins
