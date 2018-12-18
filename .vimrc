" Tell Vim as early as possible not to try to emulate vi
set nocompatible

" To update Plugins :PlugUpdate

" Set up vim plugins
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
" Plug 'Shougo/unite.vim'
" Plug 'Shougo/vimfiler.vim'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
"Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'godlygeek/tabular'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-scripts/dbext.vim'
Plug 'tpope/vim-commentary'
Plug 'simeji/winresizer'
Plug 'vim-syntastic/syntastic'

" Syntax
"Plug 'pearofducks/ansible-vim'
Plug 'JulesWang/css.vim',             { 'for': 'css' }
Plug 'pangloss/vim-javascript',       { 'for': 'javascript' }
"Plug 'mxw/vim-jsx',                   { 'for': 'javascript' }
"Plug 'chr4/nginx.vim'
"Plug 'stephpy/vim-yaml',              { 'for': 'yaml' }
Plug 'GutenYe/json5.vim',             { 'for': 'json5' }
Plug 'hoffstein/vim-tsql'
Plug 'OrangeT/vim-csharp'

" Themes
Plug 'joshdick/onedark.vim'

call plug#end()

let mapleader=" "
let g:NERDTreeDirArrows = 0
let g:jsx_ext_required = 0
set background=dark       "make sure vim knows bg is dark
set showmode              "display current mode
set showcmd               "display partially typed commands
set title
set nowrap                "dont wrap long lines
set noswapfile            "turn off swap files
set shiftround            "Round indent to multiple of 'shiftwidth'
set ruler                 "turn of position on bottom
set number                "turn on line numbers
set showmatch             "highlight matching brackets
set nobackup              "backups are for wimps
set noundofile            "same as the line above says
set pastetoggle=<F12>     "press when pasting multiple lines set backspace=indent,eol,start set title                 "set the terminal title to the filename
set scrolloff=9           "start scrolling when hits this many lines from edge
set showtabline=2         "always show tab bar
set visualbell
set updatetime=250
set nocursorline
set nocursorcolumn
set norelativenumber
set shell=sh

" Folds
"set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2

" Indentation settings, gave up on editorconfig
set expandtab
set shiftwidth=2
set tabstop=2

" Don't complain if the colorscheme isn't set
silent! colorscheme onedark
let g:onedark_termcolors = 256
hi TabLineSel ctermfg=Magenta ctermbg=DarkGrey
"calls sudo and asks for password if necessary
cmap w!! %!sudo tee > /dev/null %

" GVim options
set guioptions=agit
set guifont=Inconsolata\ Bold\ 10

" Smash JK in insert mode to revert to normal mode
inoremap jk <ESC>
inoremap kj <ESC>

" Nerdtree options
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | VimFiler -buffer-name=explorer -split -simple -winwidth=50 -toggle -no-quit | endif
let NERDTreeShowHidden=1

" NERDTree Git Options
" let g:NERDTreeGitStatusIgnoreSubmodules = 'all'
" let g:NERDTreeShowIgnoredStatus = 0

" Vimfiler options
" let g:vimfiler_as_default_explorer = 1
" let g:vimfiler_expand_jump_to_first_child = 0
" let g:vimfiler_no_default_key_mapping = 1
" let g:vimfiler_ignore_pattern = '^\%(\.DS_Store\)$'
" let g:vimfiler_tree_leaf_icon = ' '
" let g:vimfiler_tree_opened_icon = '▾'
" let g:vimfiler_tree_closed_icon = '▸'
" let g:vimfiler_file_icon = '-'
" let g:vimfiler_marked_file_icon = '*'

" Vimfiler keybinds
"nmap <buffer> p <Plug>(vimfiler_jump_first_child)

" Linting
"let g:ale_javascript_eslint_use_global=1
"let g:airline#extensions#ale#enabled=1
"let g:ale_lint_on_text_changed = 'never'
"let g:ale_sign_column_always = 1
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']

map <Leader>n :tabnew<CR>
map <Leader>c :tabclose<CR>

"map <Leader>d :VimFiler -buffer-name=explorer -split -simple -winwidth=50 -toggle -no-quit<CR>
map <Leader>d :NERDTreeToggle<CR>

" Control+hjkl moves focus to that window
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Allow for multiple replace in visual mode
xnoremap p "_dP

" Add command to format json
com! FormatJSON '<,'>!python -m json.tool

" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
\ if line("'\"") > 0 && line ("'\"") <= line("$") |
\   exe "normal! g'\"" |
\ endif


" Auto-trim trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e


silent! source $HOME/.vimrc.local
