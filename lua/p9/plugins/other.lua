return {
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",  -- required
      "sindrets/diffview.nvim", -- optional - Diff integration
    },
  },
  {
    "dundalek/bloat.nvim",
    cmd = "Bloat",
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
    "m4xshen/hardtime.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    opts = {}
  },
  { "tris203/precognition.nvim", branch = "debounced", opts = {} },
  {
    'stevearc/oil.nvim',
    opts = {
      columns = {
        "permissions"
      },
      view_options = {
        show_hidden = true,
        is_always_hidden = function(n, _)
          return n == ".git"
        end
      }
    },
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
}
