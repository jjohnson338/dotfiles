" Set up vim plugins
call plug#begin('~/.vim/plugged')

" Autocompletions
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neosnippet.vim'

"Style
Plug 'vim-airline/vim-airline'
Plug 'joshdick/onedark.vim'

" Utility
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'jiangmiao/auto-pairs' " Pairs
Plug 'kristijanhusak/defx-icons'
Plug 'mhinz/vim-startify' "Home page
Plug 'pgdouyon/vim-evanesco' "Better buffer searching
Plug 'simeji/winresizer' " Resizing
Plug 'tpope/vim-commentary' " Comments
Plug 'numtostr/FTerm.nvim' "Terminal

" Source control
Plug 'airblade/vim-gitgutter'
Plug 'kristijanhusak/defx-git'
Plug 'tpope/vim-fugitive'

" Syntax
Plug 'sheerun/vim-polyglot'
Plug 'JulesWang/css.vim',             { 'for': 'css' }
Plug 'hoffstein/vim-tsql'
Plug 'OrangeT/vim-csharp'

"Linting
Plug 'dense-analysis/ale'

call plug#end()
