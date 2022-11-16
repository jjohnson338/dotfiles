-- npm i -g vscode-langservers-extracted
local util = require "lspconfig".util
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local bin_name = 'vscode-html-language-server'
if vim.fn.has 'win32' == 1 then
    bin_name = bin_name .. '.cmd'
end
require'lspconfig'.html.setup{
    cmd = { bin_name, "--stdio" },
    capabilities = capabilities,
    root_dir = function(fname)
      return util.root_pattern('.git')(fname)
    end
}
