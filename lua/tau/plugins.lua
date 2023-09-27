return require("lazy").setup({
  --Plugins
  { "nvim-lua/plenary.nvim", lazy = true },
  {
    "jiaoshijie/undotree",
    lazy = true,
    event = "VeryLazy",
    opts = {
      float_diff = false,
    },
  },
  {
    "folke/zen-mode.nvim",
    lazy = true,
    cmd = "ZenMode",
    opts = {
      window = {
        backdrop = 1,
        width = 0.80,
        height = 0.95,
        options = {
          signcolumn = "no",
          number = false,
          relativenumber = false,
          cursorline = false,
          cursorcolumn = false,
          foldcolumn = "0",
          list = false,
        },
      },
      plugins = {
        options = {
          enabled = true,
          ruler = false,
          showcmd = false,
        },
      },
    },
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = { triggers_nowait = { "<leader>", "<localleader>" } },
  },
  {
    "nvim-telescope/telescope.nvim",
    lazy = true,
    cmd = "Telescope",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function() require("todo-comments").setup { signs = false } end,
    lazy = true,
    event = "VeryLazy",
  },

  -- Secure modelines (at the start of files a comment like "#vim: ft=sh", similar to shebangs)
  {"vim-scripts/securemodelines", lazy = false, priority = 1},
  -- LSP/DAP
  {"mfussenegger/nvim-dap", lazy = true, event = "VeryLazy"},
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "williamboman/mason.nvim",
        build = function() require("mason.api.command").MasonUpdate() end,
        event = "VeryLazy",
        lazy = true,
      },
      { "williamboman/mason-lspconfig.nvim", event = "VeryLazy", lazy = true },
      { "WhoIsSethDaniel/mason-tool-installer.nvim", event = "VeryLazy", lazy = true },
    },
    event = "VeryLazy",
    lazy = true,
  },
  {
    {
      "mhartington/formatter.nvim",
      lazy = true,
      cmd = { "Format", "FormatWrite", "FormatLock", "FormatWriteLock" },
      config = function()
        require("formatter").setup {
          filetype = {
            lua = {
              require("formatter.filetypes.lua").stylua,
            },
            html = {
              require("formatter.filetypes.html").prettierd,
            },
            css = {
              require("formatter.filetypes.css").prettierd,
            },
            python = {
              require("formatter.filetypes.python").black,
            },
          },
        }
      end,
    },
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "LspAttach",
    config = function()
      require("lsp_signature").setup {
        hint_prefix = "🦭 ",
        handler_opts = { border = "none" },
      }
    end,
  },
  { "lvimuser/lsp-inlayhints.nvim", event = "LspAttach" },
  --Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "RRethy/nvim-treesitter-endwise",
    },
  },
  { "JoosepAlviste/nvim-ts-context-commentstring", lazy = true },
  {
    "echasnovski/mini.comment",
    event = "VeryLazy",
    opts = {
      options = {
        custom_commentstring = function()
          return require("ts_context_commentstring.internal").calculate_commentstring()
            or vim.bo.commentstring
        end,
      },
    },
  },
  { "andymass/vim-matchup", lazy = true, event = "VeryLazy" },
  {
    "RRethy/nvim-treesitter-textsubjects",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
  { "windwp/nvim-ts-autotag", ft = "html" },
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function() require("lsp_lines").setup() end,
    lazy = true,
    event = "LspAttach",
  },
  {
    "nmac427/guess-indent.nvim",
    init = function() require("guess-indent").setup {} end,
  },
  {
    "altermo/ultimate-autopair.nvim",
    branch = "v0.6",
    event = "InsertEnter",
    config = function() require("ultimate-autopair").setup {} end,
  },
  {
    "folke/trouble.nvim",
    opts = {
      icons = false,
      fold_open = "v", -- icon used for open folds
      fold_closed = ">", -- icon used for closed folds
      indent_lines = false, -- add an indent guide below the fold icons
      signs = {
        error = "X",
        warning = "W",
        hint = "H",
        information = "?",
      },
      use_diagnostic_signs = false, -- enabling this will use the signs defined in your lsp client
    },
    lazy = true,
    cmd = "TroubleToggle",
  },
  { "anuvyklack/hydra.nvim" },
  {
    "jose-elias-alvarez/null-ls.nvim",
    init = function()
      local null_ls = require("null-ls")
      null_ls.setup {
        sources = {
          null_ls.builtins.diagnostics.stylelint,
          null_ls.builtins.diagnostics.mypy,
          null_ls.builtins.diagnostics.markdownlint,
          null_ls.builtins.formatting.dprint,
        },
      }
    end,
  },
  -- Theming
  "nvim-lualine/lualine.nvim",
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
  {
    "lukas-reineke/indent-blankline.nvim",
    branch = "v3",
    event = "VeryLazy",
    config = function()
      local highlight = {
        "StatusLine",
        "Whitespace",
      }
      require("ibl").setup {
        indent = { highlight = highlight, char = "" },
        whitespace = {
          highlight = highlight,
          remove_blankline_trail = false,
        },
        scope = { enabled = false },
      }
    end,
  },
  {
    "johannesrld/gruber-darker.nvim",
    lazy = false,
    priority = 1000,
    init = function() vim.cmd("colorscheme gruber-darker") end,
    opts = {
      bold = true,
      italic = {
        strings = false,
        comments = false,
      },
    },
  },
  -- Completion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
    },
  },

  {
    "L3MON4D3/LuaSnip",
    version = "1.*",
    build = "make install_jsregexp",
  },
  "saadparwaiz1/cmp_luasnip",

  --Git
  {
    "NeogitOrg/neogit",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = true,
    cmd = "Neogit",
    opts = {
      integrations = {
        diffview = true,
      },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function() require("gitsigns").setup() end,
    lazy = true,
    event = "VeryLazy",
  },
  {
    "sindrets/diffview.nvim",
    lazy = true,
    opts = {
      use_icons = false,
      icons = { -- Only applies when use_icons is true.
        folder_closed = ">",
        folder_open = "v",
      },
      signs = {
        fold_closed = ">",
        fold_open = "v",
        done = "✓",
      },
    },
  },
  {
    "wintermute-cell/gitignore.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    lazy = true,
  },
  -- Webdev
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    lazy = true,
    ft = { "ts", "js", "tsx", "jsx" },
    config = function()
      require("typescript-tools").setup {}
      require("lspconfig")["typescript-tools"].launch()
    end,
  },
  -- python
  { "mfussenegger/nvim-dap-python", ft = "py" },
  {
    "chrisgrieser/nvim-puppeteer",
    dependencies = "nvim-treesitter/nvim-treesitter",
  },
  --Rust
  { "simrat39/rust-tools.nvim", lazy = true },
  { "Saecki/crates.nvim", lazy = true },
}, {
  performance = {
    cache = {
      enabled = true,
    },
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
  ui = {
    icons = {
      cmd = "$ ",
      config = "c",
      event = "!",
      ft = "ft",
      init = "in",
      import = "ip",
      keys = "ky",
      lazy = "zz",
      loaded = "●",
      not_loaded = "○",
      plugin = "∈ ",
      runtime = "V ",
      source = "◉",
      start = "▶",
      task = "✓ ",
      list = {
        "●",
        "➜",
        "★",
        "‒",
      },
    },
  },
})
