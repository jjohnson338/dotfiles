-- npm install -g typescript typescript-language-server
local util = require "lspconfig".util
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
require'lspconfig'.tsserver.setup{
    capabilities = capabilities,
    root_dir = function(fname)
      return util.root_pattern('.git')(fname)
    end
}
