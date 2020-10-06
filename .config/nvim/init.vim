" Neovim Config

let mapleader=" "
set autowrite
set timeoutlen=300
set signcolumn=yes
set updatetime=300
set shortmess+=c
set backspace=2
set cmdheight=2
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


" Neovim Config END

" Bindings

nnoremap <silent> ññ :<c-u>call matchup#motion#find_matching_pair(0, 1)<cr>
nnoremap gb :bn<CR>
nnoremap gB :bp<CR>
nnoremap <silent>ña :noh<CR>
map Ñ <esc>
map! Ñ <esc>
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

" Bindings END


" Plugins

call plug#begin('~/.config/nvim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'Yggdroot/indentLine'
Plug 'andymass/vim-matchup'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'wellle/targets.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'Shougo/denite.nvim'

Plug 'luochen1990/rainbow' " Rainbow Brackets
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'honza/vim-snippets'
Plug 'AndrewRadev/tagalong.vim'
Plug 'yuezk/vim-js'
Plug 'dense-analysis/ale'
Plug 'ap/vim-css-color'

call plug#end()
"Plugins END



" ==========Plugins Config==============


" ##DENITE

try
    call denite#custom#var('file/rec', 'command', ['rg', '--files', '--glob', '!.git'])
    " Use ripgrep in place of "grep"
    call denite#custom#var('grep', 'command', ['rg'])

    call denite#custom#var('grep', 'default_opts', ['--hidden', '--vimgrep', '--heading', '-S'])

    call denite#custom#var('grep', 'recursive_opts', [])
    call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
    call denite#custom#var('grep', 'separator', ['--'])
    call denite#custom#var('grep', 'final_opts', [])

    call denite#custom#var('buffer', 'date_format', '')

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

" ===  shorcuts === "
"   ;         - Browser currently open buffers
"   <leader>t - Browse list of files in current directory
"   <leader>g - Search current directory for occurences of given term and close window if no results
"   <leader>j - Search current directory for occurences of word under cursor
nmap <silent>; :Denite buffer<CR>
nmap <silent><leader>t :DeniteProjectDir file/rec<CR>
nnoremap <silent><leader>g :<C-u>Denite grep:. -no-empty<CR>
nnoremap <silent><leader>j :<C-u>DeniteCursorWord grep:.<CR>

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

" ##DENITE END

" ##ALE
nnoremap <silent> gk :ALEPreviousWrap<cr>
nnoremap <silent> gj :ALENextWrap<cr>
nnoremap <silent> <leader>aa :copen<cr>
nnoremap <silent> <leader>ac :cclose<cr>
let g:ale_set_loclist=0
let g:ale_set_quickfix=1
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
            \'scss': ['csslint','stylelint'],
            \'vim': ['vimls'],
            \'xml': ['xmllint'],
            \'java': ['checkstyle'],
            \'kotlin': ['kotlinc'],
            \'lua': ['luac'],
            \'markdown': ['markdownlint'],
            \'python': ['flake8']
            \}
" ##ALE END

" ##COC

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
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif


nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction
autocmd CursorHold * silent call CocActionAsync('highlight')
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)


augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>




let g:coc_global_extensions = [
            \ 'coc-json',
            \ 'coc-html',
            \ 'coc-css',
            \ 'coc-emmet',
            \ 'coc-phpls',
            \ 'coc-jedi',
            \ 'coc-tsserver',
            \ 'coc-vimlsp',
            \ 'coc-pyright',
            \ 'coc-sh',
            \ 'coc-java',
            \ 'coc-snippets',
            \]

inoremap <silent><expr> ñ<TAB>
            \ pumvisible() ? coc#_select_confirm() :
            \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()

let g:coc_snippet_next = 'ñ<tab>'
" ##COC END

" ##RAINBOW
let g:rainbow_active=1

" ##RAINBOW END

" ==========Plugins Config END==========
"

fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    keepp %s/\s\+$//e
    call cursor(l,c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()


autocmd FileType html set syntax=htmldjango
set notermguicolors
colorscheme dracula
"
