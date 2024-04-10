return {
  {
    'johannesrld/vscode.nvim',
    branch = "better-highlights",
    priority = 1000,
    init = function()
      vim.cmd [[colorscheme vscode]]
    end,
    config = function()
      require('vscode').setup {
        transparent = false,
        group_overrides = {
          ["@p9.operator.arrow_func"] = { link = "@keyword" },
          ["@p9.type"] = { link = "@type"},
          ["@p9.template_literal"] = { link = "@keyword" },
          ["@p9.tag.identifier"] = { link = "@variable" },
          ["@lsp.type.formatSpecifier"] = { link = "@keyword" }
        }
      }
    end
  },
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
