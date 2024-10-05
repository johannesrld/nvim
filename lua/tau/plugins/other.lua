local function _1_()
  local np = require("nvim-autopairs")
  local cond = require("nvim-autopairs.conds")
  local ts_cond = require("nvim-autopairs.ts-conds")
  np.setup({ check_ts = true, ts_config = { lisp = { "comment", "block_comment" } } })
  np.get_rules("'")[1]["not_filetypes"] = { "scheme", "lisp", "fennel" }
  np.get_rules("`")[1]["not_filetypes"] = { "scheme", "lisp", "fennel" }
  return nil
end
local function _2_()
  return nil
end
local function _3_()
  local action = require("telescope.actions")
  return require("telescope").setup({ defaults = { mappings = { i = { ["<C-j>"] = action.move_selection_next, ["<C-k>"] = action.move_selection_previous } } } })
end
return {
  {
    "windwp/nvim-autopairs",
    config = _1_
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.opt.timeout = true
      vim.opt.timeoutlen = 300
    end,
    opts = {
      preset = "helix",
      icons = {
        breadcrumb = "-",
        separator = "->",
        mappings = false,
        colors = false,
        keys = {
          Up = "^",
          Down = "v",
          Left = "<",
          Right = ">",
          C = "C-",
          -- M = "M-",
          -- D = "C-",
          S = "Shift",
          CR = "CR",
          Esc = "Esc",
          ScrollWheelDown = "SWD",
          ScrollWheelUp = "SWU",
          NL = "NL",
          BS = "BS",
          Space = "SPC",
          Tab = "Tab",
          F1 = "F1",
          F2 = "F2",
          F3 = "F3",
          F4 = "F4",
          F5 = "F5",
          F6 = "F6",
          F7 = "F7",
          F8 = "F8",
          F9 = "F9",
          F10 = "F10",
          F11 = "F11",
          F12 = "F12",
        }
      }
    }
  },
  { "nvim-telescope/telescope.nvim", cmd = "Telescope", config = _3_, dependencies = { "nvim-lua/plenary.nvim" }, lazy = true }, { "folke/trouble.nvim", cmd = "Trouble", lazy = true, opts = { icons = { indent = { fold_closed = ">", fold_open = "v" }, folder_closed = "- ", folder_open = "- " } }, config = true }, { "onsails/lspkind.nvim" }, { "yioneko/nvim-cmp", branch = "perf", dependencies = { "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "FelipeLema/cmp-async-path", "hrsh7th/cmp-cmdline", "saadparwaiz1/cmp_luasnip", { "L3MON4D3/LuaSnip", build = "make install_jsregexp", version = "1.*" } } } }
