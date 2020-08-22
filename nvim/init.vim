syntax on

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set relativenumber
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin()

Plug 'morhetz/gruvbox'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'jiangmiao/auto-pairs'
Plug 'powerline/powerline'
Plug 'bling/vim-bufferline'
Plug 'preservim/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'bronson/vim-trailing-whitespace'
Plug 'tpope/vim-surround'
Plug 'mbbill/undotree'
Plug 'wellle/targets.vim'
call plug#end()

colorscheme gruvbox
set background=dark

let mapleader = " "
let g:netrw_browser_split=2
let g:netrw_banner = 0
let g:netrw_winsize = 25
let g:ctrlp_user_caching = 0
let g:mkdp_auto_start = 1
let g:mkdp_open_to_the_world = 1
let g:mkdp_open_ip = "192.168.0.20"
let g:mkdp_port = "1234"
let g:AutoPairsFlyMode = 1
let g:AutoPairsShortcutBackInsert = "çç"
nnoremap ñi gg=G<C-o>
nnoremap <silent>ña :noh <CR>
"nnoremap ññ <c-g>


vnoremap ññ <ESC>
inoremap <expr> q ((pumvisible())?("\<C-p>"):("q"))
inoremap <expr> ññ pumvisible() ? "\<C-e>" : "\<esc>"
nnoremap ñt :NERDTreeToggle<CR>
nnoremap <silent> ñn :bn<CR>
nnoremap <silent> ño :bp<CR>
nnoremap <silent> ñbc :bc<CR>
nnoremap <silent> ñcc :bd<CR>
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap ñf <Plug>(coc-format-selected)
vnoremap ñf <Plug>(coc-format-selected)
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


" cocconfig
" TextEdit might fail if hidden is not set.
set hidden
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
" Give more space for displaying messages.
set cmdheight=2
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
    " Recently vim can merge signcolumn and number column into one
    set signcolumn=number
else
    set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
else
    inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
    inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif


nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> ñk <Plug>(coc-diagnostic-prev)
nmap <silent> ñj <Plug>(coc-diagnostic-next)







