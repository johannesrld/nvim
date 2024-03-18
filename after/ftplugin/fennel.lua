local cmp_capabilities = require 'tau.lsp.capabilities'
require('lspconfig').fennel_ls.setup { capabilities = cmp_capabilities }
