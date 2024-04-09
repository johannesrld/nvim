return {
  {
    "johannesrld/gruber-darker.nvim",
    -- Optionally install Lush. Allows for more configuration or extending the colorscheme
    -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
    -- In Vim, compat mode is turned on as Lush only works in Neovim.
    priority = 1000,
    init = function()
      vim.cmd [[colorscheme gruber-darker]]
    end,
  },
  { 'johannesrld/vscode.nvim', branch = "better-highlights"},
  {
    'uga-rosa/ccc.nvim',
    lazy = true,
    event = 'BufRead',
    opts = {
      highlighter = {
        auto_enable = true,
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
