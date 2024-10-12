return {
  {
    'echasnovski/mini.statusline',
    opts = { set_vim_settings = false, use_icons = false },
    version = false,
  },
  {
    'uga-rosa/ccc.nvim',
    event = 'VeryLazy',
    opts = { highlighter = { auto_enable = true } },
  },
  {
    'johannesrld/gruv9',
    priority = 1000,
    lazy = false,
    init = function() vim.cmd 'colorscheme gruber-darker' end,
  },
}
