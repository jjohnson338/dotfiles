-- npm install -g typescript typescript-language-server
local util = require "lspconfig".util
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require'lspconfig'.tsserver.setup{
    capabilities = capabilities,
    root_dir = function(fname)
      return util.root_pattern('.git')(fname)
    end
}
