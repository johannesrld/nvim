vim.loader.enable()
require("tau.options")
-- TODO: check for libraries like luajit and libstdc++ etc etc.
if not vim.g.vscode then
  local required_commands = { "gcc", "g++", "make", "cargo", "npm", "rg", "node", "tar", "gzip", "unzip" }
  for _, cmd in ipairs(required_commands) do
    if vim.fn.executable(cmd) ~= 1 then
      print("ERROR: command \"" .. cmd .. "\" not found in path, aborting")
      return
    end
  end
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
  require("tau.masonry")
  require("tau.keymap")

  require("lspconfig").emmet_language_server.setup({
    capabilities = cmp_cap,
    init_options = {
      showExpandedAbbreviation = "always",
      showAbbreviationSuggestions = true,
      showSuggestionsAsSnippets = true,
    },
    on_attach = function(client, _)
      vim.print("Woah")
    end

  })
else
  vim.g.mapleader = ","
end
