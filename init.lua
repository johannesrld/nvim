vim.loader.enable(true)
vim.opt.shadafile = 'NONE'
vim.opt.shada = ''
vim.g.no_plugin_maps = true
local disabled_built_ins = {
  '2html_plugin',
  'getscript',
  'getscriptPlugin',
  'gzip',
  'logipat',
  'matchit',
  'matchparen',
  'netrw',
  'netrwFileHandlers',
  'netrwPlugin',
  'netrwSettings',
  'remote_plugins',
  'rrhelper',
  'shada_plugin',
  'spellfile_plugin',
  'tar',
  'tarPlugin',
  'tutor_mode_plugin',
  'vimball',
  'vimballPlugin',
  'zip',
  'zipPlugin',
  'gzip',
  'matchit',
  'matchparen',
  'shada',
  'spellfile',
  'tarPlugin',
  'tohtml',
  'tutor',
  'fzf',
  'zipPlugin',
  'node_provider',
  'perl_provider',
  'python3_provider',
  'ruby_provider',
}

for _, plugin in pairs(disabled_built_ins) do
  vim.g['loaded_' .. plugin] = 0
end

vim.o.mouse = ''
local space = vim.keycode('<Space>')
local nop = vim.keycode('<Nop>')
vim.g.mapleader = space
vim.g.maplocalleader = space
vim.keymap.set({ 'n', 'v' }, space, nop)

require('__globals')
require('lam.000options')
require('lam.001misc_plugins')
require('lam.002treesitter')
require('lam.003ide_features')
require('lam.004keybinds')
require('lam.language_plugins')

vim.api.nvim_create_user_command(
  'Update',
  'lua =vim.pack.update()',
  { desc = 'update packages' }
)

vim.pack.add({ 'https://github.com/johannesrld/cold.nvim' })
vim.cmd.colorscheme('cold')
