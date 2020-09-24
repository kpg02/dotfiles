" (*) significa que esa opción ya viene por defecto en nvim (al menos en la
" versión que uso, >0.4)

set encoding=utf-8 " (*)
let mapleader = " " " Pongo <leader> al espacio
set autowrite " Escribe el archivo con :write antes de ejecutar un comando
set sidescrolloff=10 " Al mover hacia la derecha fuerza que siempre haya 10 columnas mínimo a la derecha
set scrolloff=3
set splitbelow splitright " Al hacer el split hace hacia abajo o hacia la derecha
set backspace=2 " Activa la tecla de borrar en modo insertar (*)
set cmdheight=2 " Pone el espacio de comandos a dos filas
set hidden " Deja que haya buffers en segundo plano sin guardar
set incsearch " Muestra las ocurrencias según voy escribiendo
set nomodeline " Desactiva modelines para evitar modelines malintencionados
set modelines=0
set nobackup " Desactiva los backups del archivo a editar
set noerrorbells " Evita que suene la campana al hacer una mala acción
set nojoinspaces " Evita que al unir dos líneas con J ponga doble espacio
set noswapfile " Evita archivo swap
set nowrap " Evita que las líneas metan un salto de línea visual para no salir de la pantalla
set nowritebackup " Evita que se cree archivo de backup
set nu relativenumber " Muestra el número absoluto junto a la línea y el resto de líneas los muestra relativo
set ruler " Muestra la posición del cursor en la barra de estado (*)
set showcmd " Muestra las teclas presionada para ejecutar los comandos (*)
set smartcase " Case sensitive


" Borde de los 80 caracteres
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey


" Mapeos normales La explicación de cada uno es el comentario de la línea
" siguiente
nnoremap <silent> ññ :<c-u>call matchup#motion#find_matching_pair(0, 1)<cr>
" uso dos veces la ñ como % (usando el plugin matchup), salta al siguiente par, ejemplo entre dos
" paréntesis, tanto del ( a ) como ) a (, así con todos los pares {}
nnoremap gb :bn<CR>
nnoremap gB :bp<CR>
" cambiar entre buffers rápidamente go buffer => gb
nnoremap <silent>ña :noh<CR>
" No tiene explicación el ña, simplmenete me acostumbré

nnoremap <leader>rt vat<ESC>dd<C-o>dd
" borra la etiqueta sonbre la que estoy y su cierre


map Ñ <esc>
map! Ñ <esc>
" Ñ para salir de cualquier modo


" Mapeo de ctrl + tecla de navegación de ventan para moverme desde el modo
" normal o terminal sobre las ventanas
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

let g:ale_disable_lsp = 1 " Compatibilidad perfecta con CoC
let g:ale_sign_highlight_linenrs = 1
" === Plugins
filetype plugin indent on
syntax on

call plug#begin('~/.config/nvim/plugged')

Plug 'airblade/vim-gitgutter' " Muestra símbolo de git de cambiado, añadido o borrado
Plug 'bling/vim-bufferline' " Buffers en la status bar de airline
Plug 'sainnhe/sonokai' " ColorScheme
Plug 'vim-airline/vim-airline' " Status bar

Plug 'jiangmiao/auto-pairs' " Auto parejas
Plug 'nathanaelkane/vim-indent-guides' " Añade lineas para la indentación
Plug 'andymass/vim-matchup' " Mejora el uso de %
Plug 'tpope/vim-commentary' " gcc para comentar lineas
Plug 'tpope/vim-repeat' " Extiende el uso de '.'
Plug 'tpope/vim-surround' " añade los comandos de cs ys y ds para cambiar añadir o borrar los surrounds ('',(),{}...)
Plug 'wellle/targets.vim' " Añade más objetos de texto

