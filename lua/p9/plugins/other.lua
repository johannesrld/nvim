return {
  {
    'windwp/nvim-autopairs',
    lazy = true,
    event = "InsertEnter",
    config = function()
      local np = require 'nvim-autopairs'
      np.setup { check_ts = true, ts_config = { lisp = { 'comment', 'block_comment' } } }
      np.get_rules("'")[1]['not_filetypes'] = { 'scheme', 'lisp', 'fennel' }
      np.get_rules('`')[1]['not_filetypes'] = { 'scheme', 'lisp', 'fennel' }
    end,
  },
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    init = function()
      vim.opt.timeout = true
      vim.opt.timeoutlen = 300
    end,
    opts = {
      preset = 'helix',
      icons = {
        breadcrumb = '-',
        separator = '->',
        mappings = false,
        colors = false,
        keys = {
          Up = '^',
          Down = 'v',
          Left = '<',
          Right = '>',
          C = 'C-',
          -- M = "M-",
          -- D = "C-",
          S = 'Shift',
          CR = 'CR',
          Esc = 'Esc',
          ScrollWheelDown = 'SWD',
          ScrollWheelUp = 'SWU',
          NL = 'NL',
          BS = 'BS',
          Space = 'SPC',
          Tab = 'Tab',
          F1 = 'F1',
          F2 = 'F2',
          F3 = 'F3',
          F4 = 'F4',
          F5 = 'F5',
          F6 = 'F6',
          F7 = 'F7',
          F8 = 'F8',
          F9 = 'F9',
          F10 = 'F10',
          F11 = 'F11',
          F12 = 'F12',
        },
      },
    },
  },
  {
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    config = function()
      local action = require 'telescope.actions'
      return require('telescope').setup {
        defaults = {
          mappings = {
            i = {
              ['<C-j>'] = action.move_selection_next,
              ['<C-k>'] = action.move_selection_previous,
            },
          },
        },
      }
    end,
    dependencies = { 'nvim-lua/plenary.nvim' },
    lazy = true,
  },
  {
    'folke/trouble.nvim',
    cmd = 'Trouble',
    lazy = true,
    opts = {
      icons = {
        indent = { fold_closed = '>', fold_open = 'v' },
        folder_closed = '- ',
        folder_open = '- ',
      },
    },
    config = true,
  },
  'onsails/lspkind.nvim',
  -- {
  --   'Saghen/blink.cmp',
  --   init = function() require('blink.cmp').setup() end,
  --   build = "cargo build --release"
  -- }
  {
    'iguanacucumber/magazine.nvim',
    lazy = true,
    event = { "InsertEnter", "CmdlineEnter" },
    config = function() require "p9.cmp" end,
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'https://codeberg.org/FelipeLema/cmp-async-path',
      'hrsh7th/cmp-cmdline',
      'saadparwaiz1/cmp_luasnip',
      {
        'L3MON4D3/LuaSnip',
        lazy = true,
        build = 'make install_jsregexp',
        version = '1.*',
      },
    },
  },
}
