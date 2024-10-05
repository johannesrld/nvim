return {
  {
    "echasnovski/mini.statusline",
    opts = { set_vim_settings = false, use_icons = false },
    version = false
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    opts = {
      enable = { migrations = false },
      styles = { bold = false, italic = false }
    },
    init = function()
      vim.cmd("colorscheme rose-pine")
    end
  },
}
