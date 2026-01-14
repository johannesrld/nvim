local indentwidth  = 4
---@type function
local stdpath      = vim.fn.stdpath
local colourcolumn = '88'
local o          = vim.opt

-- General ================
o.fileencoding   = 'UTF-8'
o.fileformats    = 'unix'
o.switchbuf      = 'usetab'
o.spelllang      = 'en_gb'
o.termguicolors  = true
o.writebackup    = false
o.backup         = false
o.swapfile       = false
o.undofile       = true
o.undodir        = stdpath('data') .. '/undo'
o.updatetime     = 300
o.synmaxcol      = 200
o.wildignore     = { '.git' }

-- UI =====================
o.laststatus     = 3
o.cmdheight      = 0
o.breakindent    = true
o.colorcolumn    = colourcolumn
o.list           = true
o.listchars      = {
  tab = '  ',
  extends = '·',
  precedes = '·',
  nbsp = '␣',
}
o.number         = true
o.relativenumber = true
o.numberwidth    = 3
o.pumheight      = 10
o.pumwidth       = 10
o.ruler          = false
o.shortmess:append {
  a = true,
  W = true,
  c = true,
  C = true,
  s = true,
  I = true,
}
o.showmode       = false
o.signcolumn     = 'yes:2'
o.splitbelow     = true
o.splitright     = true
o.splitkeep      = 'screen'
o.winborder      = 'single'
o.wrap           = false
o.showtabline    = 0
o.conceallevel   = 2
o.fillchars      = {
  foldopen = ' ',
  foldclose = ' ',
  fold = ' ',
  foldsep = ' ',
  diff = '╱',
  eob = ' ',
}
o.completeopt    = {
  'menu',
  'menuone',
  'noinsert',
  'popup',
}

-- Editing ================
o.autoindent     = true
o.expandtab      = true
o.formatoptions  = 'qjl1'
o.ignorecase     = true
o.infercase      = true
o.gdefault       = true
o.shiftwidth     = indentwidth
o.softtabstop    = indentwidth
o.tabstop        = indentwidth
o.smartcase      = true
o.smartindent    = true
o.preserveindent = true
o.virtualedit    = 'block'
o.whichwrap      = ''
o.autowrite      = true
o.scrolloff      = 2147483647
o.sidescrolloff  = 8
o.whichwrap      = ''
o.completeopt    = {
  'menu',
  'menuone',
  'noinsert',
  'popup',
}
o.iskeyword:append('-')
