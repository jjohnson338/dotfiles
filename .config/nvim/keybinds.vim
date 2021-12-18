call which_key#register('<Space>', "g:which_key_map")
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
let g:which_key_map =  {}
let g:which_key_map['c'] = { 'name': 'which_key_ignore' }
let g:which_key_map['h'] = { 'name': 'which_key_ignore' }

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

" Tab creation/navigation
nnoremap tn :tabnext<CR>
nnoremap tp :tabprevious<CR>
nnoremap tt :tabnew<CR>

" Allow gf to open non-existent files
map gf :edit <cfile><cr>

inoremap <silent> <S-Insert> <C-R>+

" Allow for multiple replace in visual mode
xnoremap p "_dP

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Toggle terminal
tnoremap <Leader>o <Cmd>lua require'FTerm'.toggle()<CR>
nnoremap <Leader>o <Cmd>lua require'FTerm'.toggle()<CR>

" === Lua tree shortcuts setup in nvim-tree.vim ===                                        "
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
map <Leader>d :NvimTreeToggle<CR>

" === Telescope shorcuts === "
nnoremap <Leader>pd <cmd>Telescope projects<cr>
nnoremap <Leader>pp <cmd>Telescope find_files<cr>
nnoremap <Leader>po <cmd>Telescope old_files<cr>
nnoremap <Leader>ph <cmd>Telescope help_tags<cr>
nnoremap <Leader>p/ <cmd>Telescope live_grep<cr>
nnoremap <Leader>p; <cmd>Telescope buffers<cr>
nnoremap <Leader>p8 <cmd>Telescope grep_string<cr>
nnoremap <Leader>pt <cmd>Telescope treesitter<cr>
let g:which_key_map.p = {
    \ 'name' : '+search',
    \ 'd': [':Telescope projects', 'search-projects'],
    \ 'p': [':Telescope find_files', 'search-files'],
    \ 'o': [':Telescope old_files', 'recent-files'],
    \ 'h': [':Telescope help_tags', 'help_tags'],
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

" Wiki
map <Leader>c :VimwikiToggleListItem<CR>
let g:which_key_map['w'] = { 'name': '+wiki' }

" Vim-test
nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ts :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tv :TestVisit<CR>
let g:which_key_map.t = {
    \ 'name' : '+test',
    \ 'n': [':TestNearest', 'test-nearest'],
    \ 'f': [':TestFile', 'test-file'],
    \ 's': [':TestSuite', 'test-suite'],
    \ 'l': [':TestLast', 'test-last'],
    \ 'v': [':TestVisit', 'test-visit'],
    \ }

nmap <silent> <leader>i <CMD>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>

" Unmap C-z on Windows
if has('win32')
    nmap <C-z> <Nop>
endif
