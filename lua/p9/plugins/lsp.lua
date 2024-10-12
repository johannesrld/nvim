local function _1_() return require('mason.api.command').MasonUpdate() end
local function _2_()
  require('lint')['linters_by_ft'] = { html = { 'markuplint' } }
  local function _3_() return require('lint').try_lint() end
  return vim.api.nvim_create_autocmd(
    'BufWritePost',
    vim.tbl_extend('force', {}, { callback = _3_ })
  )
end
return {
  {
    'williamboman/mason.nvim',
    dependencies = { 'neovim/nvim-lspconfig' },
    event = 'VeryLazy',
    lazy = true,
    build = _1_,
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
    'mfussenegger/nvim-lint',
    lazy = true,
    event = 'VeryLazy',
    config = _2_,
  },
}
