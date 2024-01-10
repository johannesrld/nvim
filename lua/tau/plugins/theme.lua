return {
  {
    'sainnhe/gruvbox-material',
    priority = 1000,
    init = function()
      vim.g.gruvbox_material_background = 'hard'
      vim.cmd 'colorscheme gruvbox-material'
    end,
  },
  {
    'uga-rosa/ccc.nvim',
    lazy = true,
    event = 'BufRead',
    opts = {
      highlighter = {
        auto_enable = true,
        lsp = true,
      },
    },
  },
  {
    'echasnovski/mini.statusline',
    version = false,
    opts = {
      use_icons = false,
      set_vim_settings = false
    }
  },
}
