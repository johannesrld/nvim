local cmp_capabilities = require('cmp_nvim_lsp').default_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)
cmp_capabilities.textDocument.completion.completionItem.snippetSupport = true
---@param tbl table<string, any>
---@return function
local function config(tbl)
  local name = tbl[1]
  tbl[1] = nil
  tbl['capabilities'] = cmp_capabilities
  return function ()
    require('lspconfig')[name].setup(tbl)
  end
end
require('mason-lspconfig').setup_handlers {
  ['rust_analyzer'] = function() end,
  ['tsserver'] = function() end,
  ['lua_ls'] = config {
    'lua_ls',
    on_init = function(client)
      client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
        Lua = { runtime = { version = 'LuaJIT' }, },
      })
    end,
  },
  ['emmet_language_server'] = config {
    'emmet_language_server',
    init_options = {
      showExpandedAbbreviation = 'always',
      showAbbreviationSuggestions = true,
      showSuggestionsAsSnippets = true,
    },
  },
  function(ls_name)
    require('lspconfig')[ls_name].setup { capabilities = cmp_capabilities }
  end,
}
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    if not (args.data and args.data.client_id) then return end

    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    require('lsp-inlayhints').on_attach(client, bufnr)
  end,
  once = true,
})
