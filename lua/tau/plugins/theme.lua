return {
  {
    "echasnovski/mini.statusline",
    opts = { set_vim_settings = false, use_icons = false },
    version = false
  },
  {
    "uga-rosa/ccc.nvim",
    opts = { highlighter = { auto_enable = true } }
  },
  {
    "johannesrld/plan-gruber",
    priority = 1000,
    lazy = false,
    init = function()
      vim.cmd("colorscheme gruber-darker")
    end
  },
}
