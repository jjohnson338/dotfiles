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

