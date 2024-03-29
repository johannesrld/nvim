local cmp_capabilities = require 'tau.lsp.capabilities'
return {
  emmet_language_server = {
    capabilities = cmp_capabilities,
    init_options = {
      showExpandedAbbreviation = 'always',
      showAbbreviationSuggestions = true,
      showSuggestionsAsSnippets = true,
    },
  },
  lua_ls = {
    capabilities = cmp_capabilities,
    on_init = function(client)
      client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
        Lua = { runtime = { version = 'LuaJIT' }, },
      })
    end,
  },
}
