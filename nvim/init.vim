call plug#begin('~/.dotfiles/nvim/plugged')

" description
Plug 'junegunn/vim-easy-align'

" description
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" description
Plug 'scrooloose/nerdcommenter'

" description
Plug 'surround.vim'

" Command-line fuzzy-finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter' " diff signs in the gutter

Plug 'tommcdo/vim-exchange'

" async linting
Plug 'benekastah/neomake'

" status bar
Plug 'bling/vim-airline'

" vim snippets depends on ultisnips
" description
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" autocompletion for go, python
Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-go'
Plug 'zchee/deoplete-jedi'

" theme
Plug 'tomasr/molokai'

" end of plugin loading
call plug#end()

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

" autocompletion
let g:deoplete#enable_at_startup = 1

" nanvigation
nnoremap j gj
nnoremap k gk

" tab navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" terminal configurations
tnoremap <Esc> <C-\><C-n>

" status bar configuration
let g:airline#extensions#tabline#enabled = 1

" linters
autocmd! BufWritePost * :Neomake "auto lint on save
let g:neomake_c_gcc_maker = {
      \ 'exe': 'gcc',
      \ 'args': ['--verbose'],
      \ 'errorformat': '%A%f: line %l\, col %v\, %m \(%t%*\d\)',
      \ }
let g:neomake_python_pylint_maker = {
      \ 'args': ['--verbose'],
      \ 'errorformat': '%A%f: line %l\, col %v\, %m \(%t%*\d\)',
      \ }
let g:neomake_javascript_jshint_maker = {
      \ 'args': ['--verbose'],
      \ 'errorformat': '%A%f: line %l\, col %v\, %m \(%t%*\d\)',
      \ }
let g:neomake_json_jsonlint_maker = {
      \ 'args': ['--verbose'],
      \ 'errorformat': '%A%f: line %l\, col %v\, %m \(%t%*\d\)',
      \ }
let g:neomake_go_go_maker = {
      \ 'args': ['--verbose'],
      \ 'errorformat': '%A%f: line %l\, col %v\, %m \(%t%*\d\)',
      \ }
let g:neomake_warning_sign = {
      \ 'text': 'W',
      \ 'texthl': 'WarningMsg',
      \ }
let g:neomake_error_sign = {
      \ 'text': 'E',
      \ 'texthl': 'ErrorMsg',
      \ }

let g:neomake_c_enabled_makers = ['gcc']
let g:neomake_python_enabled_makers = ['pylint']
let g:neomake_json_enabled_makers = ['jsonlint']
let g:neomake_verbose=3
let g:neomake_logfile='/tmp/error.log'
let g:neomake_open_list = 2

