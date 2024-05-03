return {
  {
    'Mofiqul/vscode.nvim',
    -- branch = "better-highlights",
    priority = 1000,
    init = function()
      vim.cmd [[colorscheme vscode]]
    end,
    config = function()
      require('vscode').setup {
        transparent = false,
        group_overrides = {
          ["SpecialChar"]                  = { link = "@variable" },
          ["MatchParen"]                   = { bold = true, fg = '#18a2fe', bg = 'none' },
          ["@p9.operator.arrow_func"]      = { link = "@keyword" },
          ["@p9.type"]                     = { link = "@type" },
          ["@p9.template_literal"]         = { link = "@keyword" },
          ["@p9.tag.identifier"]           = { link = "@variable" },
          ["@p9.commonlisp.special_var"]   = { fg = "#D16969" },
          ["@string.special.symbol"]       = { link = "@constant" },
          ["@string.escape"]               = { link = "Special" },
          ["@character.printf"]            = { link = "SpecialChar" },
          ["@constant.builtin.commonlisp"] = { link = "@constant" },
          ["@lsp.type.formatSpecifier"]    = { link = "@keyword" },
          ["@lsp.type.function.clojure"]   = { link = 'none' },
          ["@lsp.type.variable.clojure"]   = { link = 'none' }
        }
      }
    end
  },
  {
    'uga-rosa/ccc.nvim',
    lazy = true,
    event = 'BufRead',
    opts = { highlighter = { auto_enable = true } },
  },
  {
    'echasnovski/mini.statusline',
    version = false,
    opts = { use_icons = false, set_vim_settings = false }
  },
}
