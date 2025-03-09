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
