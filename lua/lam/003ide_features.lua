vim.pack.add({
  'https://github.com/williamboman/mason.nvim',
  { src = 'https://github.com/neovim/nvim-lspconfig' },
  { src = 'https://github.com/saghen/blink.cmp', version = 'v1.8.0' },
})
local finished = false

vim.api.nvim_create_autocmd({ 'InsertEnter', 'CmdlineEnter' }, {
  callback = function()
    if finished then return end
    require('blink.cmp').setup({
      appearance = {
        kind_icons = {
          Function = 'λ',
          Method = 'ƛ',
          Constructor = 'ƛ',
          Field = '∈',
          Property = '∈',
          Variable = 'α',
          Snippet = '⍉',
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
          Constant = 'α',
          Struct = 'S',
          Event = ' ',
          Operator = ' ',
          Text = ' ',
        },
      },
      completion = {
        ghost_text = { enabled = true },
      },
      sources = {
        per_filetype = {
          gitcommit = { 'conventional_commits' },
          markdown = { 'snippets', 'lsp', 'path' },
        },
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
        ['<c-k>'] = { 'select_prev', 'fallback' },
      },
      fuzzy = { implementation = 'prefer_rust_with_warning' },
      signature = { enabled = true },
    })
    finished = true
  end,
})
require('mason').setup({
  ui = {
    icons = {
      package_installed = '+',
      package_pending = '#',
      package_uninstalled = '-',
    },
  },
})

local client_capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = require('blink.cmp').get_lsp_capabilities(client_capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true
local default_global_config = { capabilities = capabilities }

vim.lsp.config('*', default_global_config)

local installedPacks = require('mason-registry').get_installed_packages()
vim.lsp.enable(vim.iter(installedPacks):fold({}, function(acc, pack)
  table.insert(acc, pack.spec.neovim and pack.spec.neovim.lspconfig)
  return acc
end))
