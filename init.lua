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

vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_netrw = 0
vim.g.loaded_netrwPlugin = 0
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
  performance = {
    rtp = {
      disabled_plugins = {
        'gzip',
        'matchit',
        'matchparen',
        'tarPlugin',
        'tohtml',
        'tutor',
        'zipPlugin',
      },
    },
  },
}
require 'p9.options'
require 'p9.lsp'
require 'p9.keymap'
