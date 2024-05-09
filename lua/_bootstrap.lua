local required_cmds = {'gcc','g++','make','cargo','npm','rg','node','tar','gzip','unzip','python3' }

local missing_cmds = {}
for _,c in ipairs(required_cmds) do if vim.fn.executable(c)~=1 then table.insert(missing_cmds, c) end end
if #missing_cmds~=0 then return { success = false, missing_commands = missing_cmds } end
local pth = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(pth) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    pth,
  }
end
vim.opt.rtp:prepend { pth }
return { success = true }
