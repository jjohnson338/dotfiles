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
Plug 'kristijanhusak/defx-icons'
Plug 'vim-scripts/dbext.vim' " DB
Plug 'tpope/vim-commentary' " Comments
Plug 'simeji/winresizer' " Resizing
Plug 'jiangmiao/auto-pairs' " Pairs
Plug 'albfan/ag.vim' "Code search
Plug 'mhinz/vim-startify' "Home page

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

call plug#end()

let mapleader=" "
set background=dark       "make sure vim knows bg is dark
set showmode              "display current mode
set showcmd               "display partially typed commands
set title
set nowrap                "dont wrap long lines
set shiftround            "Round indent to multiple of 'shiftwidth'
set ruler                 "turn of position on bottom
set number                "turn on line numbers
set showmatch             "highlight matching brackets
set nobackup              "backups are for wimps
set noundofile            "same as the line above says
set noswapfile            "turn off swap files
set pastetoggle=<F12>     "press when pasting multiple lines set backspace=indent,eol,start set title
set scrolloff=9           "start scrolling when hits this many lines from edge
set showtabline=2         "always show tab bar
set visualbell
set updatetime=250
set nocursorline
set nocursorcolumn
set norelativenumber
set sidescroll=0
set cc=80
"searches are case insensitive unless they contain at least one capital letter
set ignorecase
set smartcase
set guioptions=agit
set termguicolors
set guifont=Hack:h13
if has('win32') || has ('win64')
    set shell=cmd.exe
    set clipboard+=unnamedplus
    set encoding=utf-8
else
    set shell=sh
endif

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

" Defx
" ----------------------------------------------------------------------{{{
set conceallevel=2
set concealcursor=nc
map <Leader>d :Defx <cr>
autocmd FileType defx call s:defx_my_settings()
call defx#custom#column('icon', {
  \ 'directory_icon': '',
  \ 'opened_icon':  '',
  \ 'root_icon': '',
  \ 'root_marker_highlight': 'Ignore',
  \ })
call defx#custom#column('filename', {
  \ 'root_marker_highlight': 'Ignore',
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
  \ 'winwidth': 45,
  \ 'columns': 'mark:indent:git:icon:icons:filename',
  \ 'split': 'vertical',
  \ 'direction': 'topleft',
  \ 'show_ignored_files': 1,
  \ 'buffer_name': '',
  \ 'toggle': 1,
  \ 'resume': 1,
  \ 'root_marker': ':',
  \ })
function!  s:defx_my_settings() abort

  setl nospell
  setl signcolumn=no
  setl nonumber
  nnoremap <silent><buffer><expr> o defx#is_directory() ?  defx#do_action('open_or_close_tree') : defx#do_action('drop')
  nnoremap <silent><buffer><expr> p defx#do_action('close_tree')
  nnoremap <silent><buffer><expr> s defx#do_action('open', 'botright vsplit')
  nnoremap <silent><buffer><expr> i defx#do_action('open', 'botright split', '')
  nnoremap <silent><buffer><expr> C defx#do_action('copy')
  nnoremap <silent><buffer><expr> P defx#do_action('paste')
  nnoremap <silent><buffer><expr> M defx#do_action('rename')
  nnoremap <silent><buffer><expr> D defx#do_action('remove_trash')
  nnoremap <silent><buffer><expr> A defx#do_action('new_file')
  nnoremap <silent><buffer><expr> R defx#do_action('redraw')

endfunction


let g:defx_git#show_ignored = 0
let g:defx_git#column_length = 1

hi def link Defx_filename_directory NERDTreeDirSlash
hi def link Defx_git_Modified Special
hi def link Defx_git_Staged Function
hi def link Defx_git_Renamed Title
hi def link Defx_git_Unmerged Label
hi def link Defx_git_Untracked Tag
hi def link Defx_git_Ignored Comment

let g:defx_icons_parent_icon = ""
let g:defx_icons_mark_icon = ''
let g:defx_icons_enable_syntax_highlight = 1
let g:defx_icons_column_length = 1
let g:defx_icons_mark_icon = '*'
let g:defx_icons_default_icon = ''
let g:defx_icons_directory_symlink_icon = ''
" Options below are applicable only when using tree" feature
let g:defx_icons_directory_icon = ''
let g:defx_icons_root_opened_tree_icon = ''
let g:defx_icons_nested_opened_tree_icon = ''
let g:defx_icons_nested_closed_tree_icon = ''


" Airline
let g:airline#extensions#tabline#enabled = 0
let g:airline_powerline_fonts = 1

" Startify
let g:startify_change_to_dir = 1
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1
let g:startify_enable_special = 1
let g:startify_lists = [
  \ { 'type': 'files',     'header': ['   Recents']            },
  \ { 'type': 'dir',       'header': ['   Recents '. getcwd()] },
  \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
  \ { 'type': 'sessions',  'header': ['   Sessions']       },
  \ ]

function! s:isdir(dir) abort
    return !empty(a:dir) && (isdirectory(a:dir) ||
                \ (!empty($SYSTEMDRIVE) && isdirectory('/'.tolower($SYSTEMDRIVE[0]).a:dir)))
endfu

" open defx anytime a directory buffer is opened
" and change to that directory
augroup defx
    au!
    au VimEnter * sil! au! FileExplorer *
    au BufEnter * if s:isdir(expand('%')) | cd %:p:h | Defx | endif
augroup END


"Lang server
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

"Deoplete
let g:deoplete#enable_at_startup = 1
call deoplete#custom#source('LanguageClient','mark','LC')
call deoplete#custom#source('LanguageClient','min_pattern_length',1)
call deoplete#custom#source('neosnippet', 'rank', 2000)

"Neosnippet
imap <C-o> <Plug>(neosnippet_expand_or_jump)
smap <C-o> <Plug>(neosnippet_expand_or_jump)
xmap <C-o> <Plug>(neosnippet_expand_target)
let g:neosnippet#disable_runtime_snippets = {
    \   '_' : 1,
    \ }
let g:neosnippet#snippets_directory="~/.vim/snippets"

"Ag
let g:ag_working_path_mode="r"
let g:ag_prg="ag --smart-case --ignore-dir 'build' --ignore-dir 'logs' --ignore-dir '_logs' --ignore-dir 'TestResults' --vimgrep"

" Control+hjkl moves focus to that window
nnoremap <silent> <C-h> :wincmd h<CR>
nnoremap <silent> <C-j> :wincmd j<CR>
nnoremap <silent> <C-k> :wincmd k<CR>
nnoremap <silent> <C-l> :wincmd l<CR>

" Shift+HJKL moves windows
nnoremap <S-H> <C-w>H
nnoremap <S-J> <C-w>J
nnoremap <S-K> <C-w>K
nnoremap <S-L> <C-w>L

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

" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
\ if line("'\"") > 0 && line ("'\"") <= line("$") |
\   exe "normal! g'\"" |
\ endif


" Auto-trim trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e
silent! source $HOME/.vimrc.local
