set runtimepath+=$HOME/.vim

" Tell Vim as early as possible not to try to emulate vi
set nocompatible

" To update Plugins :PlugUpdate

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
Plug 'rking/ag.vim' "Code search
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

" Don't complain if the colorscheme isn't set
silent! colorscheme onedark
let g:onedark_termcolors = 256
hi TabLineSel ctermfg=Magenta ctermbg=DarkGrey

" Smash JK in insert mode to revert to normal mode
inoremap jk <ESC>
inoremap kj <ESC>

" Defx
" ----------------------------------------------------------------------
autocmd FileType defx setlocal statusline=defx
set conceallevel=2
set concealcursor=nc
map <Leader>d :Defx<CR>
autocmd FileType defx call s:defx_my_settings()
call defx#custom#column('icon', {
  \ 'directory_icon': ' ',
  \ 'opened_icon':  ' ',
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
  \ 'winwidth': 50,
  \ 'columns': 'mark:indent:git:icon:icons:filename',
  \ 'split': 'vertical',
  \ 'direction': 'topleft',
  \ 'show_ignored_files': 1,
  \ 'buffer_name': 'defx',
  \ 'toggle': 1,
  \ 'resume': 1,
  \ 'listed': 1,
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

function! s:change_defx_buffer_dir() abort
  :Defx
  call defx#call_action('cd', expand('%:p:h'))
endfunction


let g:defx_git#column_length = 1
let g:defx_git#show_ignored = 0

hi def link Defx_git_Ignored Comment
hi def link Defx_git_Modified Special
hi def link Defx_git_Renamed Title
hi def link Defx_git_Staged Function
hi def link Defx_git_Unmerged Label
hi def link Defx_git_Untracked Tag

let g:defx_icons_column_length = 2
let g:defx_icons_default_icon = ' '
let g:defx_icons_directory_symlink_icon = ' '
let g:defx_icons_enable_syntax_highlight = 1
let g:defx_icons_mark_icon = '* '
let g:defx_icons_mark_icon = ' '
let g:defx_icons_parent_icon = " "
" Options below are applicable only when using tree" feature
let g:defx_icons_directory_icon = ' '
let g:defx_icons_nested_closed_tree_icon = ' '
let g:defx_icons_nested_opened_tree_icon = ' '
let g:defx_icons_root_opened_tree_icon = ' '


" Wrap in try/catch to avoid errors on initial install before plugin is available
try
" === Denite setup ==="
" Use ripgrep for searching current directory for files
" By default, ripgrep will respect rules in .gitignore
"   --files: Print each file that would be searched (but don't search)
"   --glob:  Include or exclues files for searching that match the given glob
"            (aka ignore .git files)
"
call denite#custom#var('file/rec', 'command', ['rg', '--files', '--glob', '!.git'])

" Use ripgrep in place of "grep"
call denite#custom#var('grep', 'command', ['rg'])

" Custom options for ripgrep
"   --vimgrep:  Show results with every match on it's own line
"   --hidden:   Search hidden directories and files
"   --heading:  Show the file name above clusters of matches from each file
"   --S:        Search case insensitively if the pattern is all lowercase
call denite#custom#var('grep', 'default_opts', ['--hidden', '--vimgrep', '--heading', '-S'])

" Recommended defaults for ripgrep via Denite docs
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" Remove date from buffer list
call denite#custom#var('buffer', 'date_format', '')

" Custom options for Denite
"   split                       - Use floating window for Denite
"   start_filter                - Start filtering on default
"   auto_resize                 - Auto resize the Denite window height automatically.
"   source_names                - Use short long names if multiple sources
"   prompt                      - Customize denite prompt
"   highlight_matched_char      - Matched characters highlight
"   highlight_matched_range     - matched range highlight
"   highlight_window_background - Change background group in floating window
"   highlight_filter_background - Change background group in floating filter window
"   winrow                      - Set Denite filter window to top
"   vertical_preview            - Open the preview window vertically

let s:denite_options = {'default' : {
\ 'split': 'floating',
\ 'start_filter': 1,
\ 'auto_resize': 1,
\ 'source_names': 'short',
\ 'prompt': 'λ ',
\ 'highlight_matched_char': 'QuickFixLine',
\ 'highlight_matched_range': 'Visual',
\ 'highlight_window_background': 'Visual',
\ 'winrow': 1,
\ 'vertical_preview': 1
\ }}

" Loop through denite options and enable them
function! s:profile(opts) abort
  for l:fname in keys(a:opts)
    for l:dopt in keys(a:opts[l:fname])
      call denite#custom#option(l:fname, l:dopt, a:opts[l:fname][l:dopt])
    endfor
  endfor
endfunction

call s:profile(s:denite_options)
catch
  echo 'Denite not installed. It should work after running :PlugInstall'
endtry

" === Denite shorcuts === "
"   ;         - Browser currently open buffers
"   <Ctrl>p - Browse list of files in current directory
"   <Ctrl>/ - Search current directory for occurences of given term and close window if no results
"   <Ctrl>g - Search current directory for occurences of word under cursor
nmap ; :Denite buffer<CR>
nmap <C-p> :DeniteProjectDir file/rec<CR>
nnoremap <C-/> :<C-u>Denite grep:. -no-empty<CR>
nnoremap <C-*> :<C-u>DeniteCursorWord grep:.<CR>
nnoremap <C-8> :<C-u>DeniteCursorWord grep:.<CR>

