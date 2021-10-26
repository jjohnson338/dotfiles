--npm install -g vscode-langservers-extracted
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
require'lspconfig'.eslint.setup{
    capabilities = capabilities
}
