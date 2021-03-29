" Config

let mapleader=" "
set autowrite
set timeoutlen=300
set signcolumn=yes
set updatetime=300
set shortmess+=c
set backspace=2
set encoding=utf-8
set expandtab
set hidden
set incsearch
set modelines=0
set nobackup
set noerrorbells
set nojoinspaces
set nomodeline
set noswapfile
set nowrap
set nowritebackup
set nu relativenumber
set ruler
set scrolloff=5
set shiftwidth=4 softtabstop=4 tabstop=4
set showcmd
set sidescroll=10
set smartcase
set smartindent
set splitbelow splitright

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=LightRed

filetype plugin indent on
syntax on


" Bindings
nnoremap gb :bn<CR>
nnoremap gB :bp<CR>
nnoremap <silent>ña :noh<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
nnoremap <silent><leader>fi :retab!<CR>
nnoremap ñi gg=G<C-o>

" Install vim-plug if missing
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif


" Plugins
call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'Yggdroot/indentLine'
Plug 'andymass/vim-matchup'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'wellle/targets.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'

Plug 'luochen1990/rainbow'
Plug 'arcticicestudio/nord-vim'
call plug#end()

let g:rainbow_active=1

" Remove trailing whitespace at the end of the line
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    keepp %s/\s\+$//e
    call cursor(l,c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

colorscheme nord
