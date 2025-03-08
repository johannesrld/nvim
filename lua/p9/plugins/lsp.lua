return {
  {
    'williamboman/mason.nvim',
    dependencies = { 'neovim/nvim-lspconfig' },
    event = 'VeryLazy',
    lazy = true,
    build = function() require('mason.api.command').MasonUpdate() end,
    opts = {
      ui = {
        icons = {
          package_installed = '+',
          package_pending = '#',
          package_uninstalled = '-',
        },
      },
    },
  },
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = { 'williamboman/mason.nvim', 'neovim/nvim-lspconfig' },
    event = 'VeryLazy',
    lazy = true,
  },
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    dependencies = { 'williamboman/mason.nvim' },
    event = 'VeryLazy',
    lazy = true,
    opts = {
      run_on_start = true,
      debounce_hours = 5,
      start_delay = 3000,
      ensure_installed = {
        'shellcheck',
        'shellharden',
        'shfmt',
        'bash-language-server',
        'lua-language-server',
        'stylua',
        'basedpyright',
        'mypy',
        'debugpy',
        'ruff-lsp',
        'black',
        'css-lsp',
        'stylelint',
        'html-lsp',
        'emmet-language-server',
        'typescript-language-server',
        'json-lsp',
        'markuplint',
        'dprint',
      },
      auto_update = false,
    },
  },
  {
    'neovim/nvim-lspconfig',
    event = 'VeryLazy',
    lazy = true,
  },
  'onsails/lspkind.nvim',
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
  {
    'windwp/nvim-autopairs',
    lazy = true,
    event = 'InsertEnter',
    config = function()
      local np = require 'nvim-autopairs'
      np.setup {
        check_ts = true,
        ts_config = {
          lisp = { 'comment', 'block_comment' },
        },
      }
      np.get_rules("'")[1].not_filetypes = { 'scheme', 'lisp', 'fennel' }
      np.get_rules('`')[1].not_filetypes = { 'scheme', 'lisp', 'fennel' }
    end,
  },
  -- {
  --   'iguanacucumber/magazine.nvim',
  --   name = 'nvim-cmp',
  --   lazy = true,
  --   event = { 'InsertEnter', 'CmdlineEnter' },
  --   config = function()
  --     local cmp = require 'cmp'
  --     local luasnip = require 'luasnip'
  --     local lspkind = require 'lspkind'
  --     require('luasnip.loaders.from_vscode').lazy_load()
  --     local cmp_border = vim.tbl_deep_extend('force', cmp.config.window.bordered(), {
  --       border = {
  --         '\226\148\140',
  --         '\226\148\128',
  --         '\226\148\144',
  --         '\226\148\130',
  --         '\226\148\152',
  --         '\226\148\128',
  --         '\226\148\148',
  --         '\226\148\130',
  --       },
  --       scrollbar = false,
  --     })
  --     cmp.setup {
  --       performance = { debounce = 10, throttle = 20, max_view_entries = 20 },
  --       mapping = cmp.mapping.preset.insert {
  --         ['<CR>'] = cmp.mapping.confirm { select = true },
  --         ['<c-CR>'] = cmp.mapping.abort(),
  --         ['<c-j>'] = cmp.mapping.select_next_item(),
  --         ['<c-k>'] = cmp.mapping.select_prev_item(),
  --         ['<Tab>'] = cmp.mapping(function(fallback)
  --           if luasnip.jumpable(1) then
  --             luasnip.jump(1)
  --           else
  --             fallback()
  --           end
  --         end, { 'i', 's' }),
  --       },
  --       snippet = {
  --         expand = function(args) return luasnip.lsp_expand(args.body) end,
  --       },
  --       sorting = {
  --         priority_weight = 1,
  --         comparators = {
  --           cmp.config.compare.offset,
  --           cmp.config.compare.exact,
  --           cmp.config.compare.score,
  --           function(e1, e2)
  --             local _, e1_under = e1.completion_item.label:find '^_+'
  --             local _, e2_under = e2.completion_item.label:find '^_+'
  --             e1_under = (e1_under or 0)
  --             e2_under = (e2_under or 0)
  --             if e1_under < e2_under then
  --               return true
  --             else
  --               return false
  --             end
  --           end,
  --           cmp.config.compare.recently_used,
  --           cmp.config.compare.order,
  --           cmp.config.compare.locality,
  --         },
  --       },
  --       sources = cmp.config.sources {
  --         { max_item_count = 25, name = 'nvim_lsp', priority = 8 },
  --         { max_item_count = 10, name = 'luasnip', priority = 9 },
  --         { max_item_count = 10, name = 'html-css', priority = 10 },
  --       },
  --       view = {
  --         entries = { name = 'custom', selection_order = 'near_cursor' },
  --       },
  --       formatting = {
  --         fields = { 'abbr', 'kind' },
  --         format = lspkind.cmp_format {
  --           mode = 'symbol',
  --           maxwidth = 30,
  --           symbol_map = {
  --           },
  --           before = function(_, item)
  --             item['abbr'] = string.sub(item.abbr, 1, 30)
  --             item['menu'] = ''
  --             return item
  --           end,
  --         },
  --       },
  --       window = {
  --         completion = cmp_border,
  --         documentation = cmp_border,
  --       },
  --     }
  --     cmp.setup.filetype('gitcommit', {
  --       sources = cmp.config.sources({ { name = 'git' } }, { { name = 'buffer' } }),
  --     })
  --     cmp.setup.cmdline({ '/', '?' }, {
  --       mapping = cmp.mapping.preset.cmdline(),
  --       sources = { { name = 'buffer' } },
  --     })
  --     cmp.setup.cmdline(':', {
  --       mapping = cmp.mapping.preset.cmdline(),
  --       sources = cmp.config.sources(
  --         { { name = 'async_path' } },
  --         { { name = 'cmdline' } }
  --       ),
  --     })
  --     local border = {
  --       { '\226\148\140', 'FloatBorder' },
  --       { '\226\148\128', 'FloatBorder' },
  --       { '\226\148\144', 'FloatBorder' },
  --       { '\226\148\130', 'FloatBorder' },
  --       { '\226\148\152', 'FloatBorder' },
  --       { '\226\148\128', 'FloatBorder' },
  --       { '\226\148\148', 'FloatBorder' },
  --       { '\226\148\130', 'FloatBorder' },
  --     }
  --
  --     vim.api.nvim_create_autocmd('InsertEnter', {
  --       callback = function() end,
  --     })
  --     local __open_floating_preview = vim.lsp.util.open_floating_preview
  --     vim.lsp.util.open_floating_preview = function(contents, syntax, opts, ...)
  --       local real_opts = opts or {}
  --       real_opts.border = real_opts.border or border
  --       return __open_floating_preview(contents, syntax, real_opts, ...)
  --     end
  --     return vim.lsp.util.open_floating_preview
  --   end,
  --   dependencies = {
  --     'hrsh7th/cmp-nvim-lsp',
  --     'hrsh7th/cmp-buffer',
  --     'hrsh7th/cmp-nvim-lsp',
  --     'hrsh7th/cmp-buffer',
  --     'https://codeberg.org/FelipeLema/cmp-async-path',
  --     'hrsh7th/cmp-cmdline',
  --     'saadparwaiz1/cmp_luasnip',
  --     {
  --       'L3MON4D3/LuaSnip',
  --       lazy = true,
  --       build = 'make install_jsregexp',
  --       version = '1.*',
  --     },
  --   },
  -- },
  {
    'saghen/blink.cmp',
    dependencies = {
      { 'disrupted/blink-cmp-conventional-commits' },
    },
    version = '*',
    lazy = true,
    event = { 'InsertEnter', 'CmdlineEnter' },
    opts = {
      appearance = {
        kind_icons = {
          Function = '\206\187',
          Method = '\198\155',
          Constructor = '\198\155',
          Field = '\226\136\136',
          Property = '\226\136\136',
          Variable = '\206\177',
          Snippet = '\226\141\137',
          Class = 'C',
          Interface = 'I',
          Module = 'M',
          Enum = 'E',
          Keyword = 'K',
          Color = ' ',
          File = ' ',
          Reference = '*',
          Folder = ' ',
          EnumMember = 'E',
          Constant = '\206\177',
          Struct = 'S',
          Event = ' ',
          Operator = ' ',
          Text = ' ',
        }
      },
      completion = {
        ghost_text = { enabled = true }
      },
      sources = {
        per_filetype = { gitcommit = { 'conventional_commits' } },
        providers = {
          conventional_commits = {
            name = 'Conventional Commits',
            module = 'blink-cmp-conventional-commits',
          },
        },
      },
      keymap = {
        ['<CR>'] = { 'accept', 'fallback' },
        ['<c-CR>'] = { 'cancel', 'fallback' },
        ['<c-j>'] = { 'select_next', 'fallback' },
        ['<c-k>'] = { 'select_prev', 'fallback' }
      },
      fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extended = { "sources.default" }
  }
}
