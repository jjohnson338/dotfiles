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
Plug 'jjohnson338/deoplete-mssql'
Plug 'Shougo/neosnippet.vim'

"Style
Plug 'vim-airline/vim-airline'
Plug 'joshdick/onedark.vim'

" Utility
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'rking/ag.vim' "Code search
Plug 'jiangmiao/auto-pairs' " Pairs
Plug 'kristijanhusak/defx-icons'
Plug 'mhinz/vim-startify' "Home page
Plug 'pgdouyon/vim-evanesco' "Better buffer searching
Plug 'simeji/winresizer' " Resizing
Plug 'tpope/vim-commentary' " Comments
Plug 'vim-scripts/dbext.vim' " DB

" Source control
Plug 'airblade/vim-gitgutter'
Plug 'kristijanhusak/defx-git'
Plug 'tpope/vim-fugitive'

" Lang server
if has('win32') || has ('win64')
  Plug 'autozimu/LanguageClient-neovim', {
      \ 'branch': 'next',
      \ 'do': 'powershell -executionpolicy bypass -File install.ps1',
      \ }
else
  Plug 'autozimu/LanguageClient-neovim', {
      \ 'branch': 'next',
      \ 'do': 'bash install.sh',
      \ }
endif

" Syntax
Plug 'JulesWang/css.vim',             { 'for': 'css' }
Plug 'pangloss/vim-javascript',       { 'for': 'javascript' }
Plug 'stephpy/vim-yaml',              { 'for': 'yaml' }
Plug 'GutenYe/json5.vim',             { 'for': 'json5' }
Plug 'rust-lang/rust.vim'
Plug 'hoffstein/vim-tsql'
Plug 'OrangeT/vim-csharp'
Plug 'NLKNguyen/vim-maven-syntax'

call plug#end()

let mapleader=" "
set background=dark       "make sure vim knows bg is dark
set cc=80
set list
set listchars=eol:↵,tab:⇒·,trail:·,nbsp:·
set nobackup              "backups are for wimps
set nocursorline
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
    set shell=sh
    set guifont=Hack\ Nerd\ Font\ Regular:h13
endif

" Indentation settings, gave up on editorconfig
set expandtab
set shiftwidth=4
set tabstop=4

" Don't complain if the colorscheme isn't set
silent! colorscheme onedark
let g:onedark_termcolors = 256
hi TabLineSel ctermfg=Magenta ctermbg=DarkGrey

"calls sudo and asks for password if necessary
cmap w!! %!sudo tee > /dev/null %

" Smash JK in insert mode to revert to normal mode
inoremap jk <ESC>
inoremap kj <ESC>

" Defx
" ----------------------------------------------------------------------
autocmd FileType defx setlocal statusline=defx
set conceallevel=2
set concealcursor=nc
map <Leader>d :Defx -buffer-name=defx<CR>
autocmd FileType defx call s:defx_my_settings()
call defx#custom#column('icon', {
  \ 'directory_icon': '',
  \ 'opened_icon':  '',
  \ 'root_icon': '',
  \ 'root_marker_highlight': 'Ignore',
  \ })
call defx#custom#column('filename', {
  \ 'root_marker_highlight': 'Ignore',
  \ 'max_width': '200'
  \ })
call defx#custom#column('mark', {
  \ 'readonly_icon': '✗',
  \ 'selected_icon': '',
  \ })
call defx#custom#column('git', 'indicators', {
  \ 'Modified'  : '',
  \ 'Staged'    : '+',
  \ 'Untracked' : '?',
  \ 'Renamed'   : '➜',
  \ 'Unmerged'  : '═',
  \ 'Deleted'   : '✖',
  \ 'Unknown'   : '?'
  \ })
call defx#custom#option('_', {
  \ 'winwidth': 75,
  \ 'columns': 'mark:indent:git:icon:icons:filename',
  \ 'split': 'vertical',
  \ 'direction': 'topleft',
  \ 'show_ignored_files': 1,
  \ 'buffer_name': '',
  \ 'toggle': 1,
  \ 'resume': 1,
  \ 'root_marker': ':'
  \ })
function!  s:defx_my_settings() abort

  setl nonumber
  setl nospell
  setl signcolumn=no
  nnoremap <silent><buffer><expr> A defx#do_action('new_file')
  nnoremap <silent><buffer><expr> C defx#do_action('copy')
  nnoremap <silent><buffer><expr> D defx#do_action('remove_trash')
  nnoremap <silent><buffer><expr> M defx#do_action('rename')
  nnoremap <silent><buffer><expr> P defx#do_action('paste')
  nnoremap <silent><buffer><expr> R defx#do_action('redraw')
  nnoremap <silent><buffer><expr> i defx#do_action('open', 'botright split', '')
  nnoremap <silent><buffer><expr> o defx#is_directory() ?  defx#do_action('open_or_close_tree') : defx#do_action('drop')
  nnoremap <silent><buffer><expr> p defx#do_action('close_tree')
  nnoremap <silent><buffer><expr> s defx#do_action('open', 'botright vsplit')

