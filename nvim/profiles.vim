" === Profile Configuration ===


filetype plugin on
syntax enable

" === Color Scheme
colorscheme dracula
set background=dark

" === options
set background=dark
set cmdheight=2
set cursorline
set expandtab " Convierte el tab a espacios
set hidden
set incsearch " Muestra el siguiente match de la busqueda
set nobackup " No hace .ext~ como copia del archivo a editar en el buffer
set noerrorbells " No hace el sonido de error
set nojoinspaces " Evita que al hacer Join se pongan dos espacios
set nostartofline
set noswapfile " Evita .swp para el buffer
set nowrap " Evita salto de línea para no salirse de la pantalla
set nu
set nowritebackup
set relativenumber " Número relativo que cuente la línea, mantiene el 0 en la línea en la que este
set ruler
set shiftwidth=4 " Pone cuantos espacios hace << o >>
set shortmess+=c
set sidescroll=8
set smartcase " Case sensitive
set smartindent " Indentación 'inteligente'
set splitbelow " Split horizontal hacia abajo
set splitright " Split vertical a la derecha
set tabstop=4 softtabstop=4 " Tab a 4 espacios
set timeoutlen=500
set updatetime=300
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
    " Recently vim can merge signcolumn and number column into one
    set signcolumn=number
else
    set signcolumn=yes
endif

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://zsh
  resize 5
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>
