return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "williamboman/mason.nvim",
        build = function() require("mason.api.command").MasonUpdate() end,
        event = "VeryLazy",
        lazy = true,
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
      },
    },
    event = "VeryLazy",
    lazy = true,
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
