-- npm i -g vscode-langservers-extracted
local util = require "lspconfig".util
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
require'lspconfig'.html.setup{
    capabilities = capabilities,
    root_dir = function(fname)
      return util.root_pattern('.git')(fname)
    end
}
