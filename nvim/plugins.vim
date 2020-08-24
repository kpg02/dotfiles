" Colorscheme
Plug 'dracula/vim', { 'as': 'dracula' }

" Enhance vim
Plug 'tmhedberg/matchit' " Enhance % usage
Plug 'tpope/vim-repeat' " Enhance . usage
Plug 'nathanaelkane/vim-indent-guides'
Plug 'preservim/nerdcommenter' " Comment block of code
Plug 'jiangmiao/auto-pairs'
Plug 'wellle/targets.vim' " Enhance the use of ci ...
Plug 'tpope/vim-surround'
Plug 'bronson/vim-trailing-whitespace'

" Navigation
Plug 'preservim/nerdtree'
Plug 'mileszs/ack.vim' " Search text inside files
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'bling/vim-bufferline'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'

" Markdown & HTML
Plug 'AndrewRadev/tagalong.vim' " Rename both tags
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" Autocomplete & Syntax
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-python/python-syntax'
Plug 'honza/vim-snippets'
