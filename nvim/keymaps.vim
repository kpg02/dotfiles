let mapleader = " "
let g:AutoPairsShortcutBackInsert = "çç"
let g:AutoPairsShortcutToggle = "çt"
let g:AutoPairsShortcutFastWrap = "çñ"
let g:coc_snippet_next = 'ñ<tab>'
" let g:coc_snippet_prev = 'ñp'

inoremap <expr> q ((pumvisible())?("\<C-p>"):("q"))
inoremap <expr> ññ pumvisible() ? "\<C-e>" : "\<esc>"

inoremap <silent><expr> ñ<TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()


function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <c-space> coc#refresh()

if exists('*complete_info')
    inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif


nnoremap <S-Tab> gT
nnoremap <Tab> gt
nnoremap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gi <Plug>(coc-implementation)
nnoremap <silent> gr <Plug>(coc-references)
nnoremap <silent> gy <Plug>(coc-type-definition)
nnoremap <silent> ñbc :bc<CR>
nnoremap <silent> ñcc :bd<CR>
nnoremap <silent> ñj <Plug>(coc-diagnostic-next)
nnoremap <silent> ñk <Plug>(coc-diagnostic-prev)
nnoremap <silent> ñn :bn<CR>
nnoremap <silent> ño :bp<CR>
nnoremap <silent>ña :noh <CR>
nnoremap ñf <Plug>(coc-format-selected)
nnoremap ñi gg=G<C-o>
nnoremap ñt :NERDTreeToggle<CR>
nnoremap ñç %


vnoremap ñf <Plug>(coc-format-selected)
vnoremap ññ <ESC>
