local function on_attach(bufnr)
  local api = require('nvim-tree.api')

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end


  -- Default mappings not inserted as:
  --  remove_keymaps = true
  --  OR
  --  view.mappings.custom_only = true


  -- Mappings migrated from view.mappings.list
  --
  -- You will need to insert "your code goes here" for any mappings with a custom action_cb
  vim.keymap.set('n', 'A', api.fs.create, opts('Create'))
  vim.keymap.set('n', 'C', api.fs.copy.node, opts('Copy'))
  vim.keymap.set('n', 'D', api.fs.remove, opts('Delete'))
  vim.keymap.set('n', 'M', api.fs.rename, opts('Rename'))
  vim.keymap.set('n', 'P', api.fs.paste, opts('Paste'))
  vim.keymap.set('n', 'R', api.tree.reload, opts('Refresh'))
  vim.keymap.set('n', 'X', api.fs.cut, opts('Cut'))
  vim.keymap.set('n', 's', api.node.open.vertical, opts('Open: Vertical Split'))
  vim.keymap.set('n', 'i', api.node.open.horizontal, opts('Open: Horizontal Split'))
  vim.keymap.set('n', 'p', api.node.navigate.parent_close, opts('Close Directory'))
  vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', 'o', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', '<2-LeftMouse>', api.node.open.edit, opts('Open'))

end

require'nvim-tree'.setup {
  on_attach = on_attach,
  respect_buf_cwd = true,
  update_cwd = true,
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
  git = {
    ignore = false
  }
}
