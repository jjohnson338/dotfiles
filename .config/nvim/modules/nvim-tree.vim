let g:nvim_tree_respect_buf_cwd = 1
lua <<EOF
local tree_cb = require'nvim-tree.config'.nvim_tree_callback
require'nvim-tree'.setup {
  ignore_ft_on_setup= { 'startify','dashboard' },
  update_cwd=         true,
  view = {
    mappings = {
      custom_only = false,
      list = {
        { key = "A",                            cb = tree_cb("create") },
        { key = "C",                            cb = tree_cb("copy") },
        { key = "D",                            cb = tree_cb("remove") },
        { key = "M",                            cb = tree_cb("rename") },
        { key = "P",                            cb = tree_cb("paste") },
        { key = "R",                            cb = tree_cb("refresh") },
        { key = "X",                            cb = tree_cb("cut") },
        { key = "s",                            cb = tree_cb("vsplit") },
        { key = "i",                            cb = tree_cb("split") },
        { key = "p",                            cb = tree_cb("close_node") },
        { key = {"<CR>", "o", "<2-LeftMouse>"}, cb = tree_cb("edit") },
      }
    }
  },
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
  git = {
    ignore = false
  }
}
EOF
