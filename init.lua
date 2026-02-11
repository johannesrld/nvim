require('vim._core.ui2').enable({})
--
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
  'matchparen',
  'shada',
  'spellfile',
  'tarPlugin',
  'tohtml',
  'tutor',
  'fzf',
  'node_provider',
  'perl_provider',
  'python3_provider',
  'ruby_provider',
}

for _, plugin in ipairs(disabled_built_ins) do
  vim.g['loaded_' .. plugin] = 0
end

vim.o.mouse = ''
local space = vim.keycode('<Space>')
local nop = vim.keycode('<Nop>')
vim.g.mapleader = space
vim.g.maplocalleader = space
vim.keymap.set({ 'n', 'v' }, space, nop, { silent = true })

require('__globals')
require('lam.options')
require('lam.plugins')
require('lam.treesitter')
require('lam.ide')
require('lam.keybinds')

vim.api.nvim_create_user_command(
  'Update',
  function() vim.pack.update() end,
  { desc = 'Update packages' }
)

vim.pack.add({ 'https://github.com/johannesrld/cold.nvim' })
vim.cmd.colorscheme('cold')
