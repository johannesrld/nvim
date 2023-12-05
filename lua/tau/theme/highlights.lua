vim.opt.termguicolors = true
require("lspconfig.ui.windows").default_options.border = "single"

require("nvim-treesitter.configs").setup {
  ensure_installed = {
    "lua",
    "python",
    "org",
    "bash",
    "html",
    "javascript",
    "css",
    "typescript",
  },

  indent = { enable = true, disable = { "html" } },

  auto_install = true,
  highlight = { enable = true, additional_vim_regex_highlighting = { "org" } },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<c-space>",
      node_incremental = "<c-space>",
      scope_incremental = "<c-s>",
      node_decremental = "<M-space>",
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["aa"] = "@parameter.outer",
        ["ia"] = "@parameter.inner",
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },
    swap = {
      enable = true,
    },
  },
  endwise = {
    enable = true,
  },
  autotag = {
    enable = true,
    enable_rename = true,
  },
  matchup = {
    enable = true,
  },
}
vim.g.matchup_matchparen_deferred = 1
vim.g.matchup_matchparen_hi_surround_always = 1
