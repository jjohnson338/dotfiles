local actions = require('telescope.actions')

require('telescope').setup{
    defaults = {
        mappings = {
            i = {
                ["<C-h>"] = actions.file_split,
                ["<C-v>"] = actions.file_vsplit,
                ["<C-t>"] = actions.file_tab
            },
        },
        layout_strategy = "horizontal",
        layout_config = {
            horizontal = {
                prompt_position = "top"
            },
        },
        sorting_strategy = "ascending"
    }
}
