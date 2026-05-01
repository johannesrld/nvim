local indentwidth = 4
---@type function
local stdpath = vim.fn.stdpath
local colourcolumn = "88"
local o = vim.opt

-- General ================
o.shell = '/usr/bin/env sh'
o.modeline = false
o.modelines = 0
o.path = '**16'
o.report = 0
o.keymodel = 'startsel'
o.fixendofline = false
o.iminsert = 0
o.imsearch = 0
o.display = 'lastline,uhex'
o.eadirection = 'hor'
o.cdpath = ',,'
o.fileencoding = "UTF-8"
o.fileencodings = "UTF-8"
o.fileformats = "unix"
o.switchbuf = "usetab,uselast"
o.spelllang = "en_gb"
o.termguicolors = true
o.writebackup = false
o.backup = false
o.swapfile = false
o.undofile = true
o.undodir = stdpath("data") .. "/undo"
o.updatetime = 250
o.timeoutlen = 300
o.synmaxcol = 200
o.wildignore = {
    ".git",
    ".7z",
    ".exe",
    ".gif",
    ".jpeg",
    ".jpg",
    ".o",
    ".obj",
    ".out",
    ".pdf",
    ".png",
    ".pyc",
    ".pyo",
    ".rar",
    ".swp",
    ".tar",
    ".tar.bz2",
    ".tar.gz",
    ".tar.xz",
    ".tgz",
    ".tiff",
    ".zip",
    ".DS_Store",
    ".git",
    ".vscode",
    "=__pycache__",
}
o.suffixes:append({
    ".bak",
    ".old",
    ".min.js",
    ".min.css",
    "~"
})

-- UI =====================
o.laststatus = 3
o.cmdheight = 0
o.breakindent = true
o.colorcolumn = colourcolumn
o.list = true
o.listchars = {
  tab = "  ",
  extends = "·",
  precedes = "·",
  nbsp = "␣",
}
o.inccommand = "split"
o.number = true
o.relativenumber = true
o.numberwidth = 3
o.pumheight = 10
o.pumwidth = 10
o.ruler = false
o.shortmess:append({
  a = true,
  W = true,
  c = true,
  C = true,
  s = true,
  I = true,
})
o.showmode = false
o.signcolumn = "yes:2"
o.splitbelow = true
o.splitright = true
o.splitkeep = "screen"
o.winborder = "single"
o.wrap = false
o.showtabline = 0
o.conceallevel = 2
o.fillchars = {
  foldopen = " ",
    lastline= ".",
  foldclose = " ",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}
o.completeopt = {
  "menu",
  "menuone",
  "noinsert",
  "popup",
}

-- Editing ================
o.startofline = true
o.confirm = true
o.autoindent = true
o.expandtab = true
o.formatoptions = "qjl1"
o.ignorecase = true
o.infercase = true
o.gdefault = true
o.shiftwidth = indentwidth
o.softtabstop = indentwidth
o.tabstop = indentwidth
o.smartcase = true
o.smartindent = true
o.copyindent = true
o.virtualedit = "block"
o.autowrite = true
o.scrolloff = 2147483647
o.sidescrolloff = 8
o.scrolloffpad = 1
o.whichwrap = ""
o.iskeyword:append("-")
o.statusline = "[%{mode()}] %f %m%h %= %l:%c | %L | %p%%"
