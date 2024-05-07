local required_commands = {
  'gcc',
  'g++',
  'make',
  'cargo',
  'npm',
  'rg',
  'node',
  'tar',
  'gzip',
  'unzip',
  'python3'
}

local missing_commands = {}
for _, cmd in ipairs(required_commands) do
  if vim.fn.executable(cmd) ~= 1 then table.insert(missing_commands, cmd) end
end
if #missing_commands ~= 0 then
  return { success = false, missing_commands = missing_commands }
end
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  }
end
local hotpotpath = vim.fn.stdpath("data") .. "/lazy/hotpot.nvim"
if not vim.loop.fs_stat(hotpotpath) then
  vim.notify("Bootstrapping hotpot.nvim...", vim.log.levels.INFO)
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "--branch=v0.12.0",
    "https://github.com/rktjmp/hotpot.nvim.git",
    hotpotpath,
  })
end

vim.opt.rtp:prepend { hotpotpath, lazypath }
return { success = true }
