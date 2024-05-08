vim.loader.enable()
pcall(require, 'tau.options')
local bootstrapped, bootstrap_result = pcall(require, '_bootstrap')
if not bootstrapped then
  print("ERROR, failed to require lua/_bootstrap, unrecovereable")
  return
end
if not bootstrap_result.success then
  local missing_command_str = ''
  for _, cmd in ipairs(bootstrap_result.missing_commands) do
    missing_command_str = missing_command_str .. cmd .. '\n'
  end
  local err_msg = 'Failed to bootstrap neovim\n[\nYou have missing commands:'
      .. missing_command_str
      .. ']\nAborting Setup'
  print(err_msg)
  return
end
require('lazy').setup {
  spec = {
    { import = 'tau.plugins' },
    { import = 'tau.plugins.language-plugins' },
    { import = 'tau.plugins.language-plugins.webdev' },
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
      list = {
        '<>',
        '->',
        '*',
        '‒',
      },
    },
  },
}

local cmp_loaded, _ = pcall(require, 'tau.cmp')
if not cmp_loaded then print("Failed to load nvim-cmp") end
local lsp_loaded, _ = pcall(require, 'tau.lsp')
if not lsp_loaded then print("Failed to load lsp configuration") end
local key_loaded, _ = pcall(require, 'tau.keymap')
if not key_loaded then print("Failed to load failed to load keybindings") end
