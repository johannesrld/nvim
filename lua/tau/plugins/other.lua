return {
  --Plugins
  { 'nvim-lua/plenary.nvim' },
  { 'anuvyklack/hydra.nvim' },
  { 'vim-scripts/securemodelines', lazy = false,          priority = 1 },
  { 'windwp/nvim-autopairs',       event = 'InsertEnter', config = true },
  {
    'jiaoshijie/undotree',
    lazy = true,
    event = 'VeryLazy',
    opts = { float_diff = false },
  },
  {
    'nvim-orgmode/orgmode',
    lazy = true,
    ft = { 'org', 'orgmode' },
    config = function()
      require('orgmode').setup_ts_grammar()
      require('orgmode').setup
      {
        org_agenda_files = '~/orgfiles/**/*',
        org_default_notes_file = '~/orgfiles/refile.org',
      }
    end,
  },
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = { triggers_nowait = { '<leader>', '<localleader>' } },
  },
  {
    'nvim-telescope/telescope.nvim',
    lazy = true,
    cmd = 'Telescope',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local actions = require "telescope.actions"
      require("telescope").setup {
        defaults = {
          mappings = {
            i = {
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous
            }
          }
        }
      }
    end
  },
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'RRethy/nvim-treesitter-endwise',
    },
  },
  {
    'echasnovski/mini.comment',
    event = 'VeryLazy',
    opts = {
      options = {
        custom_commentstring = function()
          return require('ts_context_commentstring.internal').calculate_commentstring()
              or vim.bo.commentstring
        end,
      },
    },
    dependencies = {
      { 'JoosepAlviste/nvim-ts-context-commentstring', lazy = true },
    }
  },
  {
    'hiphish/rainbow-delimiters.nvim',
    lazy = true,
    ft = { 'fennel', 'lisp', 'racket', 'clojure', 'guile', 'haskell' },
  },
  {
    'eraserhd/parinfer-rust',
    build = 'cargo build --release',
    lazy = true,
    event = 'InsertEnter',
    ft = { 'fennel', 'lisp', 'racket', 'guile' },
  },
  {
    'RRethy/nvim-treesitter-textsubjects',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
  },
  {
    'nmac427/guess-indent.nvim',
    init = function() require('guess-indent').setup {} end,
  },
  {
    'folke/trouble.nvim',
    opts = {
      icons = false,
      fold_open = 'v',      -- icon used for open folds
      fold_closed = '>',    -- icon used for closed folds
      indent_lines = false, -- add an indent guide below the fold icons
      signs = {
        error = 'X',
        warning = 'W',
        hint = 'H',
        information = '?',
      },
      use_diagnostic_signs = false, -- enabling this will use the signs defined in your lsp client
    },
    lazy = true,
    cmd = 'TroubleToggle',
  },
  -- Completion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      { 'L3MON4D3/LuaSnip', version = '1.*', build = 'make install_jsregexp', },
      'saadparwaiz1/cmp_luasnip',
    },
  },
}
