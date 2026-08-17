vim.pack.add {
  gh "williamboman/mason.nvim";
  gh "neovim/nvim-lspconfig";
  { src = gh "saghen/blink.cmp"; version = "v1.10.2"; };
}
const blink = require "blink.cmp"
const mason, registry = require "mason", require "mason-registry"

blink.setup {
  keymap = {
    ["<CR>"] = { "accept"; "fallback"; };
    ["<c-CR>"] = { "cancel"; "fallback"; };
    ["<c-j>"] = { "select_next"; "fallback"; };
    ["<c-k>"] = { "select_prev"; "fallback"; };
  };
  signature = { enabled = true; };
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = blink.get_lsp_capabilities(capabilities)
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
vim.lsp.enable(packs:fold({}, function(a, pack)
  table.insert(a, pack.spec.neovim && pack.spec.neovim.lspconfig)
  return a
end))
