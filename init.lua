local autocmd = vim.api.nvim_create_user_command ---@type function
local map = vim.keymap.set ---@type function
local space = vim.keycode "<Space>"
local nop = vim.keycode "<Nop>"

vim.g.mapleader = space
vim.g.maplocalleader = space
map({ "n", "v" }, space, nop, { silent = true })

require("vim._core.ui2").enable({
    enabled = true,
    msg = { target = "msg" },
})

vim.loader.enable(true)
vim.opt.shadafile = "NONE"
vim.opt.shada = ""
vim.g.no_plugin_maps = true

for _, plugin in ipairs {
    "2html_plugin", "getscript",
    "getscriptPlugin", "gzip",
    "logipat", "matchit",
    "matchparen", "netrw",
    "netrwFileHandlers", "netrwPlugin",
    "netrwSettings", "remote_plugins",
    "rrhelper", "shada_plugin",
    "spellfile_plugin", "tar",
    "tarPlugin", "tutor_mode_plugin",
    "vimball", "vimballPlugin",
    "zip", "zipPlugin",
    "matchparen", "shada",
    "spellfile", "tohtml",
    "tutor", "fzf",
    "node_provider", "perl_provider",
    "python3_provider", "ruby_provider", } do
    vim.g["loaded_" .. plugin] = 0
end

require "lam.options"
require "lam.plugins"
require "lam.treesitter"
require "lam.ide"
require "lam.keybinds"

vim.pack.add { "https://github.com/johannesrld/melange-nvim" }
vim.cmd.colorscheme "melange"

autocmd("Update", function() vim.pack.update() end, { desc = "Update packages" })
