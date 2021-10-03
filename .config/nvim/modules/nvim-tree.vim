let g:nvim_tree_respect_buf_cwd = 1
lua <<EOF
require'nvim-tree'.setup {
  ignore_ft_on_setup= { 'startify','dashboard' },
  update_cwd=         true
}
EOF
