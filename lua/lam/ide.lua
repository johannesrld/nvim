local lsp = vim.lsp
vim.pack.add {
  gh "williamboman/mason.nvim";
  gh "neovim/nvim-lspconfig";
  gh "saghen/blink.lib";
  gh "saghen/blink.cmp";
  gh "saghen/blink.pairs";
}

local pairs = require "blink.pairs"
local cmp = require "blink.cmp"
pairs.build():pwait(6000)
cmp.build():pwait(6000)
local mason, registry = require "mason", require "mason-registry"
vim.defer_fn(_->pairs.setup { highlights = { enabled = false } }, 0)

cmp.setup {
  keymap = {
    ["<CR>"] = { "accept"; "fallback"; };
    ["<c-CR>"] = { "cancel"; "fallback"; };
    ["<c-j>"] = { "select_next"; "fallback"; };
    ["<c-k>"] = { "select_prev"; "fallback"; };
  };
  signature = { enabled = true; };
}

local capabilities = cmp.get_lsp_capabilities(lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true
lsp.config("*", { capabilities = capabilities; })

mason.setup()
local packs = vim.iter(registry.get_installed_packages())
lsp.enable(packs:map(p->p?.spec?.neovim && p?.spec?.neovim?.lspconfig):totable())
