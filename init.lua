vim.loader.enable()
local bootstrapped, bootstrap_result = pcall(require, '_bootstrap')
if not bootstrapped then
  print 'ERROR, failed to require lua/_bootstrap, unrecovereable'
  return
end
if not bootstrap_result.success then
  local missing_command_str = ''
  for _, cmd in ipairs(bootstrap_result.missing_commands) do
    missing_command_str = missing_command_str .. cmd .. '\n'
  end
  print(
    'Failed to bootstrap neovim\n[\nYou have missing commands:'
    .. missing_command_str
    .. ']\nAborting Setup'
  )
  return
end
local disabled_built_ins = {
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
  "matchit",
  "matchparen",
  "netrw",
  "netrwFileHandlers",
  "netrwPlugin",
  "netrwSettings",
  "remote_plugins",
  "rrhelper",
  "shada_plugin",
  "spellfile_plugin",
  "tar",
  "tarPlugin",
  "tutor_mode_plugin",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
  'gzip',
  'man',
  'matchit',
  'matchparen',
  'shada',
  'spellfile',
  'tarPlugin',
  'tohtml',
  'tutor',
  'zipPlugin',
}
for _, plugin in pairs(disabled_built_ins) do
  vim.g["loaded_" .. plugin] = 1
end

vim.opt.mouse = nil
vim.g.mapleader = ' '
vim.g.maplocalleader = ';' -- thanks lazy assholes!!!
require('lazy').setup {
  spec = {
    { import = 'p9.plugins' },
    { import = 'p9.plugins.language-plugins' },
    { import = 'p9.plugins.language-plugins.webdev' },
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
require 'p9.options'
require 'p9.lsp'
require 'p9.keymap'
