call which_key#register('<Space>', "g:which_key_map")
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
let g:which_key_map =  {}
let g:which_key_map['c'] = { 'name': 'which_key_ignore' }
let g:which_key_map['h'] = { 'name': 'which_key_ignore' }
let g:which_key_map.t = {
    \ 'name': '+tasks'
    \ }

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

" Allow for multiple replace in visual mode
xnoremap p "_dP

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Toggle terminal
tnoremap <Leader>o <Cmd>lua require'FTerm'.toggle()<CR>
nnoremap <Leader>o <Cmd>lua require'FTerm'.toggle()<CR>

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
nnoremap <Leader>pp <cmd>Telescope find_files<cr>
nnoremap <Leader>po <cmd>Telescope old_files<cr>
nnoremap <Leader>p/ <cmd>Telescope live_grep<cr>
nnoremap <Leader>p; <cmd>Telescope buffers<cr>
nnoremap <Leader>p8 <cmd>Telescope grep_string<cr>
nnoremap <Leader>pt <cmd>Telescope treesitter<cr>
let g:which_key_map.p = {
    \ 'name' : '+search',
    \ 'p': [':Telescope find_files', 'search-files'],
    \ 'o': [':Telescope old_files', 'recent-files'],
    \ '/': [':Telescope live_grep', 'search-text'],
    \ ';': [':Telescope buffers', 'search-buffers'],
    \ '8': [':Telescope grep_string', 'search-cursor-word'],
    \ 't': [':Telescope treesitter', 'search-funcs-and-vars'],
    \ }

" Telescope Git
nnoremap <Leader>gc <cmd>Telescope git_commits<cr>
nnoremap <Leader>gb <cmd>Telescope git_branches<cr>
nnoremap <Leader>gs <cmd>Telescope git_status<cr>
nnoremap <Leader>gh <cmd>Telescope git_stash<cr>
let g:which_key_map.g = {
    \ 'name' : '+git',
    \ 'c': [':Telescope git_commits', 'git-commits'],
    \ 'b': [':Telescope git_branches', 'git-branches'],
    \ 's': [':Telescope git_status', 'git-status'],
    \ 'h': [':Telescope git_stash', 'git-stash'],
    \ }

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
function GoToDefinition()
    v:lua.vim.lsp.buf.definition()
endfunction

nnoremap <silent> <leader>la :Lspsaga code_action<CR>
nnoremap <silent> K :Lspsaga hover_doc<CR>
nnoremap <silent> <leader>lR :Lspsaga rename<CR>
nnoremap <silent> <Leader>ld :Lspsaga lsp_finder<CR>
nnoremap <silent> <Leader>lr <cmd>Telescope lsp_references<CR>
nnoremap <silent> <Leader>ls <cmd>Telescope lsp_document_symbols<CR>
nnoremap <silent> <Leader>ln <cmd>Telescope lsp_document_diagnostics<CR>


let g:which_key_map.l = {
    \ 'name' : '+lsp',
    \ 'a': [':Lspsaga code_action', 'code-action'],
    \ 'R': [':Lspsaga rename', 'rename'],
    \ 'd': [':Lspsaga lsp_finder', 'def-and-refs'],
    \ 'r': [':Telescope lsp_references', 'references'],
    \ 's': [':Telescope lsp_document_symbols', 'symbols'],
    \ 'n': [':Telescope lsp_document_diagnostics', 'diagnostics'],
    \ }

let g:which_key_map['w'] = { 'name': '+wiki' }
