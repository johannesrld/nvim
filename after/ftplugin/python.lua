vim.pack.add { "https://github.com/Vimjas/vim-python-pep8-indent" }
local ol, bo = vim.opt_local, vim.bo
ol.expandtab = true
ol.shiftwidth = 4
ol.tabstop = 4
ol.softtabstop = 4
bo.indentexpr = ""
