let g:AutoPairsFlyMode = 1
let g:AutoPairsShortcutBackInsert = "çç"
let g:AutoPairsShortcutFastWrap = "çñ"
let g:AutoPairsShortcutToggle = "çt"
let g:NERDSpaceDelims = 1
let g:ctrlp_user_caching = 0
let g:mkdp_auto_start = 1
let g:mkdp_open_ip = "192.168.0.20"
let g:mkdp_open_to_the_world = 1
let g:mkdp_port = "1234"
let g:netrw_banner = 0
let g:netrw_browser_split=2
let g:netrw_winsize = 25
let g:rainbow_active = 1

let g:coc_global_extensions = [
            \ 'coc-marketplace',
            \ 'coc-jedi',
            \ 'coc-eslint',
            \ 'coc-emmet',
            \ 'coc-tsserver',
            \ 'coc-sh',
            \ 'coc-python',
            \ 'coc-markdownlint',
            \ 'coc-json',
            \ 'coc-css',
            \ 'coc-prettier',
            \ 'coc-snippets',
            \ 'coc-stylelintplus',
            \ ]




autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
command! -nargs=0 Prettier :CocCommand prettier.formatFile
