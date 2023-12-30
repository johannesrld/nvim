local cmp_capabilities = require("cmp_nvim_lsp").default_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)
cmp_capabilities.textDocument.completion.completionItem.snippetSupport = true
return cmp_capabilities
