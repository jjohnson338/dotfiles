require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "bash",
        "c",
        "c_sharp",
        "css",
        "dockerfile",
        "html",
        "javascript",
        "json",
        "json5",
        "lua",
        "markdown",
        "python",
        "regex",
        "scss",
        "tsx",
        "typescript",
        "vim",
        "vue",
    },
    highlight = {
        enable = true,
    },
    indent = {
        enable = false
    }
}

-- Folding --
-- vim.o.foldmethod='expr'
-- vim.o.foldexpr='nvim_treesitter#foldexpr()'
