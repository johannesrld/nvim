local client_capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = require('blink.cmp').get_lsp_capabilities(client_capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

require("mason-lspconfig").setup {
  automatic_enable = {
    exclude = {
      "ts_ls"
    }
  }
}
vim.lsp.config('*', { capabilities = capabilities })
vim.lsp.config('emmet_language_server', {
  init_options = {
    showAbbreviationSuggestions = true,
    showExpandedAbbreviation = 'always',
    showSuggestionsAsSnippets = true,
  },
})

vim.lsp.config('lua_ls', {
  on_init = function(client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      if
          path ~= vim.fn.stdpath('config')
          and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
      then
        return
      end
    end

    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = { version = 'LuaJIT', },
      -- Make the server aware of Neovim runtime files
    })
  end,
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      root_markers = {
        ".luarc.json",
        ".luarc.jsonc",
        ".luacheckrc",
        ".stylua.toml",
        ".git",
      },
      completion = {
        callSnippet = 'Disable',
      }
    }
  }
})
