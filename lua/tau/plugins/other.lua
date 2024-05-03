return {
  --Plugins
  {
    'folke/todo-comments.nvim',
    opts = {
      signs = false,
      keywords = {
        FIX = { icon = "" },
        TODO = { icon = "" },
        HACK = { icon = "" },
        WARN = { icon = "" },
        PERF = { icon = "" },
        NOTE = { icon = "" },
        TEST = { icon = "" }
      },
      highlight = {
        keyword = "bg",
        after = ""
      }
    }
  },
  {
    'nvim-focus/focus.nvim',
    version = '*',
    opts = {
      commands = false
    },
    event = 'VeryLazy'
  },
  -- { 'm4xshen/hardtime.nvim',       config = true },
  { 'nvim-lua/plenary.nvim' },
  { 'anuvyklack/hydra.nvim' },
  { 'vim-scripts/securemodelines', lazy = false, priority = 1 },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
    opts = {
      check_ts = true
    }
  },
  {
    'jiaoshijie/undotree',
    lazy = true,
    event = 'VeryLazy',
    opts = { float_diff = false },
  },
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = { triggers_nowait = { '<leader>', '<localleader>', '<LocalLeader>', '<Localleader>' } },
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
    'johannesrld/nvim-cmp',
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
    branch = 'expose-first-entry'
  },
}
