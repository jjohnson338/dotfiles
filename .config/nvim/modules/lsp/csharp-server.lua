local lspinstall = require'lspinstall'
local util = require "lspconfig".util
local lang = "csharp"
lspinstall.setup()

local bin_name = vim.fn.stdpath("data") .. "/lspinstall/" .. lang .. "/omnisharp/run"
if vim.fn.has 'win32' == 1 then
    bin_name = vim.fn.stdpath("data") .. "\\lspinstall\\" .. lang .. "\\omnisharp\\OmniSharp.exe"
end

--- Check if a file or directory exists in this path
function exists(file)
    local ok, err, code = os.rename(file, file)
    if not ok then
        if code == 13 then
            -- Permission denied, but it exists
            return true
        end
    end
    return ok, err
end

--- Check if a directory exists in this path
function isdir(path)
    -- "/" works on both Unix and Windows
    return exists(path.."/")
end

local csharpServerPath = vim.fn.stdpath("data") .. "/lspinstall/" .. lang

if not isdir(csharpServerPath) then
    lspinstall.install_server(lang)
else
    local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    require'lspconfig'[lang].setup{
        capabilities = capabilities,
        cmd = { bin_name, "--languageserver" , "--hostPID", tostring(vim.fn.getpid()) },
        root_dir = function(fname)
        return util.root_pattern('.git')(fname)
            or util.root_pattern("*.sln")(fname)
        end,
    }
end

