vim.pack.add {
  "https://github.com/nvim-mini/mini.bracketed",
  "https://github.com/nvim-mini/mini.surround",
  "https://github.com/nvim-mini/mini.bufremove",
  "https://github.com/nvim-mini/mini.tabline",
  "https://github.com/nvim-mini/mini.clue",
  { src = "https://github.com/barrettruth/canola.nvim", version = "canola" },
}

vim.g.canola = {
  columns = { "permissions" },
  hidden = { enabled = false },
  delete = { recursive = true },
  keymaps = {
    ["-"] = {
      callback = "actions.parent",
      mode = "n",
    },
    ["<C-c>"] = false,
    ["<C-h>"] = false,
    ["<C-l>"] = false,
    ["<C-p>"] = false,
    ["<C-s>"] = false,
    ["<C-t>"] = false,
    ["g?"] = false,
    ["g~"] = false,
    gy = false,
    P = {
      callback = "actions.preview",
      mode = "n",
      opts = {
        horizontal = true,
      },
    },
  },
  win = { colorcolumn = "" },
}

local clue = require "mini.clue"
clue.setup {
  triggers = {
    { mode = { "n", "x" }, keys = "<Leader>" },
    { mode = "n", keys = "[" },
    { mode = "n", keys = "]" },
    { mode = "i", keys = "<C-x>" },
    { mode = { "n", "x" }, keys = "g" },
    { mode = { "n", "x" }, keys = "'" },
    { mode = { "n", "x" }, keys = "`" },
    { mode = { "n", "x" }, keys = '"' },
    { mode = { "i", "c" }, keys = "<C-r>" },
    { mode = "n", keys = "<C-w>" },
    { mode = "v", keys = "a" },
    { mode = "v", keys = "i" },
    { mode = { "n", "x" }, keys = "z" },
  },
  clues = {
    clue.gen_clues.square_brackets(),
    clue.gen_clues.builtin_completion(),
    clue.gen_clues.g(),
    clue.gen_clues.marks(),
    clue.gen_clues.registers(),
    clue.gen_clues.windows(),
    clue.gen_clues.z(),
  },
  window = { delay = 1, config = { width = 50 } },
}

require("mini.tabline").setup { use_icons = false }

vim.defer_fn(function()
  require("mini.bracketed").setup()
  require("mini.surround").setup()
end, 0)
