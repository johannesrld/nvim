vim.pack.add({
  "https://github.com/nvim-mini/mini.bracketed",
  "https://github.com/nvim-mini/mini.surround",
  "https://github.com/nvim-mini/mini.bufremove",
  "https://github.com/yorickpeterse/nvim-jump",
  "https://github.com/nvim-mini/mini.tabline",
  "https://github.com/m4xshen/hardtime.nvim",
  "https://github.com/nvim-mini/mini.clue",
  "https://github.com/code-biscuits/nvim-biscuits",
  { src = "https://github.com/barrettruth/canola.nvim", version = "canola" },
})

local miniclue = require("mini.clue")
miniclue.setup({
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
    miniclue.gen_clues.square_brackets(),
    miniclue.gen_clues.builtin_completion(),
    miniclue.gen_clues.g(),
    miniclue.gen_clues.marks(),
    miniclue.gen_clues.registers(),
    miniclue.gen_clues.windows(),
    miniclue.gen_clues.z(),
  },
  window = { delay = 1 },
})

require("mini.tabline").setup({ use_icons = false })

vim.defer_fn(function()
  require("mini.bracketed").setup()
  require("mini.surround").setup()
  require("nvim-biscuits").setup({ default_config = { cursor_line_only = true, prefix_string = " 🦭 " } })
  require("hardtime").setup()
end, 0)

vim.g.canola = {
  columns = { "permissions" },
  hidden = { enabled = false },
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
    r = "actions.refresh",
  },
  win = { colorcolumn = "" },
}
