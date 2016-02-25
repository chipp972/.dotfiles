call plug#begin('~/.dotfiles/nvim/plugged')

" description
Plug 'junegunn/vim-easy-align'

" description
Plug 'scrooloose/nerdtree.git', { 'on': 'NERDTreeToggle' }

" description
Plug 'surround.vim'

" description
Plug 'kien/ctrlp.vim'

" description
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

Plug 'tommcdo/vim-exchange'

Plug 'scrooloose/syntastic'

Plug 'benekastah/neomake'

" vim snippets depends on ultisnips
" description
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" Plugin 'Shougo/deoplete.vim'

Plug 'scrooloose/nerdcommenter'

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
let g:rehash256 = 1

" autocompletion
" let g:deoplete#enable_at_startup = 1

" nanvigation
nnoremap j gj
nnoremap k gk

"tab navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" terminal configurations
tnoremap <Esc> <C-\><C-n>


