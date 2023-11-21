return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "williamboman/mason.nvim",
        build = function() require("mason.api.command").MasonUpdate() end,
        event = "VeryLazy",
        lazy = true,
        opts = {
          ui = {
            icons = {
              package_installed = "+",
              package_pending = "#",
              package_uninstalled = "-",
            },
          },
        },
      },
      {
        "williamboman/mason-lspconfig.nvim",
        event = "VeryLazy",
        lazy = true,
      },
      {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        event = "VeryLazy",
        lazy = true,
        opts = {
          ensure_installed = {
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

            --webdev
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
        },
      },
    },
    event = "VeryLazy",
    lazy = true,
  },
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        -- Customize or remove this keymap to your liking
        "<leader>ff",
        function()
          require("conform").format({ async = true, lsp_fallback = true })
        end,
        mode = "",
        desc = "Format buffer",
      },
    },
    -- Everything in opts will be passed to setup()
    opts = {
      -- Define your formatters
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "black" },
        javascript = { { "prettierd", "prettier" } },
        css = {"prettierd"}
      },
      -- Set up format-on-save
      format_on_save = { timeout_ms = 500, lsp_fallback = true },
      -- Customize formatters
      formatters = {
        shfmt = {
          prepend_args = { "-i", "2" },
        },
      },
    },
    init = function()
      -- If you want the formatexpr, here is the place to set it
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "LspAttach",
    config = function()
      require("lsp_signature").setup {
        hint_prefix = "🦭 ",
        handler_opts = { border = "none" },
      }
    end,
  },
  { "lvimuser/lsp-inlayhints.nvim", event = "LspAttach" },
}
