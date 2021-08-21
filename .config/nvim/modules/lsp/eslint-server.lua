-- npm install -g eslint diagnostic-languageserver
local util = require "lspconfig".util
local bin_name = 'diagnostic-languageserver'
if vim.fn.has 'win32' == 1 then
    bin_name = bin_name .. '.cmd'
end

require'lspconfig'.diagnosticls.setup{
    cmd = { bin_name, '--stdio' },
    filetypes = {"javascript", "typescript"},
    root_dir = function(fname)
        return util.root_pattern('.git')(fname)
        or util.root_pattern('.eslintrc*')(fname)
    end,
    init_options = {
        linters = { eslint = {
                command = "eslint",
                rootPatterns = {".eslintrc*", ".git"},
                debounce = 100,
                args = {
                    "--stdin",
                    "--stdin-filename",
                    "%filepath",
                    "--format",
                    "json"
                },
                sourceName = "eslint",
                parseJson = {
                    errorsRoot = "[0].messages",
                    line = "line",
                    column = "column",
                    endLine = "endLine",
                    endColumn = "endColumn",
                    message = "[eslint] ${message} [${ruleId}]",
                    security = "severity"
                },
                securities = {
                    [2] = "error",
                    [1] = "warning"
                }
            },
        },
        filetypes = {
            javascript = "eslint",
            typescript = "eslint"
        }
    }
}
