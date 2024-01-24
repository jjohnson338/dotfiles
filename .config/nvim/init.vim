set runtimepath+=$HOME/.config/nvim

source $HOME/.config/nvim/plug/plug.vim
source $HOME/.config/nvim/nvim-settings.vim
source $HOME/.config/nvim/theme.vim

source $HOME/.config/nvim/commands.vim
source $HOME/.config/nvim/keybinds.vim
source $HOME/.config/nvim/filetypes.vim

luafile $HOME/.config/nvim/modules/f-term.lua
luafile $HOME/.config/nvim/modules/lualine.lua
luafile $HOME/.config/nvim/modules/nvim-biscuits.lua
luafile $HOME/.config/nvim/modules/nvim-cmp.lua
luafile $HOME/.config/nvim/modules/nvim-colorizer.lua
luafile $HOME/.config/nvim/modules/nvim-tree.lua
luafile $HOME/.config/nvim/modules/projects.lua
luafile $HOME/.config/nvim/modules/telescope.lua
luafile $HOME/.config/nvim/modules/treesitter.lua
source $HOME/.config/nvim/modules/nvim-lightbulb.vim
source $HOME/.config/nvim/modules/vim-wiki.vim

" LSP
luafile $HOME/.config/nvim/modules/lsp-saga.lua
luafile $HOME/.config/nvim/modules/lsp/csharp-server.lua
luafile $HOME/.config/nvim/modules/lsp/eslint-server.lua
luafile $HOME/.config/nvim/modules/lsp/html-server.lua
luafile $HOME/.config/nvim/modules/lsp/lsp-base.lua
luafile $HOME/.config/nvim/modules/lsp/null-ls.lua
luafile $HOME/.config/nvim/modules/lsp/python-server.lua
luafile $HOME/.config/nvim/modules/lsp/ts-server.lua

silent! source $HOME/.vimrc.local
