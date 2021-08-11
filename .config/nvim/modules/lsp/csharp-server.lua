local lspinstall = require'lspinstall'
local lang = "csharp"
lspinstall.setup()

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
    require'lspconfig'[lang].setup{}
end

