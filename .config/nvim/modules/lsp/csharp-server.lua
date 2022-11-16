-- :LspInstall omnisharp or manually install and setup OMNISHARP_BIN env var
local function isempty(s)
  return s == nil or s == ''
end

local util = require "lspconfig".util
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local pid = vim.fn.getpid()

local omnisharp_bin = os.getenv("OMNISHARP_BIN")
if isempty(omnisharp_bin) then
    local home = os.getenv("HOME")
    omnisharp_bin = home .. "/.local/share/nvim/lsp_servers/omnisharp/omnisharp/OmniSharp"
end

require'lspconfig'.omnisharp.setup{
    capabilities = capabilities,
    cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) },
    init_options = {
        useModernNet = false,
    },
    root_dir = function(fname)
    return util.root_pattern('.git')(fname)
        or util.root_pattern("*.sln")(fname)
    end
}
