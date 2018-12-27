set runtimepath+=$HOME/.vim
" Tell Vim as early as possible not to try to emulate vi
set nocompatible

" To update Plugins :PlugUpdate

" Set up vim plugins
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
"Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'godlygeek/tabular'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-scripts/dbext.vim'
Plug 'tpope/vim-commentary'
Plug 'simeji/winresizer'
Plug 'vim-syntastic/syntastic'
" need pacakages 'mono-devel', 'rustc'
Plug 'Valloric/YouCompleteMe' " Post Update run 'python3 ~/.vim/plugged/YouCompleteMe/install.py --cs-completer --rust-completer'

" Syntax
"Plug 'pearofducks/ansible-vim'
Plug 'JulesWang/css.vim',             { 'for': 'css' }
Plug 'pangloss/vim-javascript',       { 'for': 'javascript' }
Plug 'stephpy/vim-yaml',              { 'for': 'yaml' }
Plug 'GutenYe/json5.vim',             { 'for': 'json5' }
Plug 'rust-lang/rust.vim'
Plug 'hoffstein/vim-tsql'
Plug 'OrangeT/vim-csharp'
Plug 'gregsexton/MatchTag'

" Themes
Plug 'joshdick/onedark.vim'

call plug#end()

let mapleader=" "
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
let NERDTreeShowHidden=1
let g:NERDTreeDirArrows = 0

" NERDTree Git Options
" let g:NERDTreeGitStatusIgnoreSubmodules = 'all'
" let g:NERDTreeShowIgnoredStatus = 0
"
" Airline
let g:airline#extensions#tabline#enabled = 0

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


" YouCompleteMe
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1

map <Leader>n :tabnew<CR>
map <Leader>c :tabclose<CR>

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
