local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("lspconfig").lua_ls.setup {
  capabilities = capabilities,
  on_init = function(client)
    client.config.settings = vim.tbl_deep_extend("force", client.config.settings.Lua, {
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = { vim.env.VIMRUNTIME },
      },
      telemetry = {
        enable = false,
      },
    })

    client.notify(
      "workspace/didChangeConfiguration",
      { settings = client.config.settings }
    )
    return true
  end,
}
