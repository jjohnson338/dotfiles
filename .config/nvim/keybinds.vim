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
tnoremap <Leader>tt <Cmd>lua require'FTerm'.toggle()<CR>
nnoremap <C-`> <Cmd>lua require'FTerm'.toggle()<CR>
nnoremap <Leader>tt <Cmd>lua require'FTerm'.toggle()<CR>

" === Lua tree shortcuts ===                                        "
" <Leader>d     - Toggle lua tree                                   "
" === Lua tree buffer shortcuts ===                                 "
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
lua <<EOF
    local tree_cb = require'nvim-tree.config'.nvim_tree_callback
    -- default mappings
    vim.g.nvim_tree_bindings = {
      { key = "A",                            cb = tree_cb("create") },
      { key = "C",                            cb = tree_cb("copy") },
      { key = "D",                            cb = tree_cb("remove") },
      { key = "M",                            cb = tree_cb("rename") },
      { key = "P",                            cb = tree_cb("paste") },
      { key = "R",                            cb = tree_cb("refresh") },
      { key = "X",                            cb = tree_cb("cut") },
      { key = "s",                            cb = tree_cb("vsplit") },
      { key = "i",                            cb = tree_cb("split") },
      { key = "p",                            cb = tree_cb("close_node") },
      { key = {"<CR>", "o", "<2-LeftMouse>"}, cb = tree_cb("edit") },
    }
EOF
map <Leader>d :NvimTreeToggle<CR>


" === Telescope shorcuts === "
"   ;         - Browser currently open buffers
"   <Ctrl>p - Search files in current project directory
"   <Ctrl>/ - Search current project directory for occurences of given term
"   <Ctrl>* | <Ctrl>8 - Search current project directory directory for occurences of word under cursor
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <Leader>p <cmd>Telescope find_files<cr>
nnoremap <C-/> <cmd>Telescope live_grep<cr>
nnoremap <Leader>/ <cmd>Telescope live_grep<cr>
nnoremap ; <cmd>Telescope buffers<cr>
nnoremap <expr> <C-*> ':Telescope live_grep<cr>' . expand('<cword>')
nnoremap <expr> <Leader>* ':Telescope live_grep<cr>' . expand('<cword>')
nnoremap <expr> <C-8> ':Telescope live_grep<cr>' . expand('<cword>')
nnoremap <expr> <Leader>8 ':Telescope live_grep<cr>' . expand('<cword>')

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
