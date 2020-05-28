call plug#begin(stdpath('data').'/plugged')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'neovimhaskell/haskell-vim'
  Plug 'vim-utils/vim-man'
  Plug 'dm1try/golden_size'
call plug#end()
source ~/.vimrc
inoremap <expr> <TAB> pumvisible() ? "\<c-n>" : "\<TAB>"
inoremap <expr> <S-TAB> pumvisible() ? "\<c-p>" : "\<S-TAB>"

let g:deoplete#enable_at_startup = 1
let g:haskell_enable_quantification = 1
let g:haskell_enable_recursivedo = 1
let g:haskell_enable_arrowsyntax = 1
let g:haskell_enable_pattern_synonyms = 1
let g:haskell_enable_typeroles = 1
let g:haskell_enable_static_pointers = 1
let g:haskell_backpack = 1
let g:haskell_indent_disable = 1
let g:haskell_disable_TH = 1
