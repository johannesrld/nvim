return {
  {
    "miikanissi/modus-themes.nvim",
    priority = 1000,
    opts = { styles = { keywords = { italic = false } } },
    init = function () vim.cmd [[colorscheme modus]] end
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
