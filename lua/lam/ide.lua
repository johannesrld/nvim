vim.pack.add({
  'https://github.com/williamboman/mason.nvim',
  { src = 'https://github.com/neovim/nvim-lspconfig' },
  { src = 'https://github.com/saghen/blink.cmp', version = 'v1.8.0' },
})

do
  local required = false
  vim.api.nvim_create_autocmd({ 'InsertEnter', 'CmdlineEnter' }, {
    once = true,
    callback = function()
      if required then return end
      required = true
      require('blink.cmp').setup({
        sources = {
          per_filetype = {
            markdown = { 'snippets', 'lsp', 'path' },
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
    end,
  })
end
require('mason').setup()

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('blink.cmp').get_lsp_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true
vim.lsp.config('*', { capabilities = capabilities })

local installedPacks = require('mason-registry').get_installed_packages()
vim.lsp.enable(vim.iter(installedPacks):fold({}, function(acc, pack)
  table.insert(acc, pack.spec.neovim and pack.spec.neovim.lspconfig)
  return acc
end))
