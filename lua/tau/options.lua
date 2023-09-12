local opt = vim.opt
local g = vim.g
local indentWidth = 4
local stdpath = vim.fn.stdpath

-- If we are not using WSL/Windows then yanking (e.g. with "y") will yank to the system clipboard
if vim.fn.has("wsl") == 0 then
  vim.opt.clipboard = "unnamedplus" -- VERY slow using WSL
end

if vim.g.vscode then
  vim.cmd("set shada=\"NONE\"")
end
--[[
-----------------------
| GLOBAL CONFIGURATION |
-----------------------
]]
-- Misc
opt.spelllang = "en_gb"
opt.spell = true
vim.opt_local.spelloptions:append("noplainbuffer")

vim.opt.clipboard:append("unnamedplus")
-- UI
opt.spelllang = "en_gb"
opt.spell = true
vim.opt_local.spelloptions:append("noplainbuffer")
opt.showtabline = 0 -- Never display tabline
opt.number = true -- Show line numbers
opt.relativenumber = true -- Show line numbers relative to current cursor position
opt.wrap = false -- Don't wrap lines when they scroll off the screen
opt.scrolloff = 8 -- Min number of lines that are kept between the cursor and the bottom of the buffer when scrolling
opt.sidescrolloff = 8 -- Same as above but horizontally
opt.numberwidth = 3 -- Min number of lines for line number gutter
opt.showmode = false -- don't show the mode in the command area (e.g. "--INSERT--")
opt.conceallevel = 2 -- Hide concealed chars unless syn-cchar is set
opt.updatetime = 200 -- Faster completion
opt.colorcolumn = "88"

--Tab configuration
opt.autoindent = true -- Copy indent from the above line when starting a new line
opt.smartindent = true -- Usually for C-Line languages, e.g. indent automatically when "{" is encountered etc.
opt.preserveindent = true -- Preserves the properties of indentation when using something like ">>" & "<<"
opt.expandtab = true -- Expand tabs to spaces
opt.shiftwidth = indentWidth -- Num spaces for commands like "<<" ">>" etc.
opt.softtabstop = indentWidth -- Num of spaces that are used when perforing tab ops like inserting tabs
opt.tabstop = indentWidth -- Num of spaces that a tab in the file counts for

-- How to read/write to the file
opt.autowrite = true -- Write the contents of the file if it has ben modified when using certain commands
opt.ignorecase = true -- When searching the file (e.g. "/") ignore character case "Alfred" and "alfred" will both be highlighted by a search like "alfred"
opt.fileencoding = "utf-8" -- By default read the file as if it was in unicode utf8 encoding

-- Vim Undofile, rather than swap files (Combine with Vim-Mundo!)
opt.swapfile = false -- Dont use a swapfile
opt.undofile = true -- Use an undofile to store undos/saves across editing sessions
opt.undodir = stdpath("data") .. "/undo" -- store undofiles in vim's data directory (typically ~/.local/share/nvim)

-- NetRW Tree
g.mundo_right = 1
g.netrw_banner = 0
g.netrw_liststyle = 3
g.netrw_winsize = 20
