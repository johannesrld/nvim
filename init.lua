vim.loader.enable(true)

local space = vim.keycode "<Space>"
local g, o = vim.g, vim.opt

g.mapleader = space
g.maplocalleader = space
vim.keymap.set("", space, "<Nop>", { silent = true })

o.modeline = false
o.modelines = 0
o.shadafile = "NONE"
o.shada = ""
g.no_plugin_maps = true

require("vim._core.ui2").enable {
  msg = { targets = { default = "msg", progress = "cmd", list_cmd = "cmd" } },
}

for _, plugin in ipairs {
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
  "matchparen",
  "shada",
  "spellfile",
  "tohtml",
  "tutor",
  "fzf",
  "node_provider",
  "perl_provider",
  "python3_provider",
  "ruby_provider",
} do
  vim.g["loaded_" .. plugin] = 0
end

function _G.gh(path)
  return "https://github.com/" .. path
end

require "lam.options"
require "lam.plugins"
require "lam.treesitter"
require "lam.ide"
require "lam.keybinds"

vim.pack.add { gh "johannesrld/melange-nvim" }
vim.cmd.colorscheme "melange"
