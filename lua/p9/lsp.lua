vim.lsp.set_log_level 'OFF'
local client_capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = require('blink.cmp').get_lsp_capabilities(client_capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true
local blank = function() end
return require('mason-lspconfig').setup_handlers {
  function(lspp)
    return require('lspconfig')[lspp].setup { capabilities = capabilities }
  end,
  emmet_language_server = function()
    return require('lspconfig').emmet_language_server.setup {
      init_options = {
        showAbbreviationSuggestions = true,
        showExpandedAbbreviation = 'always',
        showSuggestionsAsSnippets = true,
      },
      capabilities = capabilities,
    }
  end,
  jsonls = function()
    return require('lspconfig').jsonls.setup {
      settings = {
        json = {
          schemas = require('schemastore').json.schemas(),
          validate = { enable = true },
        },
      },
      capabilities = capabilities,
    }
  end,
  rust_analyzer = blank,
  ts_ls = blank,
}
