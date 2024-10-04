local keybinds = require("tau.keybinds.nastybits")
local wk = require("which-key")
local function telescope(module)
  local opts = {borderchars = {preview = {"\226\148\128", "\226\148\130", "\226\148\128", "\226\148\130", "\226\148\140", "\226\148\144", "\226\148\152", "\226\148\148"}}, layout_config = {height = 13}}
  local theme
  local function _1_()
    return require("telescope.themes").get_ivy(opts)
  end
  theme = _1_
  local function _2_()
    return require("telescope.builtin")[module](theme())
  end
  return _2_
end
keybinds({{noremap = true, silent = true}, ["<leader>v"] = {"Split Window [V]ertically", vim.cmd.vsplit}})
local function _3_()
  return require("trouble").toggle({mode = "diagnostics", focus = true})
end
local function _4_()
  return require("trouble").toggle({mode = "diagnostics", focus = false})
end
keybinds({{noremap = true, silent = true}, ["<leader>x"] = {"View Problems (Focus)", _3_}, ["<leader>X"] = {"View Problems", _4_}, ["<leader>b"] = {"Current [B]uffers", telescope("buffers")}, ["<leader>f"] = {"[F]ind Files", telescope("find_files")}, ["<leader>s"] = {"Live Grep ([S]earch)", telescope("live_grep")}})
local function _5_(_241)
  return keybinds({{buffer = _241.buf, noremap = true, silent = true}, K = {"Hover Info", vim.lsp.buf.hover}, gd = {"Goto symbol definition", telescope("lsp_definitions")}, gi = {"Goto implementation", telescope("lsp_implementation")}, ["<leader>lf"] = {"Format File", vim.lsp.buf.format}, ["<leader>la"] = {"Code Action", vim.lsp.buf.code_action}, ["<leader>lr"] = {"Rename Symbol", vim.lsp.buf.rename}, ["<leader>ls"] = {"View Buffer Symbols", telescope("lsp_document_symbols")}, gr = {"Goto References", telescope("lsp_references")}})
end
vim.api.nvim_create_autocmd("LspAttach", vim.tbl_extend("force", {}, {callback = _5_}))
return nil