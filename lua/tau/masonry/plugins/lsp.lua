return {
  { "Vigemus/iron.nvim", },
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
            -- Other
            "ocaml-lsp",
            "ocamlformat",
            "haskell"
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
    "nvimtools/none-ls.nvim",
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "LspAttach",
    opts = {
      hint_prefix = "🦭 ",
      handler_opts = { border = "none" },
    }
  },
  { "lvimuser/lsp-inlayhints.nvim", event = "LspAttach" },
}
