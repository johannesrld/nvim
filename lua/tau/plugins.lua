return require("lazy").setup("tau.masonry.plugins", {
  performance = {
    cache = {
      enabled = true,
    },
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
  ui = {
    icons = {
      cmd = "$ ",
      config = "c",
      event = "!",
      ft = "ft:",
      init = "in:",
      import = "ip:",
      keys = "ky",
      lazy = "zz",
      loaded = "●",
      not_loaded = "○",
      plugin = "∈ ",
      runtime = "V ",
      source = "◉",
      start = "▶",
      task = "✓ ",
      list = {
        "●",
        "➜",
        "★",
        "‒",
      },
    },
  },
})
