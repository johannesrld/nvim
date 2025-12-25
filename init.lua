vim.opt.shada = "'100,<50,s10,:1000,/100,@100,h"
vim.loader.enable(true)
local bootstrapped = pcall(require, '__bootstrap')
if not bootstrapped then
  print('ERROR, failed to require lua/__bootstrap, unrecovereable')
  return
end

vim.o.mouse = ''
local space = vim.keycode('<Space>')
local nop = vim.keycode('<Nop>')
vim.g.mapleader = space
vim.g.maplocalleader = space
vim.keymap.set({ 'n', 'v' }, space, nop)

require('__globals')
require('lam.options')

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
  -- 'man',
  'matchit',
  'matchparen',
  'shada',
  'spellfile',
  'tarPlugin',
  'tohtml',
  'tutor',
  'zipPlugin',
  'node_provider',
  'perl_provider',
  'python3_provider',
  'ruby_provider',
}

for _, plugin in pairs(disabled_built_ins) do
  vim.g['loaded_' .. plugin] = 0
end

require('lazy').setup {
  spec = {
    { import = 'lam.plugins' },
    { import = 'lam.plugins.language-plugins' },
  },
  ui = {
    icons = {
      cmd = '$ ',
      config = 'c',
      event = '!',
      ft = 'ft:',
      init = 'in:',
      import = 'ip:',
      keys = 'ky',
      lazy = 'zz',
      loaded = '+',
      not_loaded = '-',
      plugin = '∈ ',
      runtime = 'V ',
      source = ':',
      start = '>',
      task = '||',
      list = { '<>', '->', '*', '‒' },
    },
  },
}

require('lam.lsp')
require('lam.keymap')
