vim.pack.add({
  "https://github.com/williamboman/mason.nvim",
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/saghen/blink.cmp", version = "v1.10.2" },
})

require("blink.cmp").setup({
  keymap = {
    ["<CR>"] = { "accept", "fallback" },
    ["<c-CR>"] = { "cancel", "fallback" },
    ["<c-j>"] = { "select_next", "fallback" },
    ["<c-k>"] = { "select_prev", "fallback" },
  },
  signature = { enabled = true },
})

require("mason").setup()

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

vim.lsp.config("*", { capabilities = capabilities })

local installedPacks = require("mason-registry").get_installed_packages()
vim.lsp.enable(vim.iter(installedPacks):fold({}, function(acc, pack)
  table.insert(acc, pack.spec.neovim and pack.spec.neovim.lspconfig)
  return acc
end))