endfunction


let g:defx_git#column_length = 1
let g:defx_git#show_ignored = 0

hi def link Defx_git_Ignored Comment
hi def link Defx_git_Modified Special
hi def link Defx_git_Renamed Title
hi def link Defx_git_Staged Function
hi def link Defx_git_Unmerged Label
hi def link Defx_git_Untracked Tag

let g:defx_icons_column_length = 1
let g:defx_icons_default_icon = ''
let g:defx_icons_directory_symlink_icon = ''
let g:defx_icons_enable_syntax_highlight = 1
let g:defx_icons_mark_icon = '*'
let g:defx_icons_mark_icon = ''
let g:defx_icons_parent_icon = ""
" Options below are applicable only when using tree" feature
let g:defx_icons_directory_icon = ''
let g:defx_icons_nested_closed_tree_icon = ''
let g:defx_icons_nested_opened_tree_icon = ''
let g:defx_icons_root_opened_tree_icon = ''


" Airline
" ----------------------------------------------------------------------
let g:airline#extensions#tabline#enabled = 0
let g:airline_powerline_fonts = 1


" Startify
" ----------------------------------------------------------------------
let g:startify_change_to_dir = 1
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1
let g:startify_enable_special = 1
let g:startify_lists = [
  \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
  \ { 'type': 'files',     'header': ['   Recents']            },
  \ { 'type': 'dir',       'header': ['   Recents '. getcwd()] },
  \ { 'type': 'sessions',  'header': ['   Sessions']       },
  \ ]

" Eat all File Explorer Buffer opens
au VimEnter * sil! au! FileExplorer *
" Whenever Startify launches a buffer, find and destroy the defx buffer, then
" launch a new one
au User StartifyBufferOpened silent! bwipeout defx | Defx -buffer-name=defx
" Map an alias command for Startify
com! Home Startify

" Lang Server
" ----------------------------------------------------------------------
let g:LanguageClient_autoStart = 1
if has('win32') || has ('win64')
  let g:LanguageClient_serverCommands = {
      \ 'javascript': [ expand($HOME) . '\AppData\Roaming\npm\typescript-language-server.cmd', '--stdio'],
      \ 'typescript': [ expand($HOME) . '\AppData\Roaming\npm\typescript-language-server.cmd', '--stdio'],
      \ 'python': ['pyls'],
      \ }
else
  let g:LanguageClient_serverCommands = {
      \ 'javascript': ['typescript-language-server', '--stdio'],
      \ 'typescript': ['typescript-language-server', '--stdio'],
      \ }
endif
let g:LanguageClient_hoverPreview = "Always"
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>


" Deoplete
" ----------------------------------------------------------------------
let g:deoplete#enable_at_startup = 1
call deoplete#custom#source('LanguageClient','mark','LC')
call deoplete#custom#source('LanguageClient','min_pattern_length',1)
call deoplete#custom#source('neosnippet', 'rank', 2000)


" Neosnippet
" ----------------------------------------------------------------------
imap <C-o> <Plug>(neosnippet_expand_or_jump)
smap <C-o> <Plug>(neosnippet_expand_or_jump)
xmap <C-o> <Plug>(neosnippet_expand_target)
let g:neosnippet#disable_runtime_snippets = {
    \   '_' : 1,
    \ }
let g:neosnippet#snippets_directory="~/.vim/snippets"


" Ag
" ----------------------------------------------------------------------
let g:ag_working_path_mode="r"
let g:ag_prg="ag --vimgrep --smart-case --ignore=TestResults --ignore=Debug --ignore=build --ignore=_logs --ignore=logs --ignore=.git --ignore=*.prpt --ignore=*.bak --ignore=*.db --ignore=*.tmp --ignore=*.inc"

" Control+hjkl moves focus to that window
nnoremap <silent> <C-h> :wincmd h<CR>
nnoremap <silent> <C-j> :wincmd j<CR>
nnoremap <silent> <C-k> :wincmd k<CR>
nnoremap <silent> <C-l> :wincmd l<CR>

" Tab+hjkl moves windows
nnoremap <Tab>h <C-w>H
nnoremap <Tab>j <C-w>J
nnoremap <Tab> <C-w>K
nnoremap <Tab>l <C-w>L

if has('nvim')
    inoremap <silent> <S-Insert> <C-R>+
endif

nnoremap <Leader>p "*p

" Allow for multiple replace in visual mode
xnoremap p "_dP

" Add command to format json
com! FormatJSON '<,'>!python -m json.tool

" Add alias for often fat-fingered command
com! Noh noh

" FVim Fullscreen
if exists('g:fvim_loaded')
    com! FS :FVimToggleFullScreen
endif


" Filetype indentations
autocmd FileType cs setlocal shiftwidth=4 tabstop=4 expandtab
autocmd FileType snip setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType vim setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab

" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
\ if line("'\"") > 0 && line ("'\"") <= line("$") |
\   exe "normal! g'\"" |
\ endif


" Auto-trim trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e
silent! source $HOME/.vimrc.local
