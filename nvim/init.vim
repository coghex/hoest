set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
call plug#begin('~/.local/share/nvim/plugged')
if has ('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'deoplete-plugins/deoplete-tag'
else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
    Plug 'deoplete-plugins/deoplete-tag'
endif
let g:deoplete#enable_at_startup = 1
call plug#end()
source ~/.vimrc
inoremap <expr> <TAB> pumvisible() ? "\<c-n>" : "\<TAB>"
inoremap <expr> <S-TAB> pumvisible() ? "\<c-p>" : "\<S-TAB>"
