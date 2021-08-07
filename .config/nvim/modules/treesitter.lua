require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        'bash',
        'c_sharp',
        'comment',
        'css',
        'dockerfile',
        'graphql',
        'html',
        'java',
        'javascript',
        'json',
        'lua',
        'regex',
        'rust',
        'scss',
        'tsx',
        'typescript',
        'yaml'
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
