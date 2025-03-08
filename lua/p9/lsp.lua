vim.lsp.set_log_level 'OFF'
local capabilities
do
  local client_capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require('blink.cmp').get_lsp_capabilities(client_capabilities)
end
capabilities.textDocument.completion.completionItem.snippetSupport = true
local function _1_(_241)
  return require('lspconfig')[_241].setup { capabilities = capabilities }
end
local function _2_()
  return require('lspconfig').emmet_language_server.setup {
    init_options = {
      showAbbreviationSuggestions = true,
      showExpandedAbbreviation = 'always',
      showSuggestionsAsSnippets = true,
    },
    capabilities = capabilities,
  }
end
local function _3_()
  return require('lspconfig').jsonls.setup {
    settings = {
      json = {
        schemas = require('schemastore').json.schemas(),
        validate = { enable = true },
      },
    },
    capabilities = capabilities,
  }
end
local function _4_() end
local function _5_() end
return require('mason-lspconfig').setup_handlers {
  _1_,
  emmet_language_server = _2_,
  jsonls = _3_,
  rust_analyzer = _4_,
  ts_ls = _5_,
}
