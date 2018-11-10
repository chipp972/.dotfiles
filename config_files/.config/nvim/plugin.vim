" ######################
"                      #
"                      #
" PLUGIN INSTALLATION  #
"                      #
"                      #
" ######################

call plug#begin('~/.config/nvim/plugged')

" editing
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'Raimondi/delimitMate' " add the closing pairs
" Plug 'maxbrunsfeld/vim-yankstack' " cycle through yank history with meta-p and meta-shift-p

" navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dbeecham/ctrlp-commandpalette.vim'

" status bar
Plug 'bling/vim-airline'
Plug 'tpope/vim-fugitive'

" theme
Plug 'tomasr/molokai'
Plug 'dracula/vim'
Plug 'joshdick/onedark.vim'
Plug 'luochen1990/rainbow'

" code
" Plug 'w0rp/ale' "async lint engine
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'wokalski/autocomplete-flow' " flow plugin
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
endif

Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'sheerun/vim-polyglot'

" javascript
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
" Plug 'prettier/vim-prettier', { 'do': 'yarn install' }"
" Plug 'Galooshi/vim-import-js', { 'do': 'npm i -g import-js' }"

call plug#end()

