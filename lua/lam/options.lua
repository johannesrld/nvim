const stdpath = vim.fn.stdpath --- @type function
const o = vim.opt

-- General ================
o.mouse = ""
o.shell = "/usr/bin/env sh"
o.path = ".,**16"
o.report = 0
o.keymodel = "startsel"
o.fixendofline = false
o.imsearch = 0
o.display = "lastline,uhex"
o.eadirection = "hor"
o.fileencodings = "UTF-8"
o.fileformats = "unix"
o.switchbuf = "usetab,uselast"
o.spelllang = "en_gb"
o.writebackup = false
o.swapfile = false
o.undofile = true
o.undodir = stdpath "data" .. "/undo//"
o.updatetime = 250
o.timeoutlen = 300
o.synmaxcol = 200
o.wildignore = {
  "*.7z";
  "*.exe";
  "*.gif";
  "*.jpeg";
  "*.jpg";
  "*.o";
  "*.obj";
  "*.out";
  "*.pdf";
  "*.png";
  "*.pyc";
  "*.pyo";
  "*.rar";
  "*.swp";
  "*.tar";
  "*.tar.bz2";
  "*.tar.gz";
  "*.tar.xz";
  "*.tgz";
  "*.tiff";
  "*.zip";
  "*.DS_Store";
  ".git";
  ".vscode";
  "__pycache__";
}
o.suffixes:append { ".bak"; ".old"; ".min.js"; ".min.css"; "~"; }

-- UI =====================
-- o.laststatus = 3
o.breakindent = true
o.colorcolumn = "88"
o.list = true
o.listchars = { eol = "~"; tab = "  "; extends = "·"; precedes = "·"; nbsp = "␣"; }
o.inccommand = "split"
o.number = true
o.relativenumber = true
o.pumheight = 10
o.pumwidth = 10
o.shortmess:append { a = true; W = true; c = true; C = true; s = true; I = true; }
o.showmode = false
o.signcolumn = "no"
o.splitbelow = true
o.splitright = true
o.splitkeep = "screen"
o.winborder = "single"
o.wrap = false
o.conceallevel = 2
o.fillchars = {
  lastline = ".";
  diff = "╱";
  eob = " ";
}
o.completeopt = { "menu"; "menuone"; "noinsert"; "popup"; }

-- Editing ================
o.grepprg = "rg --vimgrep -uu --smart-case"
o.startofline = true
o.confirm = true
o.expandtab = true
o.ignorecase = true
o.infercase = true
o.gdefault = true
o.tabstop = 4
o.shiftwidth = 0
o.softtabstop = -1
o.smartcase = true
o.smartindent = true
o.copyindent = true
o.virtualedit = "block"
o.autowrite = true
o.scrolloff = 2147483647
o.sidescrolloff = 8
o.scrolloffpad = 3
o.whichwrap = ""
o.iskeyword:append "-"
o.statusline = "[%{mode()}] %f %m%h %= %l:%c | %L | %p%%"
-- o.cmdheight = 0
vim.api.nvim_create_autocmd("FileType", {
  callback = ||->do vim.opt_local.formatoptions = "qjl1" end
})
