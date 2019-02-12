set runtimepath+=$HOME/.vim
" Tell Vim as early as possible not to try to emulate vi
set nocompatible

" To update Plugins :PlugUpdate

" Set up vim plugins
call plug#begin('~/.vim/plugged')


" Autocompletions
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' } "Javascript
Plug 'jjohnson338/deoplete-mssql'

"Style
Plug 'vim-airline/vim-airline'
Plug 'joshdick/onedark.vim'

" Utility
Plug 'scrooloose/nerdtree' " File Explorer
Plug 'vim-scripts/dbext.vim' " DB
Plug 'tpope/vim-commentary' " Comments
Plug 'simeji/winresizer' " Resizing
Plug 'jiangmiao/auto-pairs' " Pairs
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " Fuzzy File Finder
Plug 'albfan/ag.vim' "Code search

" Source control
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'

"Linting
Plug 'vim-syntastic/syntastic'

" Syntax
Plug 'JulesWang/css.vim',             { 'for': 'css' }
Plug 'pangloss/vim-javascript',       { 'for': 'javascript' }
Plug 'stephpy/vim-yaml',              { 'for': 'yaml' }
Plug 'GutenYe/json5.vim',             { 'for': 'json5' }
Plug 'rust-lang/rust.vim'
Plug 'hoffstein/vim-tsql'
Plug 'OrangeT/vim-csharp'
Plug 'gregsexton/MatchTag'

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
set guioptions=agit
if has('win32') || has ('win64')
    set shell=cmd.exe
    set encoding=utf-8
    let g:python3_host_prog='C:\Users\jjohnson\AppData\Local\Programs\Python\Python37\python.exe'
    if !has('nvim')
        set guifont=Fira_Code_Medium:h10:cANSI:qDRAFT
    endif
else
    set shell=sh
    " GVim options
    if !has('nvim')
      set guifont=Inconsolata\ Bold\ 10
    endif
endif

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


" Smash JK in insert mode to revert to normal mode
inoremap jk <ESC>
inoremap kj <ESC>

" Nerdtree options
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeShowHidden=1
let g:NERDTreeDirArrows = 0
map <Leader>d :NERDTreeToggle<CR>
" NERDTree Git Options
let g:NERDTreeIndicatorMapCustom = {
            \ "Modified"  : "o",
            \ "Staged"    : "+",
            \ "Untracked" : "*",
            \ "Renamed"   : ">",
            \ "Unmerged"  : "═",
            \ "Deleted"   : "X",
            \ "Dirty"     : "x",
            \ "Clean"     : "@",
            \ "Unknown"   : "?"
            \ }
let g:NERDTreeGitStatusIgnoreSubmodules = 'all'
let g:NERDTreeShowIgnoredStatus = 0
" Airline
let g:airline#extensions#tabline#enabled = 0
" Linting
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
"Deoplete
let g:deoplete#enable_at_startup = 1
"FZF
map <c-p> :FZF<CR>
"Ag
let g:ag_working_path_mode="r"

" Control+hjkl moves focus to that window
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

if has('nvim')
    inoremap <silent> <S-Insert> <C-R>+
endif

map <Leader>n :tabnew<CR>
map <Leader>c :tabclose<CR>

nnoremap <Leader>p "*p

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
