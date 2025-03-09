return {
  {
    'b0o/SchemaStore.nvim',
    ft = { 'json' },
    config = function()
      local client_capabilities = vim.lsp.protocol.make_client_capabilities()
      local capabilities = require('blink.cmp').get_lsp_capabilities(client_capabilities)
      capabilities.textDocument.completion.completionItem.snippetSupport = true
      require('lspconfig').jsonls.setup {
        settings = {
          json = {
            schemas = require('schemastore').json.schemas(),
            validate = { enable = true },
          },
        },
        capabilities = capabilities
      }
    end
  }
}
