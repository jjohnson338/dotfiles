set runtimepath+=$HOME/.config/nvim

source $HOME/.config/nvim/plug/plug.vim
source $HOME/.config/nvim/nvim-settings.vim
source $HOME/.config/nvim/theme.vim

source $HOME/.config/nvim/commands.vim
source $HOME/.config/nvim/keybinds.vim
source $HOME/.config/nvim/filetypes.vim
source $HOME/.config/nvim/fvim.vim

source $HOME/.config/nvim/modules/editorconfig.vim
source $HOME/.config/nvim/modules/nvim-cmp.vim
source $HOME/.config/nvim/modules/nvim-lightbulb.vim
source $HOME/.config/nvim/modules/nvim-tree.vim
source $HOME/.config/nvim/modules/startify.vim
source $HOME/.config/nvim/modules/vim-wiki.vim
luafile $HOME/.config/nvim/modules/lualine.lua
luafile $HOME/.config/nvim/modules/nvim-colorizer.lua
luafile $HOME/.config/nvim/modules/telescope.lua
luafile $HOME/.config/nvim/modules/treesitter.lua
luafile $HOME/.config/nvim/modules/f-term.lua
luafile $HOME/.config/nvim/modules/nvim-biscuits.lua

" LSP
luafile $HOME/.config/nvim/modules/lsp-saga.lua
" luafile $HOME/.config/nvim/modules/lsp/csharp-server.lua
luafile $HOME/.config/nvim/modules/lsp/eslint-server.lua
luafile $HOME/.config/nvim/modules/lsp/html-server.lua
luafile $HOME/.config/nvim/modules/lsp/ts-server.lua
luafile $HOME/.config/nvim/modules/lsp/python-server.lua

silent! source $HOME/.vimrc.local
