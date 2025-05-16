return {
  {
    'echasnovski/mini.statusline',
    opts = { set_vim_settings = false, use_icons = false },
    version = false,
  },
  {
    'uga-rosa/ccc.nvim',
    event = 'BufRead',
    opts = { highlighter = { auto_enable = true } },
  },
  {
    "johannesrld/cold.nvim",
    priority = 1000,
    lazy = true,
    init = function() vim.cmd 'colorscheme cold' end,
  }
}
