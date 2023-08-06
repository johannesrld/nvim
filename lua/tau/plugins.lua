return require("lazy").setup({
  --Plugins
  { "nvim-lua/plenary.nvim", lazy = true },
  {
    "jiaoshijie/undotree",
    lazy = true,
    opts = {
      float_diff = false,
    },
  },
  {
    "folke/zen-mode.nvim",
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
      on_open = function() vim.opt.laststatus = 0 end,
      on_close = function() vim.opt.laststatus = 3 end,
    },
    lazy = true,
    cmd = "ZenMode",
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
    init = function() require("todo-comments").setup { signs = false } end,
  },

  -- Secure modelines (at the start of files a comment like "#vim: ft=sh", similar to shebangs)
  "vim-scripts/securemodelines",
  -- LSP/DAP
  "mfussenegger/nvim-dap",
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
      init = function()
        require("formatter").setup {
          filetype = {
            lua = {
              require("formatter.filetypes.lua").stylua,
            },
            html = {
              require("formatter.filetypes.html").htmlbeautify,
            },
          },
        }
      end,
    },
  },
  {"ray-x/lsp_signature.nvim", event = "VeryLazy", init = function ()
    require("lsp_signature").setup {hint_prefix = "🦭 ", handler_opts = {border = "none"}}
  end},
  {"lvimuser/lsp-inlayhints.nvim", event = "VeryLazy"},
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
  { "andymass/vim-matchup" },
  {
    "RRethy/nvim-treesitter-textsubjects",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
  { "windwp/nvim-ts-autotag", ft = "html" },
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    init = function() require("lsp_lines").setup() end,
    lazy = true,
    event = "VeryLazy",
  },
  {
    "nmac427/guess-indent.nvim",
    init = function() require("guess-indent").setup {} end,
  },
  {
    "windwp/nvim-autopairs",
    init = function() require("nvim-autopairs").setup {} end,
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
  -- Theming
  {
    "catppuccin/nvim",
    priority = 1000,
    lazy = false,
    init = function()
      require("catppuccin").setup {
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        background = { -- :h background
          light = "latte",
          dark = "mocha",
        },
        integrations = {
          cmp = true,
          lsp_trouble = true,
          which_key = true,
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
          neogit = true,
          mason = true,
          harpoon = true
          -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
        },
      }
      vim.cmd.colorscheme "catppuccin"
    end,
  },
  "nvim-lualine/lualine.nvim",
  { "uga-rosa/ccc.nvim", event = "VeryLazy" },
  { "lukas-reineke/indent-blankline.nvim", event = "VeryLazy", lazy = true },
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

  { "L3MON4D3/LuaSnip", version = "1.*", build = "make install_jsregexp" },
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
    init = function() require("gitsigns").setup() end,
    lazy = true,
    event = "VeryLazy",
  },
  {
    "sindrets/diffview.nvim",
    init = function()
      require("diffview").setup {
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
      }
    end,
  },

  --Rust
  { "simrat39/rust-tools.nvim", lazy = true },
  { "Saecki/crates.nvim", lazy = true },

  -- Csharp
  "OrangeT/vim-csharp",
  -- OCaml
  {
    "tjdevries/ocaml.nvim",
    init = function()
      require("ocaml").setup()
    end,
  },
  -- ruby
  { "vim-ruby/vim-ruby", ft = "ruby" },
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
