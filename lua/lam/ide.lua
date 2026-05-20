vim.pack.add {
  "https://github.com/williamboman/mason.nvim",
  "https://github.com/neovim/nvim-lspconfig",
  { src = "https://github.com/saghen/blink.cmp", version = "v1.10.2" },
}
local lsp = vim.lsp
local blink = require "blink.cmp"
local mason, registry = require "mason", require "mason-registry"

blink.setup {
  keymap = {
    ["<CR>"] = { "accept", "fallback" },
    ["<c-CR>"] = { "cancel", "fallback" },
    ["<c-j>"] = { "select_next", "fallback" },
    ["<c-k>"] = { "select_prev", "fallback" },
  },
  signature = { enabled = true },
}

local capabilities = lsp.protocol.make_client_capabilities()
capabilities = blink.get_lsp_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true
lsp.config("*", { capabilities = capabilities })

mason.setup()
local packs = vim.iter(registry.get_installed_packages())
lsp.enable(packs:fold({}, function(a, pack)
  table.insert(a, pack.spec.neovim and pack.spec.neovim.lspconfig)
  return a
end))
