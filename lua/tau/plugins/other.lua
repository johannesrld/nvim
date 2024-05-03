return {
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
      highlight = { keyword = "bg", after = "" }
    }
  },
  {
    'nvim-focus/focus.nvim',
    version = '*',
    opts = { commands = false },
    event = 'VeryLazy'
  },
  { 'nvim-lua/plenary.nvim' },
  { 'vim-scripts/securemodelines', lazy = false, priority = 1 },
  {
    'windwp/nvim-autopairs',
    config = function()
      local npairs = require("nvim-autopairs")
      local cond = require('nvim-autopairs.conds')
      local ts_cond = require('nvim-autopairs.ts-conds')
      npairs.setup {
        check_ts = true,
        ts_config = { lisp = { 'comment', 'block_comment' } }
      }
      npairs.get_rules("'")[1].not_filetypes = { "scheme", "lisp" }
      npairs.get_rules("`")[1].not_filetypes = { "scheme", "lisp" }
      npairs.get_rules("'")[1]:with_pair(cond.not_after_text("["))
      ---@type function
      local Rule = require("nvim-autopairs.rule")
      npairs.add_rules {
        Rule("*", "*", { "lisp" }):with_pair(ts_cond.is_not_ts_node({ 'str_lit' })),
        Rule("#|", "|#", { "lisp" }):with_pair(ts_cond.is_not_ts_node({ 'str_lit' })),
        Rule("~(", "~)", { "lisp" }):with_pair(ts_cond.is_ts_node({ 'str_lit' })),
        Rule("~:(", "~)", { "lisp" }):with_pair(ts_cond.is_ts_node({ 'str_lit' })),
        Rule("~@(", "~)", { "lisp" }):with_pair(ts_cond.is_ts_node({ 'str_lit' })),
        Rule("~:@(", "~)", { "lisp" }):with_pair(ts_cond.is_ts_node({ 'str_lit' })),
        Rule("~{", "~}", { "lisp" }):with_pair(ts_cond.is_ts_node({ 'str_lit' })),
        Rule("~:{", "~}", { "lisp" }):with_pair(ts_cond.is_ts_node({ 'str_lit' })),
        Rule("~@{", "~}", { "lisp" }):with_pair(ts_cond.is_ts_node({ 'str_lit' })),
        Rule("~:@{", "~}", { "lisp" }):with_pair(ts_cond.is_ts_node({ 'str_lit' })),
        Rule("~[", "~]", { "lisp" }):with_pair(ts_cond.is_ts_node({ 'str_lit' })),
        Rule("~:[", "~]", { "lisp" }):with_pair(ts_cond.is_ts_node({ 'str_lit' })),
        Rule("~@[", "~]", { "lisp" }):with_pair(ts_cond.is_ts_node({ 'str_lit' })),
      }
    end
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
      local action = require "telescope.actions"
      require("telescope").setup {
        defaults = {
          mappings = {
            i = {
              ["<C-j>"] = action.move_selection_next,
              ["<C-k>"] = action.move_selection_previous
            }
          }
        }
      }
    end
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
    'folke/trouble.nvim',
    opts = {
      icons = false,
      fold_open = 'v',
      fold_closed = '>',
      indent_lines = false,
      signs = { error = 'X', warning = 'W', hint = 'H', information = '?' },
      use_diagnostic_signs = false,
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
