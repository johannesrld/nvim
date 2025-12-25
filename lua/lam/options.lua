local indentwidth  = 4
---@type function
local stdpath      = vim.fn.stdpath
local colourcolumn = '88'
local opt          = vim.opt

-- General ================
opt.fileencoding   = 'UTF-8'
opt.switchbuf      = 'usetab'
opt.spelllang      = 'en_gb'
opt.termguicolors  = true
opt.writebackup    = false
opt.backup         = false
opt.swapfile       = false
opt.undofile       = true
opt.undodir        = stdpath('data') .. '/undo'
opt.updatetime     = 300
opt.synmaxcol      = 200
opt.wildignore     = { '.git' }

-- UI =====================
opt.title = true
opt.titlestring = "Neovim"
opt.laststatus     = 3
opt.cmdheight      = 0
opt.breakindent    = true
opt.colorcolumn    = colourcolumn
opt.list           = true
opt.listchars      = {
  tab = '  ',
  extends = '·',
  precedes = '·',
  nbsp = '␣',
}
opt.number         = true
opt.relativenumber = true
opt.numberwidth    = 3
opt.pumheight      = 10
opt.pumwidth       = 10
opt.ruler          = false
opt.shortmess:append {
  a = true,
  W = true,
  c = true,
  C = true,
  s = true,
  I = true,
}
opt.showmode       = false
opt.signcolumn     = 'yes:2'
opt.splitbelow     = true
opt.splitright     = true
opt.splitkeep      = 'screen'
opt.winborder      = 'single'
opt.wrap           = false
opt.showtabline    = 0
opt.conceallevel   = 2
opt.fillchars      = {
  foldopen = ' ',
  foldclose = ' ',
  fold = ' ',
  foldsep = ' ',
  diff = '╱',
  eob = ' ',
}
opt.completeopt    = {
  'menu',
  'menuone',
  'noinsert',
  'popup',
}

-- Editing ================
opt.autoindent     = true
opt.expandtab      = true
opt.formatoptions  = 'qjl1'
opt.ignorecase     = true
opt.infercase      = true
opt.gdefault       = true
opt.shiftwidth     = indentwidth
opt.softtabstop    = indentwidth
opt.tabstop        = indentwidth
opt.smartcase      = true
opt.smartindent    = true
opt.preserveindent = true
opt.virtualedit    = 'block'
opt.whichwrap      = ''
opt.autowrite      = true
opt.scrolloff      = 8
opt.sidescrolloff  = 8
opt.whichwrap      = ''
opt.completeopt    = {
  'menu',
  'menuone',
  'noinsert',
  'popup',
}
opt.iskeyword:append('-,?,!')

