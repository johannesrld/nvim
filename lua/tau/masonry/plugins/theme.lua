return {
  {
    "Mofiqul/vscode.nvim",
    priority = 1000,
    opts = { transparent = false },
    init = function () vim.cmd("colorscheme vscode") end
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
