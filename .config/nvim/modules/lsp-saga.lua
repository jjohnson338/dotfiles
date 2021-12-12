local saga = require 'lspsaga'
saga.init_lsp_saga {
    code_action_keys = {
        quit = '<Esc>',exec = '<CR>'
    },
    code_action_prompt = {
        enable = false,
        sign = false,
        virtual_text = false,
    }
}

vim.o.updatetime = 250
vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'lspsaga.diagnostic'.show_line_diagnostics()]]
