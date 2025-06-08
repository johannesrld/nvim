local client_capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = require('blink.cmp').get_lsp_capabilities(client_capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

require("mason-lspconfig").setup {
  automatic_enable = {
    exclude = {
      "ts_ls"
    }
  }
}
vim.lsp.config('*', { capabilities = capabilities })
vim.lsp.config('emmet_language_server', {
  init_options = {
    showAbbreviationSuggestions = true,
    showExpandedAbbreviation = 'always',
    showSuggestionsAsSnippets = true,
  },
})
vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      completion = {
        callSnippet = 'Disable',
        keywordSnippet = 'Disable'
      }
    }
  }
})
vim.lsp.config('janet-lsp', {
  cmd = {
    'janet-lsp',
    '--stdio',
  },
  filetypes = { 'janet' },
  root_markers = { 'project.janet', '.git' },
})
vim.lsp.enable({ "janet-lsp" })
