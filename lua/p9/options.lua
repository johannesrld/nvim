local indent_width = 4
local stdpath = vim.fn.stdpath
local colourcolum_option = '88'
vim.diagnostic.config { signs = false }
vim.g.mapleader = ' '
vim.g.maplocalleader = ';'
vim.opt.breakindent = true
vim.opt.termguicolors = true
vim.opt.laststatus = 3
vim.opt.showtabline = 0
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.numberwidth = 3
vim.opt.showmode = false
vim.opt.conceallevel = 2
vim.opt.updatetime = 300
vim.opt.colorcolumn = colourcolum_option
vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'popup' }
vim.opt.shortmess = vim.opt.shortmess + { c = true }
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.preserveindent = true
vim.opt.expandtab = true
vim.opt.shiftwidth = indent_width
vim.opt.softtabstop = indent_width
vim.opt.tabstop = indent_width
vim.opt.autowrite = true
vim.opt.ignorecase = true
vim.opt.fileencoding = 'utf-8'
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undodir = (stdpath 'data' .. '/undo')
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_winsize = 20
vim.opt.foldmethod = 'expr'
vim.opt.foldcolumn = '0'
vim.opt.foldtext = ''
vim.opt.foldlevel = 99
vim.opt.foldnestmax = 4
vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.opt.pumheight = 10
vim.opt.pumwidth = 10
local bufoption = vim.api.nvim_buf_get_option
local function _1_(_241)
  local buftype = bufoption(_241.buf, 'buftype')
  if
    not bufoption(_241.buf, 'modifiable')
    or ((buftype ~= '') and (buftype ~= 'acwrite'))
  then
    vim.g['colorcolumn'] = '0'
    return nil
  else
    vim.g['colorcolumn'] = colourcolum_option
    return nil
  end
end
return vim.api.nvim_create_autocmd(
  'BufEnter',
  vim.tbl_extend('force', {}, { callback = _1_ })
)
