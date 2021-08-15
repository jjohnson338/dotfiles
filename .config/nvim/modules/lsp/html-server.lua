-- npm i -g vscode-langservers-extracted
local util = require "lspconfig".util
require'lspconfig'.html.setup{
    root_dir = function(fname)
      return util.root_pattern('.git')(fname)
    end
}
