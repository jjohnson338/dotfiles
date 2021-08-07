" Tell Vim as early as possible not to try to emulate vi
set nocompatible

let mapleader=" "
set background=dark       "make sure vim knows bg is dark
set cc=80
set list
set listchars=eol:↵,tab:⇒·,trail:·,nbsp:·
set nobackup              "backups are for wimps
set cursorline
set noswapfile            "turn off swap files
set noundofile            "same as the line above says
set nowrap                "dont wrap long lines
set number                "turn on line numbers
set pastetoggle=<F12>     "press when pasting multiple lines set backspace=indent,eol,start set title
set ruler                 "turn of position on bottom
set scrolloff=999         "keeps cursor vertically centered when scrolling
set shiftround            "Round indent to multiple of 'shiftwidth'
set showcmd               "display partially typed commands
set showmatch             "highlight matching brackets
set showmode              "display current mode
set showtabline=2         "always show tab bar
set sidescroll=0          "big horizontal jumps
set title
set updatetime=250
set visualbell
set signcolumn=auto
set mouse=a
set wildmenu
set wildmode=list:longest,full
set wildoptions+=pum

"search settings
set ignorecase
set smartcase
set hlsearch

" Gui settings
set guioptions=agit
set termguicolors

set clipboard+=unnamedplus
" OS settings
if has('win32') || has ('win64')
  set shell=cmd.exe
  set encoding=utf-8
  set guifont=Hack:h13
else
  set shell=bash
  set guifont=Hack\ Nerd\ Font:h16
endif

" Indentation settings
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4

" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
\ if line("'\"") > 0 && line ("'\"") <= line("$") |
\   exe "normal! g'\"" |
\ endif

" Auto-trim trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e
