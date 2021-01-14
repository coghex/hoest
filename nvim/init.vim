call plug#begin(stdpath('data').'/plugged')
"  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'neovimhaskell/haskell-vim'
"  Plug 'bitc/vim-hdevtools'
"  Plug 'dense-analysis/ale'
"  Plug 'jpalardy/vim-slime', { 'rtp': 'ftplugin/haskell' }
"  Plug 'majutsushi/tagbar'
  Plug 'neoclide/coc.nvim', { 'branch':'release' }
  Plug 'vim-utils/vim-man'
  Plug 'dm1try/golden_size'
  Plug 'wellle/tmux-complete.vim'
call plug#end()
source ~/.vimrc
inoremap <expr> <TAB> pumvisible() ? "\<c-n>" : "\<TAB>"
inoremap <expr> <S-TAB> pumvisible() ? "\<c-p>" : "\<S-TAB>"
nnoremap <silent> <leader>h :call CocActionAsync('doHover')<cr>
nnoremap <silent> <leader>g :call CocActionAsync('codeLensAction')<cr>
nnoremap <silent> <leader>d :call CocActionAsync('codeLensAction')<cr>
"au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
"au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>
"au FileType haskell nnoremap <buffer> <silent> <F3> :HdevtoolsInfo<CR>
:hi CocCodeLens guifg=#ffffff
"let g:hdevtools_stack = 1
"let g:hdevtools_options = '-g-Wall -g-fdefer-type-errors'
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
"let g:ale_linters = {'haskell': 'all'}
"let g:ale_lint_on_text_changed = 'never'
"let g:ale_lint_on_insert_leave = 0
"let g:ale_lint_on_enter = 0
"let g:tagbar_ctags_bin = '/home/jari/.cabal/bin/fast-tags'
"let g:slime_target = 'haskell'

