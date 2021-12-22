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
        sorting_strategy = "ascending",
        preview = {
            filesize_limit = 1
        }
    },
    extensions = {
        fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = false, -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case"
        }
    }
}

require('telescope').load_extension('fzf')
require('telescope').load_extension('projects')
