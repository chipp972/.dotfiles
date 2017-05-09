const path = require('path')
const exec = require('child_process').exec
const fs = require('fs')
const R = require('ramda')

const pkgs = {
  utils: [
    'terminator', // terminal
    'ttf-fira-code', // fonts
    'htop-vim-solarized-git',
    'gnome-screensaver', // lock screen
  ],
  bashit: [
    'git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it',
    '~/.bash_it/install.sh --silent --no-modify-config',
    'bash-it update'
  ],
  vscode: [
    '--m-arg "--skipchecksums" visual-studio-code-insiders',
  ],
  nvim : [
    'neovim',
    'neovim-plug',
    'xclip', // clipboard
  ],
  docker : [
    'docker',
    'docker-compose'
  ],
  perso : [
    'filezilla',
    'dropbox'
  ],
}




// install selected packages

const getPkgList = R.reduce(R.concat, 'yaourt -S --noconfirm ')

console.log(getPkgList(pkgs))
