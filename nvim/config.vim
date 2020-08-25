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
let g:python_highlight_all = 1
let g:rainbow_active = 1

let g:ale_set_highlights = 1
let g:ale_linters = {
      \   'python': ['flake8'],
      \}
let g:ale_fixers = {
    \ 'python':['yapf'],
    \}

let g:ale_fix_on_save = 1


let g:coc_global_extensions = [
            \ 'coc-css',
            \ 'coc-emmet',
            \ 'coc-eslint',
            \ 'coc-java',
            \ 'coc-json',
            \ 'coc-markdownlint',
            \ 'coc-marketplace',
            \ 'coc-phpls',
            \ 'coc-prettier',
            \ 'coc-python',
            \ 'coc-sh',
            \ 'coc-snippets',
            \ 'coc-stylelintplus',
            \ 'coc-tsserver',
            \ 'coc-vimlsp',
            \ ]




command! -nargs=0 Prettier :CocCommand prettier.formatFile






" function! LinterStatus() abort
  " let l:counts = ale#statusline#Count(bufnr(''))

  " let l:all_errors = l:counts.error + l:counts.style_error
  " let l:all_non_errors = l:counts.total - l:all_errors

  " return l:counts.total == 0 ? '✨ all good ✨' : printf(
        " \   '😞 %dW %dE',
        " \   all_non_errors,
        " \   all_errors
        " \)
" endfunction

" set statusline=
" set statusline+=%m
" set statusline+=\ %f
" set statusline+=%=
" set statusline+=\ %{LinterStatus()}
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \}
