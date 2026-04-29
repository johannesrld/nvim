vim.pack.add({
  "https://github.com/nvim-mini/mini.bracketed",
  "https://github.com/nvim-mini/mini.surround",
  "https://github.com/nvim-mini/mini.bufremove",
  "https://github.com/nvim-mini/mini.tabline",
  "https://github.com/nvim-mini/mini.clue",
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
end, 0)

vim.g.canola = {
  columns = { "permissions" },
  cursor = true,
  hidden = {
    enabled = false,
  },
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
    ["<CR>"] = "actions.select",
    P = {
      callback = "actions.preview",
      mode = "n",
      opts = {
        horizontal = true,
      },
    },
    _ = {
      callback = "actions.open_cwd",
      mode = "n",
    },
    ["`"] = {
      callback = "actions.cd",
      mode = "n",
    },
    ["g."] = {
      callback = "actions.toggle_hidden",
      mode = "n",
    },
    ["g?"] = false,
    gs = {
      callback = "actions.change_sort",
      mode = "n",
    },
    gx = "actions.open_external",
    gy = false,
    ["g~"] = false,
    q = {
      callback = "actions.close",
      mode = "n",
    },
    r = "actions.refresh",
  },
  watch = false,
  win = {
    colorcolumn = "",
    concealcursor = "nvic",
    conceallevel = 3,
    cursorcolumn = false,
    foldcolumn = "0",
    list = false,
    signcolumn = "no",
    spell = false,
    wrap = false,
  },
}
