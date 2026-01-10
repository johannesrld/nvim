local client_capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = require('blink.cmp').get_lsp_capabilities(client_capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true
local default_global_config = { capabilities = capabilities }

vim.lsp.config('*', default_global_config)

local installedPacks = require('mason-registry').get_installed_packages()
vim.lsp.enable(vim.iter(installedPacks):fold({}, function(acc, pack)
  if pack.spec.neovim and pack.spec.neovim.lspconfig == 'ts_ls' then return acc end
  table.insert(acc, pack.spec.neovim and pack.spec.neovim.lspconfig)
  return acc
end))
