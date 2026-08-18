vim.pack.add {
  gh "williamboman/mason.nvim";
  gh "neovim/nvim-lspconfig";
  gh "saghen/blink.lib";
  { src = gh "saghen/blink.cmp"; version = "v1.10.2"; };
  { src = gh "saghen/blink.pairs"; version = vim.version.range "*"; };
}
const pairs = require('blink.pairs')
pairs.download():pwait(6000)
const cmp = require "blink.cmp"
const mason, registry = require "mason", require "mason-registry"

vim.defer_fn(_->do
  pairs.setup {
    mappings = {
      pairs = {
        ['|'] = '|'
      }
    }
  }
end, 0)

cmp.setup {
  keymap = {
    ["<CR>"] = { "accept"; "fallback"; };
    ["<c-CR>"] = { "cancel"; "fallback"; };
    ["<c-j>"] = { "select_next"; "fallback"; };
    ["<c-k>"] = { "select_prev"; "fallback"; };
  };
  signature = { enabled = true; };
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp.get_lsp_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true
vim.lsp.config("*", { capabilities = capabilities; })
vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      ["Lua.runtime.enableLuaJITExtensions"] = true;
      runtime = {
        version = "luaJIT";
        nonstandardSymbol = {
          "//";
          "+="; "-="; "*="; "/="; "%="; "^="; "//=";
          "|="; "&="; "<<="; ">>=";
          "||"; "&&"; "!"; "!=";
          "continue";
          "?.";
          "?.(";
          "?.[";
          "??";
          "ternary";
          "~>>";
          "~>>=";
          "..=";
          "~=";
          "const";
          "->";
          "number_underscore";
          "?(";
          "?[";
        };
        ["enableLuaJITExtensions"] = true;
      };
    };
  };
})


mason.setup()
const packs = vim.iter(registry.get_installed_packages())
vim.lsp.enable(packs:map(p->p.spec.neovim && p.spec.neovim.lspconfig):totable())
