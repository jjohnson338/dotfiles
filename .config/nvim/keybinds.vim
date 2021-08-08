" Smash JK in insert mode to revert to normal mode
inoremap jk <ESC>
inoremap kj <ESC>

" Smash JK in insert mode to revert to normal mode in terminal
tnoremap jk <C-\><C-n>
tnoremap kj <C-\><C-n>

" Control+hjkl moves focus to that window
nnoremap <silent> <C-h> :wincmd h<CR>
nnoremap <silent> <C-j> :wincmd j<CR>
nnoremap <silent> <C-k> :wincmd k<CR>
nnoremap <silent> <C-l> :wincmd l<CR>

" Tab+hjkl moves windows
nnoremap <Tab>h <C-w>H
nnoremap <Tab>j <C-w>J
nnoremap <Tab>k <C-w>K
nnoremap <Tab>l <C-w>L

" Tab+np to move between tabs
nnoremap <TAB>n :tabnext<CR>
nnoremap <TAB>p :tabprevious<CR>

" Zoom in/out with Ctrl + -=
nnoremap <C-=> :silent! let &guifont = substitute(
 \ &guifont,
 \ ':h\zs\d\+',
 \ '\=eval(submatch(0)+1)',
 \ '')<CR>
nnoremap <C--> :silent! let &guifont = substitute(
 \ &guifont,
 \ ':h\zs\d\+',
 \ '\=eval(submatch(0)-1)',
 \ '')<CR>
" Reload config with Ctrl + 0
nnoremap <C-0> :silent! :source $MYVIMRC<CR>


inoremap <silent> <S-Insert> <C-R>+

nnoremap <Leader>p "*p

" Allow for multiple replace in visual mode
xnoremap p "_dP

" Better tabbing
vnoremap < <gv
vnoremap > >gv

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


" === Telescope shorcuts === "
"   ;         - Browser currently open buffers
"   <Ctrl>p - Search files in current project directory
"   <Ctrl>/ - Search current project directory for occurences of given term
"   <Ctrl>* | <Ctrl>8 - Search current project directory directory for occurences of word under cursor
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <C-/> <cmd>Telescope live_grep<cr>
nnoremap ; <cmd>Telescope buffers<cr>
nnoremap <expr> <C-*> ':Telescope live_grep<cr>' . expand('<cword>')
nnoremap <expr> <C-8> ':Telescope live_grep<cr>' . expand('<cword>')

" vim-snip
" Expand or jump
imap <expr> <C-Space>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-Space>'
smap <expr> <C-Space>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-Space>'

" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

" LSP
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>

nnoremap <silent> <leader>ca :Lspsaga code_action<CR>
vnoremap <silent> <leader>ca :<C-U>Lspsaga range_code_action<CR>
nnoremap <silent> K :Lspsaga hover_doc<CR>
nnoremap <silent> <F2> :Lspsaga rename<CR>
