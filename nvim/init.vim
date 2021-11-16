call plug#begin(stdpath('data').'/plugged')
"  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"  Plug 'neovimhaskell/haskell-vim'
"  Plug 'bitc/vim-hdevtools'
"  Plug 'dense-analysis/ale'
"  Plug 'jpalardy/vim-slime', { 'rtp': 'ftplugin/haskell' }
"  Plug 'majutsushi/tagbar'
  Plug 'neoclide/coc.nvim', { 'branch':'release' }
  Plug 'vim-utils/vim-man'
  Plug 'dm1try/golden_size'
  Plug 'wellle/tmux-complete.vim'
  Plug 'hasufell/ghcup.vim'
  Plug 'rbgrouleff/bclose.vim'
  Plug 'neovim/nvim-lspconfig'
call plug#end()
source ~/.vimrc
lua << EOF
require'lspconfig'.pyright.setup{}
require'lspconfig'.bashls.setup{}
require'lspconfig'.jsonls.setup{}
EOF
" inoremap <expr> <TAB> pumvisible() ? "\<c-n>" : "\<TAB>"
" inoremap <expr> <S-TAB> pumvisible() ? "\<c-p>" : "\<S-TAB>"
nnoremap <silent> <leader>h :call CocActionAsync('doHover')<cr>
nnoremap <silent> <leader>g :call CocActionAsync('codeLensAction')<cr>
nmap <leader>qf  <Plug>(coc-codeaction-selected)
" this line will make enter autofill, but it sucks when typing out comments
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
"                               \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" for tags in new windows, nice but ends up with too many windows over time
" nnoremap <silent> <C-]> <C-w><C-]><C-w>T
nnoremap <silent> <C-]> <C-w><C-]>

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <silent> gp <Plug>(coc-float-jump)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('definitionHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" haskell fast-tags on exit of .hs files
autocmd BufWritePost *.hs silent :! fast-tags -R ./

nnoremap <silent><nowait><expr> <C-l> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-l>"
nnoremap <silent><nowait><expr> <C-h> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-h>"
inoremap <silent><nowait><expr> <C-l> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-h> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-l> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-l>"
vnoremap <silent><nowait><expr> <C-h> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-h>"

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

  
" nnoremap <C-W><C-V>f :exec "vert norm <C-V><C-W>f"<CR>
" nnoremap <C-W><C-V>[ :exec "vert norm <C-V><C-W>["<CR>
nnoremap <c-w>F <c-w>vgf
nnoremap <c-w>[ <c-w>v<c-]>
nnoremap <silent> <C-h> :wincmd h<CR>
nnoremap <silent> <C-j> :wincmd j<CR>
nnoremap <silent> <C-k> :wincmd k<CR>
nnoremap <silent> <C-l> :wincmd l<CR>
nnoremap <leader>u :GHCup<CR>
au FileType * set fo-=c fo-=r fo-=o
"au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
"au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>
"au FileType haskell nnoremap <buffer> <silent> <F3> :HdevtoolsInfo<CR>
:hi CocCodeLens guifg=#ffffff
"let g:hdevtools_stack = 1
"let g:hdevtools_options = '-g-Wall -g-fdefer-type-errors'
" let g:deoplete#enable_at_startup = 1
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

set mouse=a

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
