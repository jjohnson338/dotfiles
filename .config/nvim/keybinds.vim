" Smash JK in insert mode to revert to normal mode
inoremap jk <ESC>
inoremap kj <ESC>

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

" Allow for multiple replace in visual mode
xnoremap p "_dP

" Toggle terminal
tnoremap <C-`> <Cmd>lua require'FTerm'.toggle()<CR>
nnoremap <C-`> <Cmd>lua require'FTerm'.toggle()<CR>

" === Defx shortcuts ===                                            "
" <Leader>d     - Toggle defxi                                      "
" === Defx buffer shortcuts ===                                     "
" A             - New file                                          "
" C             - Copy                                              "
" D             - Delete                                            "
" M             - Rename                                            "
" P             - Paste                                             "
" P             - Redraw                                            "
" i             - Open - Horizontal Split                           "
" s             - Open - Vertical Split                             "
" o             - Toggle Dir Open/Closed or Open in Buffer          "
" p             - Close Tree                                        "
map <Leader>d :Defx<CR>
autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
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

" Neosnippet
imap <C-o> <Plug>(neosnippet_expand_or_jump)
smap <C-o> <Plug>(neosnippet_expand_or_jump)
xmap <C-o> <Plug>(neosnippet_expand_target)
