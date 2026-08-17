vim.pack.add {
  gh "nvim-mini/mini.bracketed";
  gh "nvim-mini/mini.surround";
  gh "nvim-mini/mini.bufremove";
  gh "nvim-mini/mini.tabline";
  gh "nvim-mini/mini.clue";
  { src = gh "barrettruth/canola.nvim"; version = "canola" }
}
vim.g.canola = {
  columns = {};
  hidden = { enabled = false; always = { ".stfolder"; ".git"; }; };
  delete = { recursive = true; };
  keymaps = {
    ["-"] = {
      callback = "actions.parent";
      mode = "n";
    };
    ["<C-c>"] = false;
    ["<C-h>"] = false;
    ["<C-l>"] = false;
    ["<C-p>"] = false;
    ["<C-s>"] = false;
    ["<C-t>"] = false;
    ["g?"] = false;
    ["g~"] = false;
    gy = false;
    P = {
      callback = "actions.preview";
      mode = "n";
      opts = {
        horizontal = true;
      };
    };
  };
  win = { colorcolumn = ""; };
}

const clue = require "mini.clue"
const clues = clue.gen_clues
clue.setup {
  triggers = {
    { mode = { "n"; "x"; }; keys = "<Leader>"; };
    { mode = "n";          keys = "["; };
    { mode = "n";          keys = "]"; };
    { mode = "i";          keys = "<C-x>"; };
    { mode = { "n"; "x"; }; keys = "g"; };
    { mode = { "n"; "x"; }; keys = "'"; };
    { mode = { "n"; "x"; }; keys = "`"; };
    { mode = { "n"; "x"; }; keys = '"'; };
    { mode = { "i"; "c"; }; keys = "<C-r>"; };
    { mode = "n";          keys = "<C-w>"; };
    { mode = "v";          keys = "a"; };
    { mode = "v";          keys = "i"; };
    { mode = { "n"; "x"; }; keys = "z"; };
  };
  clues = {
    clues.square_brackets();
    clues.builtin_completion();
    clues.g();
    clues.marks();
    clues.registers();
    clues.windows();
    clues.z();
  };
  window = { delay = 1; config = { width = 50; }; };
}

require "mini.tabline".setup { use_icons = false; }

vim.defer_fn(||->do
  require("mini.bracketed").setup()
  require("mini.surround").setup()
end, 0)