" Plug 'junegunn/fzf', {'do': { -> fzf#install() }} " FZF para buscar archivos
" Plug 'junegunn/fzf.vim'
Plug 'Shougo/denite.nvim' " fzf y más, necesitará ripgrep instalado.
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'luochen1990/rainbow' " Pone de colores las parejas de ()
Plug 'AndrewRadev/tagalong.vim' " Cambia etiquetas HTML/XML de aperturar y cierre a la vez
Plug 'iamcco/markdown-preview.nvim', {'do' : { -> mkdp#util#install() }, 'for' : ['markdown', 'vim-plug']} " Preview de markdown en el navegador
Plug 'valloric/MatchTagAlways' " Muestra apertura y cierre de etiquetas HTML/XML subrayadas
Plug 'neoclide/coc.nvim', {'branch': 'release'} " CoC autocompletar
Plug 'Vimjas/vim-python-pep8-indent' " Mejora la indentación para seguir el pep8
Plug 'honza/vim-snippets' " Añade snippets para coc-snippets
Plug 'yuezk/vim-js' " Añade syntax highlighting para JS (bueno)
Plug 'dense-analysis/ale' " Añade linting
Plug 'ap/vim-css-color' " Muestra el color css
" Plug 'moll/vim-node' " Añade gf para ir al archivo del módulo de nodejs

call plug#end()

" Configuración de color scheme
set notermguicolors " Evita que terminal.app (terminal por defecto de OSX, el cual no tiene true color) ponga el fondo de un color que no es
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 1
colorscheme sonokai

" Configuración de airline
let g:bufferline_echo = 0 " Deshabilita la lista de buffers en el cmdline

" La siguiente función borra los espacios al final de la línea
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    keepp %s/\s\+$//e
    call cursor(l,c)
endfun

" Hace que cada vez que se guarde un buffer se ejecute la función antes
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()


" AutoPairs
let g:AutoPairsFlyMode = 1 " Añade fly mode para que al escribir un cierre de un par salte al siguiente cerrado
let g:AutoPairsShortcutToggle = 'ñp'
let g:AutoPairsShortcutBackInsert =  'ñ-'
" presionando la tilde y la ñ vuelvo a la posición anterior
" y escribo la etiqueta de cerrado ('evita' el efecto del FlyMode)

" === Indentación
autocmd VimEnter,ColorScheme * :hi IndentGuidesEven ctermbg=6
autocmd VimEnter,ColorScheme * :hi IndentGuidesOdd ctermbg=4
" Pone dos colores para la indentación uno para pares y otro para impares
let g:indent_guides_enable_on_vim_startup=1 " Inicia el plugin al inicio
let g:indent_guides_guide_size=1 " Hace que la guía del indentado sea de una columna

nnoremap <leader>fi :retab!<CR>
" <leader>fi de fix indentation para arreglar la indentación, cambia de tab a
" espacio con la configuración de este archivo

nnoremap ñi gg=G<C-o>
" Indenta correctamente el archivo a trabjar
set expandtab " Pone los tabs a espacios
set shiftwidth=4 softtabstop=4 tabstop=4 " Hace que la indentación sea de 4 espacios
set smartindent " Indentación inteligente



nnoremap <C-p> :Files<CR>
" Ctrl p para abrir fzf
let g:fzf_preview_window = 'right:60%' " Fuerza la preview del archivo tenga el ancho de columnas que tenga el terminal

let g:mkdp_open_to_the_world = 1 " abre el servidor de markdown a la red local
let g:mkdp_open_ip = '192.168.0.20' " Ip local de mi portátil
nnoremap <leader>pm :MarkdownPreview<CR>
" <leader>pm para abrir la preview de markdown PreviewMarkdown

nnoremap ñt :NERDTreeToggle<cr>
" ñt para abrir y cerrar nerdtree

let g:rainbow_active = 1 " Activa rainbow para los paréntesis



" === CoC Config Copia y pega de la documentación para tener auto completar
" con el tab y seleccionar con el espacio
set timeoutlen=300
set updatetime=300
set shortmess+=c

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


" GoTo code navigation.

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>


function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <leader>rn <Plug>(coc-rename)
xmap <leader>ff  <Plug>(coc-format-selected)
nmap <leader>ff  <Plug>(coc-formannselected)

" === CoC Config


" Instala las extensiones de coc si estas no están instaladas
let g:coc_global_extensions = [
            \ 'coc-json',
            \ 'coc-html',
            \ 'coc-css',
            \ 'coc-emmet',
            \ 'coc-phpls',
            \ 'coc-jedi',
            \ 'coc-tsserver',
            \ 'coc-vimlsp',
            \ 'coc-sh',
            \ 'coc-java',
            \ 'coc-snippets',
            \]




inoremap <silent><expr> ñ<TAB>
            \ pumvisible() ? coc#_select_confirm() :
            \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = 'ñ<tab>'



" ALE
nnoremap <silent> gk :ALEPreviousWrap<cr>
nnoremap <silent> gj :ALENextWrap<cr>
nnoremap <silent> <leader>gg :ALEDetail<cr>
let g:ale_set_highlights = 1
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_list_vertical = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_column_always = 1
let g:ale_fixers={
            \'javascript':['prettier', 'eslint'],
            \'css':['prettier'],
            \'scss':['prettier'],
            \'markdown':['prettier'],
            \'json':['fixjson'],
            \'python':['yapf', 'autopep8', 'isort']
            \}
let g:ale_fix_on_save = 1
let g:ale_linters={
            \'javascript': ['tsserver'],
            \'bash': ['language-server'],
            \'css': ['csslint'],
            \'vim': ['vimls'],
            \'xml': ['xmllint'],
            \'scss': ['stylelint'],
            \'java': ['checkstyle'],
            \'kotlin': ['kotlinc'],
            \'lua': ['luac'],
            \'markdown': ['markdownlint'],
            \'python': ['flake8']
            \}


" ========================================================================
" DENITE
" ========================================================================

" Wrap in try/catch to avoid errors on initial install before plugin is available
try
    " === Denite setup ==="
    " Use ripgrep for searching current directory for files
    " By default, ripgrep will respect rules in .gitignore
    "   --files: Print each file that would be searched (but don't search)
    "   --glob:  Include or exclues files for searching that match the given glob
    "            (aka ignore .git files)
    "
    call denite#custom#var('file/rec', 'command', ['rg', '--files', '--glob', '!.git'])

    " Use ripgrep in place of "grep"
    call denite#custom#var('grep', 'command', ['rg'])

    " Custom options for ripgrep
    "   --vimgrep:  Show results with every match on it's own line
    "   --hidden:   Search hidden directories and files
    "   --heading:  Show the file name above clusters of matches from each file
    "   --S:        Search case insensitively if the pattern is all lowercase
    call denite#custom#var('grep', 'default_opts', ['--hidden', '--vimgrep', '--heading', '-S'])

    " Recommended defaults for ripgrep via Denite docs
    call denite#custom#var('grep', 'recursive_opts', [])
    call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
    call denite#custom#var('grep', 'separator', ['--'])
    call denite#custom#var('grep', 'final_opts', [])

    " Remove date from buffer list
    call denite#custom#var('buffer', 'date_format', '')

    " Custom options for Denite
    "   auto_resize             - Auto resize the Denite window height automatically.
    "   prompt                  - Customize denite prompt
    "   direction               - Specify Denite window direction as directly below current pane
    "   winminheight            - Specify min height for Denite window
    "   highlight_mode_insert   - Specify h1-CursorLine in insert mode
    "   prompt_highlight        - Specify color of prompt
    "   highlight_matched_char  - Matched characters highlight
    "   highlight_matched_range - matched range highlight
    let s:denite_options = {'default' : {
                \ 'split': 'floating',
                \ 'start_filter': 1,
                \ 'auto_resize': 1,
                \ 'source_names': 'short',
                \ 'prompt': 'λ ',
                \ 'highlight_matched_char': 'QuickFixLine',
                \ 'highlight_matched_range': 'Visual',
                \ 'highlight_window_background': 'Visual',
                \ 'highlight_filter_background': 'DiffAdd',
                \ 'winrow': 1,
                \ 'vertical_preview': 1
                \ }}

    " Loop through denite options and enable them
    function! s:profile(opts) abort
        for l:fname in keys(a:opts)
            for l:dopt in keys(a:opts[l:fname])
                call denite#custom#option(l:fname, l:dopt, a:opts[l:fname][l:dopt])
            endfor
        endfor
    endfunction

    call s:profile(s:denite_options)
catch
    echo 'Denite not installed. It should work after running :PlugInstall'
endtry

" === Denite shorcuts === "
"   ;         - Browser currently open buffers
"   <leader>t - Browse list of files in current directory
"   <leader>g - Search current directory for occurences of given term and close window if no results
"   <leader>j - Search current directory for occurences of word under cursor
nmap <silent>; :Denite buffer<CR>
nmap <silent><leader>t :DeniteProjectDir file/rec<CR>
nnoremap <silent><leader>g :<C-u>Denite grep:. -no-empty<CR>
nnoremap <silent><leader>j :<C-u>DeniteCursorWord grep:.<CR>

" Define mappings while in 'filter' mode
"   <C-o>         - Switch to normal mode inside of search results
"   <Esc>         - Exit denite window in any mode
"   <CR>          - Open currently selected file in any mode
"   <C-t>         - Open currently selected file in a new tab
"   <C-v>         - Open currently selected file a vertical split
"   <C-h>         - Open currently selected file in a horizontal split
autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
    imap <silent><buffer> <C-o>
                \ <Plug>(denite_filter_quit)
    inoremap <silent><buffer><expr> <Esc>
                \ denite#do_map('quit')
    nnoremap <silent><buffer><expr> <Esc>
                \ denite#do_map('quit')
    inoremap <silent><buffer><expr> <CR>
                \ denite#do_map('do_action')
    inoremap <silent><buffer><expr> <C-t>
                \ denite#do_map('do_action', 'tabopen')
    inoremap <silent><buffer><expr> <C-v>
                \ denite#do_map('do_action', 'vsplit')
    inoremap <silent><buffer><expr> <C-h>
                \ denite#do_map('do_action', 'split')
endfunction

" Define mappings while in denite window
"   <CR>        - Opens currently selected file
"   q or <Esc>  - Quit Denite window
"   d           - Delete currenly selected file
"   p           - Preview currently selected file
"   <C-o> or i  - Switch to insert mode inside of filter prompt
"   <C-t>       - Open currently selected file in a new tab
"   <C-v>       - Open currently selected file a vertical split
"   <C-h>       - Open currently selected file in a horizontal split
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
    nnoremap <silent><buffer><expr> <CR>
                \ denite#do_map('do_action')
    nnoremap <silent><buffer><expr> q
                \ denite#do_map('quit')
    nnoremap <silent><buffer><expr> <Esc>
                \ denite#do_map('quit')
    nnoremap <silent><buffer><expr> d
                \ denite#do_map('do_action', 'delete')
    nnoremap <silent><buffer><expr> p
                \ denite#do_map('do_action', 'preview')
    nnoremap <silent><buffer><expr> i
                \ denite#do_map('open_filter_buffer')
    nnoremap <silent><buffer><expr> <C-o>
                \ denite#do_map('open_filter_buffer')
    nnoremap <silent><buffer><expr> <C-t>
                \ denite#do_map('do_action', 'tabopen')
    nnoremap <silent><buffer><expr> <C-v>
                \ denite#do_map('do_action', 'vsplit')
    nnoremap <silent><buffer><expr> <C-h>
                \ denite#do_map('do_action', 'split')
endfunction

" ========================================================================
" DENITE
" ========================================================================


autocmd FileType html set syntax=htmldjango
autocmd FileType javascript set foldmethod=syntax
