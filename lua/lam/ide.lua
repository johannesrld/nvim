const lsp = vim.lsp
const cmp = require "blink.cmp"
const mason, registry = require "mason", require "mason-registry"
vim.defer_fn(_->do
  require("blink.pairs").setup { highlights = { enabled = false; }; }
  cmp.setup {
    fuzzy = {
      implementation = "lua"
    };
    keymap = {
      ["<CR>"] = { "accept"; "fallback"; };
      ["<c-CR>"] = { "cancel"; "fallback"; };
      ["<c-j>"] = { "select_next"; "fallback"; };
      ["<c-k>"] = { "select_prev"; "fallback"; };
    };
    signature = { enabled = true; };
  }
end, 0)

lsp.config("*", {
  capabilities = cmp and cmp.get_lsp_capabilities(lsp.protocol.make_client_capabilities()) or lsp.protocol.make_client_capabilities();
})
vim.iter({"lua_ls"}):each(name->lsp.enable(name))
mason.setup()
const packs = vim.iter(registry.get_installed_packages())
lsp.enable(packs:map(p->p?.spec?.neovim && p?.spec?.neovim?.lspconfig):totable())
