" set autochdir

" ######################
"                      #
"                      #
" NERDTree config      #
"                      #
"                      #
" ######################

" open NERDTree if opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" close vim if the only window left is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" show hidden files
let NERDTreeShowHidden = 1

" ######################
"                      #
"                      #
" ctrlp config         #
"                      #
"                      #
" ######################

" always open in new buffer
let g:ctrlp_switch_buffer = 0

" change vim working directory
let g:ctrlp_working_path_mode = 0

" ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

let g:ctrlp_custom_ignore = {
  \ 'dir':  '/node_modules/',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

let g:ale_sign_column_always = 1
