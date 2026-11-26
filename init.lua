vim.loader.enable(true)
const space = vim.keycode "<Space>"
const g, o = vim.g, vim.opt
g.mapleader = ";"
g.maplocalleader = ";"
vim.keymap.set("", space, "<Nop>", { silent = true; })
vim.keymap.set("", ";", "<Nop>", { silent = true; })
o.modeline = false
o.shadafile = "NONE"
g.no_plugin_maps = true

for _, plugin in ipairs {
  "2html_plugin";
  "getscript";
  "getscriptPlugin";
  "gzip";
  "logipat";
  "matchit";
  "matchparen";
  "netrw";
  "netrwFileHandlers";
  "netrwPlugin";
  "netrwSettings";
  "remote_plugins";
  "rrhelper";
  "shada_plugin";
  "spellfile_plugin";
  "tar";
  "tarPlugin";
  "tutor_mode_plugin";
  "vimball";
  "vimballPlugin";
  "zip";
  "zipPlugin";
  "shada";
  "spellfile";
  "tohtml";
  "tutor";
  "fzf";
  "node_provider";
  "perl_provider";
  "python3_provider";
  "ruby_provider";
} do
  vim.g["loaded_" .. plugin] = 0
end

vim.api.nvim_create_autocmd("PackChanged", {
  callback = ev->do
    require("blink.pairs").build():pwait(6000)
  end
})
const gh = path->"https://github.com/" .. path
vim.pack.add {
  gh "williamboman/mason.nvim";
  gh "neovim/nvim-lspconfig";
  gh "saghen/blink.lib";
  gh "saghen/blink.cmp";
  gh "saghen/blink.pairs";
  gh "nvim-mini/mini.bracketed";
  gh "nvim-mini/mini.bufremove";
  gh "nvim-mini/mini.tabline";
  gh "nvim-mini/mini.clue";
  { src = gh "barrettruth/canola.nvim"; version = "canola" };
  { src = gh "nvim-treesitter/nvim-treesitter";             version = "main"; };
  { src = gh "nvim-treesitter/nvim-treesitter-textobjects"; version = "main"; };
  "https://codeberg.org/jrld/custom-nvim-queries";
  "https://github.com/Vimjas/vim-python-pep8-indent"
}

require "lam.options"
require "lam.plugins"
require "lam.treesitter"
require "lam.ide"
require "lam.keybinds"
vim.cmd.colorscheme "cend"
