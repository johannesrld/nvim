---@type function
vim.cmd("packadd nvim.undotree")
local nx, xo, nv, n = { "n", "x" }, { "x", "o" }, { "n", "v" }, "n"

local esc = vim.keycode("<Esc>")
local carriage_return = vim.keycode("<CR>")
local tab = vim.keycode("<Tab>")

local function map(mode, keybind, command, useropts)
  local opts = { noremap = true, silent = true }
  if type(useropts) == "string" then
    opts = vim.tbl_extend("force", opts, { desc = useropts })
  elseif type(useropts) == "table" then
    opts = vim.tbl_extend("force", opts, useropts)
  end
  return vim.keymap.set(mode, keybind, command, opts)
end
local function Leader(code) return "<leader>" .. code end
local function cmd(s) return "<Cmd>" .. s .. carriage_return end
local function scratch_buffer() vim.api.nvim_win_set_buf(0, vim.api.nvim_create_buf(true, true)) end
local function textobject(to) return function() require("nvim-treesitter-textobjects.select").select_textobject(to, "textobjects") end end

local function minibuf(func, one, two)
  return function()
    require("mini.bufremove").setup()
    MiniBufremove[func](one, two)
  end
end

map(n, Leader("v"),  vim.cmd.vsplit,              "Split Window [V]ertically")
map(n, Leader("h"),  vim.cmd.split,               "Split Window [H]orizontally")
map(n, Leader("o"),  cmd("Canola"),               "Open [O]il")
map(n, Leader("a"),  cmd("b#"),                   "[A]lternate Buffer")
map(n, Leader("u"),  cmd("Undotree"),             "[U]ndotree")
map(n, Leader("d"),  minibuf("delete"),           "[D]elete Buffer")
map(n, Leader("bD"), minibuf("delete", 0, true),  "Delete! Buffer")
map(n, Leader("bs"), scratch_buffer,              "Scratch Buffer")
map(n, Leader("bw"), minibuf("wipeout"),          "Wipeout Buffer")
map(n, Leader("bW"), minibuf("wipeout", 0, true), "Wipeout! Buffer")

map(n, tab, cmd("bnext"))

map(nx, "gy",    '"+y',    "Copy to System Keyboard")
map(nx, "gp",    '"+p',    "Copy to System Keyboard")
map(n,  "<C-H>", "<C-w>h", "Focus on left window")
map(n,  "<C-J>", "<C-w>j", "Focus on below window")
map(n,  "<C-K>", "<C-w>k", "Focus on above window")
map(n,  "<C-L>", "<C-w>l", "Focus on right window")

map(n,  "[p", cmd('exe "put! " . v:register'), "Paste Above")
map(n,  "]p", cmd('exe "put "  . v:register'), "Paste Below")
map(n,  "yc", "yy<cmd>normal gcc<CR>p",        "Go to start of line")
map(n,  esc,  "<Cmd>nohlsearch<CR>",           "Go to start of line")
map(nv, "gh", "_",                             "Go to start of line")
map(nv, "gl", "$",                             "Go to start of line")

map(xo, "a=", textobject("@assignment.outer"))
map(xo, "i=", textobject("@assignment.inner"))
map(xo, "[=", textobject("@assignment.lhs"))
map(xo, "]=", textobject("@assignment.rhs"))
map(xo, "am", textobject("@function.outer"))
map(xo, "im", textobject("@function.inner"))
map(xo, "aC", textobject("@call.outer"))
map(xo, "iC", textobject("@call.inner"))
map(xo, "ac", textobject("@class.outer"))
map(xo, "ic", textobject("@class.inner"))
map(xo, "aa", textobject("@parameter.outer"))
map(xo, "ia", textobject("@parameter.inner"))
map(xo, "at", textobject("@type"))

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(c)
    map(n,  Leader("lf"), vim.lsp.buf.format,          { buffer = c.buf, desc = "Format File" })
    map(n,  Leader("lr"), vim.lsp.buf.rename,          { buffer = c.buf, desc = "Rename Symbol" })
    map(nx, Leader("la"), vim.lsp.buf.code_action,     { buffer = c.buf, desc = "View Code Action" })
    map(n,  Leader("lR"), vim.lsp.buf.references,      { buffer = c.buf, desc = "View Symbol References" })
    map(n,  Leader("li"), vim.lsp.buf.implementation,  { buffer = c.buf, desc = "View Implementations" })
    map(n,  Leader("ls"), vim.lsp.buf.definition,      { buffer = c.buf, desc = "View Definition" })
    map(n,  Leader("lt"), vim.lsp.buf.type_definition, { buffer = c.buf, desc = "View Type Definition" })
  end,
})
