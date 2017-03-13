" ######################
"                      #
"                      #
" PLUGIN INSTALLATION  #
"                      #
"                      #
" ######################

call plug#begin('~/.dotfiles/nvim/plugged')

" description
Plug 'junegunn/vim-easy-align'

" description
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" description
Plug 'scrooloose/nerdcommenter'

" description
Plug 'surround.vim'

Plug 'tommcdo/vim-exchange'

" status bar
Plug 'bling/vim-airline'

" theme
Plug 'tomasr/molokai'

call plug#end()


" ######################
"                      #
"                      #
" PLUGIN CONFIGURATION #
"                      #
"                      #
" ######################

let mapleader=" "

syntax on
set number
set smartindent
set hlsearch
set incsearch
set ruler
set showcmd

" replace tab with 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab

" theme
let g:rehash256 = 1

" navigation
nnoremap j gj
nnoremap k gk

" terminal configurations
tnoremap <Esc> <C-\><C-n>

" status bar configuration
let g:airline#extensions#tabline#enabled = 1
