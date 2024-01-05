local indentWidth = 4
local stdpath = vim.fn.stdpath

-- Misc
vim.opt.spelllang = 'en_gb'
vim.opt.spell = not vim.g.vscode and true or false
vim.opt_local.spelloptions:append 'noplainbuffer'
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

vim.o.breakindent = true


vim.opt.clipboard:append 'unnamedplus'
-- UI
vim.opt.spelllang = 'en_gb'
vim.opt.spell = true
vim.opt_local.spelloptions:append 'noplainbuffer'
vim.opt.showtabline = 0       -- Never display tabline
vim.opt.number = true         -- Show line numbers
vim.opt.relativenumber = true -- Show line numbers relative to current cursor position
vim.opt.wrap = false          -- Don't wrap lines when they scroll off the screen
vim.opt.scrolloff = 8         -- Min number of lines that are kept between the cursor and the bottom of the buffer when scrolling
vim.opt.sidescrolloff = 8     -- Same as above but horizontally
vim.opt.numberwidth = 3       -- Min number of lines for line number gutter
vim.opt.showmode = false      -- don't show the mode in the command area (e.g. "--INSERT--")
vim.opt.conceallevel = 2      -- Hide concealed chars unless syn-cchar is set
vim.opt.updatetime = 300      -- Faster completion
vim.opt.colorcolumn = '88'
vim.opt.completeopt = { 'menuone', 'noselect', 'noinsert' }
vim.opt.shortmess = vim.opt.shortmess + { c = true }

--Tab configuration
vim.opt.autoindent = true         -- Copy indent from the above line when starting a new line
vim.opt.smartindent = true        -- Usually for C-Line languages, e.g. indent automatically when "{" is encountered etc.
vim.opt.preserveindent = true     -- Preserves the properties of indentation when using something like ">>" & "<<"
vim.opt.expandtab = true          -- Expand tabs to spaces
vim.opt.shiftwidth = indentWidth  -- Num spaces for commands like "<<" ">>" etc.
vim.opt.softtabstop = indentWidth -- Num of spaces that are used when perforing tab ops like inserting tabs
vim.opt.tabstop = indentWidth     -- Num of spaces that a tab in the file counts for

-- How to read/write to the file
vim.opt.autowrite = true       -- Write the contents of the file if it has ben modified when using certain commands
vim.opt.ignorecase = true      -- When searching the file (e.g. "/") ignore character case "Alfred" and "alfred" will both be highlighted by a search like "alfred"
vim.opt.fileencoding = 'utf-8' -- By default read the file as if it was in unicode utf8 encoding

-- Vim Undofile, rather than swap files (Combine with Vim-Mundo!)
vim.opt.swapfile = false                    -- Dont use a swapfile
vim.opt.undofile = true                     -- Use an undofile to store undos/saves across editing sessions
vim.opt.undodir = stdpath 'data' .. '/undo' -- store undofiles in vim's data directory (typically ~/.local/share/nvim)

-- NetRW Tree
vim.g.mundo_right = 1
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_winsize = 20