" Define mappings while in 'filter' mode
"   <C-o>         - Switch to normal mode inside of search results
"   <Esc>         - Exit denite window in any mode
"   <CR>          - Open currently selected file in any mode
"   <C-t>         - Open currently selected file in a new tab
"   <C-v>         - Open currently selected file a vertical split
"   <C-h>         - Open currently selected file in a horizontal split
autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
  imap <silent><buffer> <C-o>
  \ <Plug>(denite_filter_update)
  inoremap <silent><buffer><expr> <Esc>
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> <Esc>
  \ denite#do_map('quit')
  inoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  inoremap <silent><buffer><expr> <C-t>
  \ denite#do_map('do_action', 'tabopen')
  inoremap <silent><buffer><expr> <C-v>
  \ denite#do_map('do_action', 'vsplit')
  inoremap <silent><buffer><expr> <C-h>
  \ denite#do_map('do_action', 'split')
  inoremap <silent><buffer><expr> <C-n>
  \ denite#increment_parent_cursor(1)
  inoremap <silent><buffer><expr> <C-p>
  \ denite#increment_parent_cursor(-1)
endfunction

" Define mappings while in denite window
"   <CR>        - Opens currently selected file
"   q or <Esc>  - Quit Denite window
"   d           - Delete currenly selected file
"   p           - Preview currently selected file
"   <C-o> or i  - Switch to insert mode inside of filter prompt
"   <C-t>       - Open currently selected file in a new tab
"   <C-v>       - Open currently selected file a vertical split
"   <C-h>       - Open currently selected file in a horizontal split
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> <Esc>
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <C-o>
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <C-t>
  \ denite#do_map('do_action', 'tabopen')
  nnoremap <silent><buffer><expr> <C-v>
  \ denite#do_map('do_action', 'vsplit')
  nnoremap <silent><buffer><expr> <C-h>
  \ denite#do_map('do_action', 'split')
endfunction

" Airline
" ----------------------------------------------------------------------
let g:airline#extensions#tabline#enabled = 0
let g:airline_powerline_fonts = 1


" Startify
" ----------------------------------------------------------------------
let g:startify_change_to_dir = 1
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
" Whenever a directory is changed, open Defx and change it's dir
autocmd DirChanged * call s:change_defx_buffer_dir()
" Map an alias command for Startify
com! Home Startify

" Deoplete
" ----------------------------------------------------------------------
let g:deoplete#enable_at_startup = 1
call deoplete#custom#source('neosnippet', 'rank', 2000)
call deoplete#custom#option('nofile_complete_filetypes', [])


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

" Linting
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['tsserver', 'tslint'],
\   'vue': ['eslint']
\}
let g:ale_cursor_detail = 0
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 1
let g:ale_linters_explicit = 1
let g:ale_set_balloons = 0
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 0
let g:ale_set_signs = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = 'X'
let g:ale_sign_warning = '>>'
let g:ale_use_global_executables = 1
let g:ale_virtualtext_cursor = 1
let g:ale_virtualtext_prefix = ' ⎩ ALE ⎫ '
let airline#extensions#ale#error_symbol = 'X'
let airline#extensions#ale#warning_symbol = '>>'
let g:airline#extensions#ale#enabled = 1

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

inoremap <silent> <S-Insert> <C-R>+

nnoremap <Leader>p "*p

" Toggle terminal
lua require('FTerm').setup()

tnoremap <C-`> <Cmd>lua require'FTerm'.toggle()<CR>
nnoremap <C-`> <Cmd>lua require'FTerm'.toggle()<CR>


" Allow for multiple replace in visual mode
xnoremap p "_dP

" Add command to format json
com! FormatJSON '<,'>!python -m json.tool

" Add alias for often fat-fingered command
com! Noh noh

" FVim Fullscreen
if exists('g:fvim_loaded')
  com! FS :FVimToggleFullScreen
  FVimFontAntialias v:true
  FVimFontAutoSnap v:true
  FVimFontAutohint v:true
  FVimFontSubpixel v:true
endif

" Custom filetypes
augroup filetypedetect
  au! BufRead,BufNewFile *.fsproj   setfiletype fsproj
augroup end

" For commentary
autocmd FileType fsharp setlocal commentstring=//%s

" Filetype indentations
autocmd FileType cs setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
autocmd FileType python setlocal shiftwidth=4 softtabstop=4 tabstop=4 expandtab
autocmd FileType snip setlocal shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType vim setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab formatoptions-=c formatoptions-=r formatoptions-=o
autocmd FileType fsproj setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab formatoptions-=c formatoptions-=r formatoptions-=o

" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
\ if line("'\"") > 0 && line ("'\"") <= line("$") |
\   exe "normal! g'\"" |
\ endif

" Auto-trim trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e
silent! source $HOME/.vimrc.local
