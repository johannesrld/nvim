local cmp_capabilities = require 'tau.masonry.lsp.capabilities'
local server_options = require 'tau.masonry.lsp.server_options'

local blacklisted_servers = { hls = true, tsserver = true, rust_analyzer = true } -- These are handled elsewhere
require('mason-lspconfig').setup_handlers {
  function(server_name)
    if blacklisted_servers[server_name] then return end
    if server_options[server_name] ~= nil then
      require('lspconfig')[server_name].setup(server_options[server_name])
      return
    end
    require('lspconfig')[server_name].setup { capabilities = cmp_capabilities }
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
