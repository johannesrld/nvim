local lspconfig = require("lspconfig")
local lsp_comf = vim.lsp.protocol.make_client_capabilities()
lsp_comf.textDocument.completion.completionItem.snippetSupport = true
local cmp_cap = require("cmp_nvim_lsp").default_capabilities(lsp_comf)
lspconfig.html.setup {
  capabilities = cmp_cap,
}
lspconfig.emmet_language_server.setup{
  init_options = {
    showExpandedAbbreviation = "always",
    showAbbreviationSuggestions = true,
    showSuggestionsAsSnippets = true,
  }
}
