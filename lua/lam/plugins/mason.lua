return {
  {
    'williamboman/mason.nvim',
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
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    dependencies = { 'williamboman/mason.nvim' },
    lazy = true,
    cmd = { 'MasonToolsInstall', 'MasonToolsUpdate' },
    opts = {
      run_on_start = false,
      debounce_hours = 5,
      start_delay = 3000,
      ensure_installed = {
        'shellcheck',
        'shellharden',
        'shfmt',
        'bash-language-server',
        'lua-language-server',
        'json-lsp',
        'markuplint',
      },
      auto_update = false,
    },
  },
}
