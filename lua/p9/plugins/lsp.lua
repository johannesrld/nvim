return {
  {
    'williamboman/mason.nvim',
    dependencies = { 'neovim/nvim-lspconfig' },
    event = 'VeryLazy',
    lazy = true,
    build = function()
      require('mason.api.command').MasonUpdate()
    end,
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
}
