require("mason-tool-installer").setup {
  ensure_installed = {
    "dprint",
    -- shell
    "shellcheck",
    "shellharden",
    "shfmt",
    "bash-language-server",

    --lua
    "lua-language-server",
    "stylua",

    --python
    "pyright", -- TODO: replace with pylyzer once it is mature enough
    "mypy",
    "debugpy",
    "ruff-lsp",
    "black",

    --rust
    "rust-analyzer",
    "codelldb",
    --webdev
    --  css
    "css-lsp",
    "stylelint", -- Stylelint lsp server?
    "html-lsp",
    "emmet-language-server",
    "eslint-lsp",
    "json-lsp",
  },

  auto_update = false,
  run_on_start = true,
  start_delay = 3000,
  debounce_hours = 5,
}
require("mason").setup {
  ui = {
    icons = {
      package_installed = "●",
      package_pending = "◔",
      package_uninstalled = "◯",
    },
  },
}
require("mason-lspconfig").setup()

local cmp = require("cmp")
local luasnips = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup {
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
local cmp_capabilities = require("cmp_nvim_lsp").default_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)
cmp_capabilities.textDocument.completion.completionItem.snippetSupport = true
require("mason-lspconfig").setup_handlers {
  function(server_name)
    if server_name == "html" or server_name == "emmet_ls" then return end
    if server_name == "lua_ls" then
      require("lspconfig")[server_name].setup {
        capabilities = cmp_capabilities,
        on_init = function(client)
          local path = client.workspace_folders[1].name
          if
            not vim.loop.fs_stat(path .. "/.luarc.json")
            and not vim.loop.fs_stat(path .. "/.luarc.jsonc")
          then
            client.config.settings =
              vim.tbl_deep_extend("force", client.config.settings, {
                Lua = {
                  runtime = {
                    -- Tell the language server which version of Lua you're using
                    -- (most likely LuaJIT in the case of Neovim)
                    version = "LuaJIT",
                  },
                  -- Make the server aware of Neovim runtime files
                  workspace = {
                    checkThirdParty = false,
                    library = {
                      vim.env.VIMRUNTIME,
                      -- "${3rd}/luv/library"
                      -- "${3rd}/busted/library",
                    },
                    -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
                    -- library = vim.api.nvim_get_runtime_file("", true)
                  },
                },
              })

            client.notify(
              "workspace/didChangeConfiguration",
              { settings = client.config.settings }
            )
          end
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
})
