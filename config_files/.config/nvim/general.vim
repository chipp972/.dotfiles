" ######################
"                      #
"                      #
" GENERAL CONFIG       #
"                      #
"                      #
" ######################

set confirm

" UI config
set number
set showcmd
set cmdheight=2
set wildmenu
set cursorline " highlight current line
filetype indent on
set lazyredraw
set showmatch

" search
set hlsearch
set incsearch
set ignorecase
set smartcase

" tabs and indents
set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab

" folding
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent

" status bar configuration
let g:airline#extensions#tabline#enabled = 1

" deoplete
let g:deoplete#enable_at_startup = 1
