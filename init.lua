vim.loader.enable()
require("tau.options")
-- TODO: check for libraries like luajit and libstdc++ etc etc.
local required_commands = {"gcc", "g++", "make", "cargo", "npm", "ghcup", "rg"}
for _, cmd in ipairs(required_commands) do
  if vim.fn.executable(cmd) ~= 1 then
    print("ERROR: command" .. cmd .. " not found in path, aborting")
    return
  end
end
if not vim.g.vscode then
  vim.g.mapleader = " "
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable",
      lazypath,
    }
  end
  vim.opt.rtp:prepend(lazypath)
  require("tau.plugins")
  require("tau.term-conf")
  require("tau.keymap")
else
  vim.g.mapleader = ","
end
