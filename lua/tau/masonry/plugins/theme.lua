return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    opts = { disable_italics = true, disable_background = true },
    init = function() vim.cmd("colorscheme rose-pine") end,
  },
  {
    "uga-rosa/ccc.nvim",
    lazy = true,
    event = "BufRead",
    config = function()
      require("ccc").setup {
        highlighter = {
          auto_enable = true,
          lsp = true,
        },
      }
    end,
  },
}
