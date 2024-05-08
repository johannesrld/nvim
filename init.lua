vim.loader.enable()
local bootstrapped, bootstrap_result = pcall(require, '_bootstrap')
if not bootstrapped then
  print("ERROR, failed to require lua/_bootstrap, unrecovereable")
  return
end
if not bootstrap_result.success then
  local missing_command_str = ''
  for _, cmd in ipairs(bootstrap_result.missing_commands) do missing_command_str = missing_command_str .. cmd .. '\n' end
  local err_msg = 'Failed to bootstrap neovim\n[\nYou have missing commands:' .. missing_command_str .. ']\nAborting Setup'
  print(err_msg)
  return
end
vim.g.mapleader = ' '
vim.g.maplocalleader = ';' -- thanks lazy assholes!!!
require('lazy').setup {spec={{import='tau.plugins'},{import='tau.plugins.language-plugins'},{import='tau.plugins.language-plugins.webdev'},},ui={icons={cmd='$ ',config='c',event='!',ft='ft:',init='in:',import='ip:',keys='ky',lazy='zz',loaded='+',not_loaded='-',plugin='∈ ',runtime='V ',source=':',start='>',task='||',list={'<>','->','*','‒',},},},}
pcall(require, 'tau.options')
local failed_to_load = ""
local cmp_loaded, _ = pcall(require, 'tau.cmp')
if not cmp_loaded then failed_to_load = failed_to_load .. "Failed to load nvim-cmp\n" end
local lsp_loaded, _ = pcall(require, 'tau.lsp')
if not lsp_loaded then failed_to_load = failed_to_load .. "Failed to load lsp config\n" end
local key_loaded, _ = pcall(require, 'tau.keymap')
if not key_loaded then failed_to_load = failed_to_load .. "Failed to load keybindings\n" end
if failed_to_load ~= "" then vim.notify(failed_to_load, vim.log.levels.ERROR) end
