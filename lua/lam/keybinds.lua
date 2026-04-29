---@type function
vim.cmd("packadd nvim.undotree")
local nx, xo, nv, n = { "n", "x" }, { "x", "o" }, { "n", "v" }, "n"

local esc = vim.keycode("<Esc>")
local carriage_return = vim.keycode("<CR>")
local tab = vim.keycode("<Tab>")
local set = vim.keymap.set ---@type function

local function Leader(code)
  return "<leader>" .. code
end
local function cmd(s)
  return "<Cmd>" .. s .. carriage_return
end
local function scratch_buffer()
  vim.api.nvim_win_set_buf(0, vim.api.nvim_create_buf(true, true))
end
local function opts(options)
  return vim.tbl_extend("force", { noremap = true, silent = true }, options)
end

local function select_textobject(to)
  return function()
    require("nvim-treesitter-textobjects.select").select_textobject(to, "textobjects")
  end
end

local function minibuf(func, one, two)
  return function()
    require("mini.bufremove").setup()
    MiniBufremove[func](one, two)
  end
end

set(n, Leader("v"), vim.cmd.vsplit, opts({ desc = "Split Window [V]ertically" }))
set(n, Leader("h"), vim.cmd.split, opts({ desc = "Split Window [H]orizontally" }))
set(n, Leader("o"), cmd("Canola"), opts({ desc = "Open [O]il" }))
set(n, Leader("a"), cmd("b#"), opts({ desc = "[A]lternate Buffer" }))
set(n, Leader("u"), cmd("Undotree"), opts({ desc = "[U]ndotree" }))
set(n, Leader("d"), minibuf("delete"), opts({ desc = "[D]elete Buffer" }))
set(n, Leader("bD"), minibuf("delete", 0, true), opts({ desc = "Delete! Buffer" }))
set(n, Leader("bs"), scratch_buffer, opts({ desc = "Scratch Buffer" }))
set(n, Leader("bw"), minibuf("wipeout"), opts({ desc = "Wipeout Buffer" }))
set(n, Leader("bW"), minibuf("wipeout", 0, true), opts({ desc = "Wipeout! Buffer" }))

set(n, tab, cmd("bnext"))

set(nx, "gy", '"+y', opts({ desc = "Copy to System Keyboard" }))
set(nx, "gp", '"+p', opts({ desc = "Copy to System Keyboard" }))
set(n, "<C-H>", "<C-w>h", opts({ desc = "Focus on left window" }))
set(n, "<C-J>", "<C-w>j", opts({ desc = "Focus on below window" }))
set(n, "<C-K>", "<C-w>k", opts({ desc = "Focus on above window" }))
set(n, "<C-L>", "<C-w>l", opts({ desc = "Focus on right window" }))

set(n, "[p", cmd('exe "put! " . v:register'), opts({ desc = "Paste Above" }))
set(n, "]p", cmd('exe "put "  . v:register'), opts({ desc = "Paste Below" }))
set(n, "yc", "yy<cmd>normal gcc<CR>p", opts({ desc = "Go to start of line" }))
set(n, esc, "<Cmd>nohlsearch<CR>", opts({ desc = "Go to start of line" }))
set(nv, "gh", "_", opts({ desc = "Go to start of line" }))
set(nv, "gl", "$", opts({ desc = "Go to start of line" }))

set(xo, "am", select_textobject("@function.outer"))
set(xo, "im", select_textobject("@function.inner"))
set(xo, "ac", select_textobject("@class.outer"))
set(xo, "ic", select_textobject("@class.inner"))

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(c)
    set(n, Leader("lf"), vim.lsp.buf.format, opts({ buffer = c.buf, desc = "Format File" }))
    set(n, Leader("lr"), vim.lsp.buf.rename, opts({ buffer = c.buf, desc = "Rename Symbol" }))
    set(nx, Leader("la"), vim.lsp.buf.code_action, opts({ buffer = c.buf, desc = "View Code Action" }))
    set(n, Leader("lR"), vim.lsp.buf.references, opts({ buffer = c.buf, desc = "View Symbol References" }))
    set(n, Leader("li"), vim.lsp.buf.implementation, opts({ buffer = c.buf, desc = "View Implementations" }))
    set(n, Leader("ls"), vim.lsp.buf.definition, opts({ buffer = c.buf, desc = "View Definition" }))
    set(n, Leader("lt"), vim.lsp.buf.type_definition, opts({ buffer = c.buf, desc = "View Type Definition" }))
  end,
})
