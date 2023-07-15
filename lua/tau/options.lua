local opt = vim.opt
local g = vim.g
local indentWidth = 4
opt.showtabline = 0

opt.number = true
opt.relativenumber = true
opt.wrap = false
opt.cursorline = true
if not vim.fn.has("wsl") then
  opt.clipboard = "unnamedplus" -- VERY slow using WSL
end
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.numberwidth = 4
opt.showmode = false

--Tab configuration
opt.autoindent = true
opt.smartindent = true
opt.preserveindent = true
opt.shiftwidth = indentWidth
opt.softtabstop = indentWidth
opt.tabstop = indentWidth

-- How to read/write to the file
opt.backup = false
opt.autowrite = true
opt.autoread = true
opt.hlsearch = true
opt.ignorecase = true

-- Vim Undofile, rather than swap files (Combine with Vim-Mundo!)
opt.swapfile = false
opt.undofile = true
opt.undodir = vim.fn.stdpath("data") .. "/undo"

--test
-- NetRW Tree
g.mundo_right = 1
g.netrw_banner = 0
g.netrw_liststyle = 3
g.netrw_winsize = 20
opt.conceallevel = 2
opt.fileencoding = "utf-8"
opt.hidden = true
