-- dotnet tool install --global csharp-ls
local util = require "lspconfig".util
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
require'lspconfig'.csharp_ls.setup{
    capabilities = capabilities,
    root_dir = function(fname)
    return util.root_pattern('.git')(fname)
        or util.root_pattern("*.sln")(fname)
    end
}
