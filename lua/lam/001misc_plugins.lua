vim.pack.add({
  'https://github.com/nvim-mini/mini.ai',
  'https://github.com/nvim-mini/mini.bracketed',
  'https://github.com/nvim-mini/mini.surround',
  'https://github.com/nvim-mini/mini.align',
  'https://github.com/nvim-mini/mini.bufremove',
  'https://github.com/nvim-mini/mini.tabline',
  'https://github.com/echasnovski/mini.statusline',
  'https://github.com/stevearc/oil.nvim',
})

require('mini.bufremove').setup()
require('mini.tabline').setup({ use_icons = false })
require('mini.statusline').setup({
  set_vim_settings = false,
  use_icons = false,
})
vim.defer_fn(function()
  require('mini.ai').setup()
  require('mini.bracketed').setup()
  require('mini.surround').setup()
  require('mini.align').setup()
end, 0)

require('oil').setup({
  columns = {
    'permissions',
  },
  view_options = {
    show_hidden = true,
    is_always_hidden = function(n, _) return n == '.git' end,
  },
  win_options = {
    signcolumn = 'no',
    foldcolumn = '0',
    colorcolumn = '',
    spell = false,
  },
  delete_to_trash = true,
  use_default_keymaps = false,
  keymaps = {
    ['<CR>'] = 'actions.select',
    ['P'] = { 'actions.preview', mode = 'n', opts = { horizontal = true } },
    ['q'] = { 'actions.close', mode = 'n' },
    ['r'] = 'actions.refresh',
    ['-'] = { 'actions.parent', mode = 'n' },
    ['_'] = { 'actions.open_cwd', mode = 'n' },
    ['`'] = { 'actions.cd', mode = 'n' },
    ['gs'] = { 'actions.change_sort', mode = 'n' },
    ['gx'] = 'actions.open_external',
    ['g.'] = { 'actions.toggle_hidden', mode = 'n' },
  },
})
