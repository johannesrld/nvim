return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      {
        'williamboman/mason.nvim',
        build = function() require('mason.api.command').MasonUpdate() end,
        event = 'VeryLazy',
        lazy = true,
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
        event = 'VeryLazy',
        lazy = true,
      },
      {
        'WhoIsSethDaniel/mason-tool-installer.nvim',
        event = 'VeryLazy',
        lazy = true,
        opts = {
          ensure_installed = {
            -- shell
            'shellcheck',
            'shellharden',
            'shfmt',
            'bash-language-server',

            --lua
            'lua-language-server',
            'stylua',

            --python
            'basedpyright', -- TODO: replace with pylyzer once it is mature enough
            'mypy',
            'debugpy',
            'ruff-lsp',
            'black',

            --webdev
            'css-lsp',
            'stylelint', -- Stylelint lsp server?
            'html-lsp',
            'emmet-language-server',
            'typescript-language-server',
            'json-lsp',
            'markuplint',
            --Other
            'dprint'
          },

          auto_update = false,
          run_on_start = true,
          start_delay = 3000,
          debounce_hours = 5,
        },
      },
    },
    event = 'VeryLazy',
    lazy = true,
  },
  {
    'stevearc/conform.nvim',
    lazy = true,
    event = { 'BufRead' },
    opts = {
      formatters_by_ft = {
        lua = { { 'stylua' } },
        markdown = { { 'dprint', 'markdownlint' } },
        json = { 'dprint' },
        javascript = { 'dprint' },
        typescript = { 'dprint' }
      },
    },
  },
  {
    'mfussenegger/nvim-lint',
    config = function()
      require('lint').linters_by_ft = {
        html = { 'markuplint' }
      }
      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        callback = function()
          require("lint").try_lint()
        end,
      })
    end
  },
  {
    'ray-x/lsp_signature.nvim',
    opts = {
      hint_prefix = '🦭 ',
      handler_opts = { border = 'none' },
    },
  },
  { 'lvimuser/lsp-inlayhints.nvim', event = 'LspAttach' },
}
