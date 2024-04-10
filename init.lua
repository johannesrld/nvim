vim.loader.enable()
require 'tau.options'
local ok, bootstrap = pcall(require, 'tau.bootstrap')
if not ok then
  print [[
  Failed to bootstrap neovim
  [Failed at requiring lua/tau/bootstrap]
  Aborting Setup
  ]]
  return
end
if not bootstrap.success then
  local missing_command_str = ''
  for _, cmd in ipairs(bootstrap.missing_commands) do
    missing_command_str = missing_command_str .. cmd .. '\n'
  end
  local err_msg = 'Failed to bootstrap neovim\n[\nYou have missing commands:'
      .. missing_command_str
      .. ']\nAborting Setup'
  print(err_msg)
  return
end
require 'tau'
require 'tau.keymap'
require 'tau.treesitter'
