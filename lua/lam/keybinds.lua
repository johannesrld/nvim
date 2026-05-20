local lsp = vim.lsp
local nxo, nx, xo, nv, n = { "n", "x", "o" }, { "n", "x" }, { "x", "o" }, { "n", "v" }, "n"

local esc = vim.keycode "<Esc>"
local carriage_return = vim.keycode "<CR>"
local tab = vim.keycode "<Tab>"
local to_sel = require "nvim-treesitter-textobjects.select"
local to_jump = require "nvim-treesitter-textobjects.move"
vim.cmd.packadd "nvim.undotree"

local del = vim.keymap.del ---@type function

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
local function select(o)
  return function() to_sel.select_textobject(o, "textobjects") end
end
local function next(o)
  return function() to_jump.goto_next_start(o, "textobjects") end
end
local function prev(o)
  return function() to_jump.goto_previous_start(o, "textobjects") end
end

del(n, "gra")
del(n, "gri")
del(n, "grn")
del(n, "grr")
del(n, "grt")
del(n, "grx")

map(n, esc, cmd "nohlsearch")
map(n, tab, cmd "bnext")
map(n, "<S-Tab>", cmd "bprevious")
vim.keymap.set("n", "i", function()
  if vim.fn.getline("."):match "^%s*$" then return '"_cc' end
  return "i"
end, { expr = true })

map(nx, "gy", '"+y', "Copy to System Keyboard")
map(nx, "gp", '"+p', "Copy to System Keyboard")
map(n, "<C-H>", "<C-w>h", "Focus on left window")
map(n, "<C-J>", "<C-w>j", "Focus on below window")
map(n, "<C-K>", "<C-w>k", "Focus on above window")
map(n, "<C-L>", "<C-w>l", "Focus on right window")

map(n, "[p", cmd 'exe "put! " . v:register', "Paste Above")
map(n, "]p", cmd 'exe "put "  . v:register', "Paste Below")
map(n, "yc", "yy<cmd>normal gcc<CR>p", "Duplicate line and comment")
map(nv, "gh", "_", "Go to start of line")
map(nv, "gl", "$", "Go to start of line")

map(xo, "a=", select "@assignment.outer")
map(xo, "i=", select "@assignment.inner")
map(xo, "[=", select "@assignment.lhs")
map(xo, "]=", select "@assignment.rhs")
map(xo, "am", select "@function.outer")
map(xo, "im", select "@function.inner")
map(xo, "aC", select "@call.outer")
map(xo, "iC", select "@call.inner")
map(xo, "ac", select "@class.outer")
map(xo, "ic", select "@class.inner")
map(xo, "aa", select "@parameter.outer")
map(xo, "ia", select "@parameter.inner")
map(xo, "at", select "@type")

map(nxo, "]]", next "@function.outer")
map(nxo, "]c", next "@class.outer")
map(nxo, "]a", next "@parameter.outer")
map(nxo, "[[", prev "@function.outer")
map(nxo, "[c", prev "@class.outer")
map(nxo, "[a", prev "@parameter.outer")

map(n, Leader "v", vim.cmd.vsplit, "Split Window [V]ertically")
map(n, Leader "h", vim.cmd.split, "Split Window [H]orizontally")
map(n, Leader "o", cmd "Canola", "Open [O]il")
map(n, Leader "a", cmd "b#", "[A]lternate Buffer")
map(n, Leader "u", cmd "Undotree", "[U]ndotree")
map(n, Leader "r", function()
  if vim.fn.getloclist(0, { winid = 0 }).winid then
    vim.cmd.lclose()
    return
  end
  vim.diagnostic.setloclist { open = true }
end, "open diagnostics")

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(c)
    local buf = c.buf
    map(n, Leader "lf", lsp.buf.format, { buffer = buf, desc = "Format File" })
    map(n, Leader "lr", lsp.buf.rename, { buffer = buf, desc = "Rename Symbol" })
    map(nx, Leader "la", lsp.buf.code_action, { buffer = buf, desc = "View Code Action" })
    map(n, Leader "lR", lsp.buf.references, { buffer = buf, desc = "View Symbol References" })
    map(n, Leader "li", lsp.buf.implementation, { buffer = buf, desc = "View Implementations" })
    map(n, Leader "ls", lsp.buf.definition, { buffer = buf, desc = "View Definition" })
    map(n, Leader "lt", lsp.buf.type_definition, { buffer = buf, desc = "View Type Definition" })
  end,
})
