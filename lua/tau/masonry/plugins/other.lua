return {
  --Plugins
  { "nvim-lua/plenary.nvim" },
  {
    "jiaoshijie/undotree",
    lazy = true,
    event = "VeryLazy",
    opts = {
      float_diff = false,
    },
    {
      'nvim-orgmode/orgmode',
      config = function()
        -- Load treesitter grammar for org
        require('orgmode').setup_ts_grammar()

        -- Setup treesitter
        -- require('nvim-treesitter.configs').setup({
        --   highlight = {
        --     enable = true,
        --     additional_vim_regex_highlighting = { 'org' },
        --   },
        --   ensure_installed = { 'org' },
        -- })

        -- Setup orgmode
        require('orgmode').setup({
          org_agenda_files = '~/orgfiles/**/*',
          org_default_notes_file = '~/orgfiles/refile.org',
        })
      end,
    }
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
  -- -- Secure modelines (at the start of files a comment like "#vim: ft=sh", similar to shebangs)
  { "vim-scripts/securemodelines", lazy = false, priority = 1 },
  -- -- LSP/DAP
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
  {
    "Olical/conjure",
    ft = {
      "clojure",
      "fennel",
      "python",
      "racket",
      "guile",
      "lisp",
    },
  },
  { "PaterJason/cmp-conjure" },
  { "hiphish/rainbow-delimiters.nvim",             lazy = true, ft = { "fennel", "lisp", "racket", "clojure", "guile" } },
  {
    "eraserhd/parinfer-rust",
    build = "cargo build --release",
    lazy = true,
    ft = { "fennel", "lisp", "racket", "guile" },
  },
  {
    "RRethy/nvim-treesitter-textsubjects",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
  { "windwp/nvim-ts-autotag", lazy = true, event = "InsertEnter" },
  {
    "nmac427/guess-indent.nvim",
    init = function() require("guess-indent").setup {} end,
  },
  {
    "folke/trouble.nvim",
    opts = {
      icons = false,
      fold_open = "v",      -- icon used for open folds
      fold_closed = ">",    -- icon used for closed folds
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
  { "windwp/nvim-autopairs", event = "InsertEnter", opts = {} },

  -- Git
  -- Webdev
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    lazy = true,
    ft = { "typescript", "javascript", "tsx", "jsx" },
    config = function()
      require("typescript-tools").setup {}
      require("lspconfig")["typescript-tools"].launch()
    end,
  },
  {
    "olrtg/nvim-emmet",
    config = function()
      vim.keymap.set(
        { "n", "v" },
        "<leader>lwa",
        require("nvim-emmet").wrap_with_abbreviation
      )
    end,
    ft = { "html", "css" },
  },
  --python
  {
    "chrisgrieser/nvim-puppeteer",
    dependencies = "nvim-treesitter/nvim-treesitter",
    lazy = true,
    event = "InsertEnter",
  },
}
