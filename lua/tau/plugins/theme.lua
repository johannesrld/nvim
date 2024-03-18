return {
  -- {
  --   'sainnhe/gruvbox-material',
  --   priority = 1000,
  --   init = function()
  --     vim.g.gruvbox_material_background = 'hard'
  --   end,
  -- },
  -- { "johannesrld/gruber-darker.nvim" },
  {
    'rebelot/kanagawa.nvim',
    priority = 1000,
    opts = {
      commentStyle = { italic = false },
      keywordStyle = { italic = false },
      theme = 'dragon'
    },
    init = function()
      vim.cmd 'colorscheme kanagawa-dragon'
    end
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
