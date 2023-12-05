local cmp = require("cmp")
local luasnips = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()
local cmp_border = vim.tbl_deep_extend(
  "force",
  cmp.config.window.bordered(),
  {
    border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
    scrollbar = false,
  }
)
cmp.setup {
  window = {
    completion = cmp_border,
    documentation = cmp_border,
  },
  view = {
    entries = { name = "custom", selection_order = "near_cursor" },
  },
  snippet = {
    expand = function(args) luasnips.lsp_expand(args.body) end,
  },
  mapping = cmp.mapping.preset.insert {
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm { select = true },
  },
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "function" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "html-css" },
    { name = "conjure" }
  }, {
    { name = "buffer" },
  }),
  sorting = {
    comparators = {
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.score,

      function(entry1, entry2)
        local _, entry1_under = entry1.completion_item.label:find("^_+")
        local _, entry2_under = entry2.completion_item.label:find("^_+")
        entry1_under = entry1_under or 0
        entry2_under = entry2_under or 0
        if entry1_under > entry2_under then
          return false
        elseif entry1_under < entry2_under then
          return true
        end
      end,
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },
  experimental = {
    ghost_test = true,
  },
}
vim.api.nvim_create_autocmd("InsertEnter", {
  group = vim.api.nvim_create_augroup("Autopair_cmp", {}),
  callback = function(_)
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
  end,
  once = true
})
cmp.setup.filetype("gitcommit", {
  sources = cmp.config.sources({
    { name = "git" },
  }, {
    { name = "buffer" },
  }),
})

cmp.setup.cmdline({ "/", "?" }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" },
  },
})

cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    { name = "cmdline" },
  }),
})
local lsp_border = {
  { "┌", "FloatBorder" },
  { "─", "FloatBorder" },
  { "┐", "FloatBorder" },
  { "│", "FloatBorder" },
  { "┘", "FloatBorder" },
  { "─", "FloatBorder" },
  { "└", "FloatBorder" },
  { "│", "FloatBorder" },
}
local cmp_capabilities = require("cmp_nvim_lsp").default_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)
cmp_capabilities.textDocument.completion.completionItem.snippetSupport = true
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or lsp_border
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

local blacklisted_servers = {
  ["hls"] = true,
  ["tsserver"] = true,
  ["rust_analyzer"] = true
}
require("mason-lspconfig").setup_handlers {
  function(server_name)
    if blacklisted_servers[server_name] then return end
    if server_name == "emmet_language_server" then
      require("lspconfig").emmet_language_server.setup {
        capabilities = cmp_cap,
        init_options = {
          showExpandedAbbreviation = "always",
          showAbbreviationSuggestions = true,
          showSuggestionsAsSnippets = true,
        },
      }
    end
    if server_name == "lua_ls" then
      require("lspconfig")[server_name].setup {
        capabilities = cmp_capabilities,
        on_init = function(client)
          client.config.settings =
              vim.tbl_deep_extend("force", client.config.settings, {
                Lua = {
                  runtime = {
                    version = "LuaJIT",
                  },
                  workspace = {
                    checkThirdParty = false,
                    library = {
                      vim.env.VIMRUNTIME,
                    },
                  },
                },
              })

          client.notify(
            "workspace/didChangeConfiguration",
            { settings = client.config.settings }
          )
          return true
        end,
      }
    else
      require("lspconfig")[server_name].setup {
        capabilities = cmp_capabilities,
      }
    end
  end,
}
vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
vim.api.nvim_create_autocmd("LspAttach", {
  group = "LspAttach_inlayhints",
  callback = function(args)
    if not (args.data and args.data.client_id) then return end

    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    require("lsp-inlayhints").on_attach(client, bufnr)
  end,
  once = true
})
