--npm install -g vscode-langservers-extracted
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local bin_name = 'vscode-eslint-language-server'
if vim.fn.has 'win32' == 1 then
    bin_name = bin_name .. '.cmd'
end
require'lspconfig'.eslint.setup{
    cmd = { bin_name, "--stdio" },
    capabilities = capabilities
}
