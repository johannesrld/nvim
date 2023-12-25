local opt = vim.opt
local indentWidth = 2
opt.shiftwidth = indentWidth -- Num spaces for commands like "<<" ">>" etc.
opt.softtabstop = indentWidth -- Num of spaces that are used when performing tab ops like inserting tabs
opt.tabstop = indentWidth -- Num of spaces that a tab in the file counts for
require("ocaml").setup()
