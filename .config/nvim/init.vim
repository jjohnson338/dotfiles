set runtimepath+=$HOME/.config/nvim

source $HOME/.config/nvim/plug/plug.vim
source $HOME/.config/nvim/nvim-settings.vim
source $HOME/.config/nvim/theme.vim

source $HOME/.config/nvim/commands.vim
source $HOME/.config/nvim/keybinds.vim
source $HOME/.config/nvim/filetypes.vim
source $HOME/.config/nvim/fvim.vim

source $HOME/.config/nvim/modules/airline.vim
source $HOME/.config/nvim/modules/ale.vim
source $HOME/.config/nvim/modules/defx-git.vim
source $HOME/.config/nvim/modules/defx-icons.vim
source $HOME/.config/nvim/modules/defx.vim
source $HOME/.config/nvim/modules/denite.vim
source $HOME/.config/nvim/modules/fterm.vim
source $HOME/.config/nvim/modules/nvim-compe.vim
source $HOME/.config/nvim/modules/nvim-lightbulb.vim
source $HOME/.config/nvim/modules/startify.vim
luafile $HOME/.config/nvim/modules/nvim-colorizer.lua
luafile $HOME/.config/nvim/modules/treesitter.lua

" LSP
luafile $HOME/.config/nvim/modules/lsp-saga.lua
luafile $HOME/.config/nvim/modules/lsp/html-server.lua
luafile $HOME/.config/nvim/modules/lsp/ts-server.lua

silent! source $HOME/.vimrc.local
