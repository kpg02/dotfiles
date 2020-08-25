" Colorscheme
Plug 'dracula/vim', { 'as': 'dracula' }

" Enhance vim
Plug 'bronson/vim-trailing-whitespace'
Plug 'jiangmiao/auto-pairs'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'preservim/nerdcommenter' " Comment block of code
Plug 'tmhedberg/matchit' " Enhance % usage
Plug 'tpope/vim-repeat' " Enhance . usage
Plug 'tpope/vim-surround'
Plug 'wellle/targets.vim' " Enhance the use of ci ...

" Navigation
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim' " Search text inside files
Plug 'ryanoasis/vim-devicons'

" Markdown & HTML
Plug 'AndrewRadev/tagalong.vim' " Rename both tags
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" Autocomplete & Syntax
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'dense-analysis/ale'
Plug 'honza/vim-snippets'
Plug 'luochen1990/rainbow'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'numirias/semshi'
Plug 'valloric/MatchTagAlways'
Plug 'moll/vim-node'
Plug 'yuezk/vim-js'
