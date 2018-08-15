" ######################
"                      #
"                      #
" KEYBINDINGS          #
"                      #
"                      #
" ######################

let mapleader=" "

" map Y to act like C and D
map Y y$

" navigation on wrapped lines
nnoremap j gj
nnoremap k gk

" map leader y/p to yank/paste in the system register
nnoremap <leader><p> "*p
nnoremap <leader><y> "*y

" easier begining/end of line
nnoremap B ^
nnoremap E $

" jk is escape
inoremap jk <esc>

" toggle gundo
nnoremap <leader>u :GundoToggle<CR>

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

" terminal shortcut
tnoremap <Esc> <C-\><C-n>

" async lint engine
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" deoplete
inoremap <expr><tab> pumvisible()? "\<C-n>" : "\<C-space>"

" control palette
nnoremap <leader>t :CtrlPCommandPalette<CR>

" open nvim config
let g:commandPalette = {
    \ 'Paste System Register': '"*p',
    \ 'Open general config': ':vsp ~/.config/nvim/general.vim',
    \ 'Open keybindings': ':vsp ~/.config/nvim/keybindings.vim',
    \ 'Open navigation config': ':vsp ~/.config/nvim/navigation.vim',
    \ 'Open javascript config': ':vsp ~/.config/nvim/javascript.vim',
    \ 'Open theme config': ':vsp ~/.config/nvim/theme.vim',
    \ 'Open plugin config': ':vsp ~/.config/nvim/plugin.vim'}


