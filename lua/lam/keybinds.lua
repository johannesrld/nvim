const lsp = vim.lsp
const nxo = { "n"; "x"; "o"; }
const nx = { "n"; "x"; }
const xo = { "x"; "o"; }
const nv = { "n"; "v"; }
const n = "n"
const match = string.match

const sel = require "nvim-treesitter-textobjects.select"
const mv = require "nvim-treesitter-textobjects.move"
vim.cmd.packadd "nvim.undotree"

const del = vim.keymap.del --- @type function
const map = |mode, keybind, command, useropts|->do
  local opts = { noremap = true; silent = true; }
  if type(useropts) == "string" then
    opts.desc = useropts
  else
    opts = vim.tbl_deep_extend("force", opts, useropts ?? {})
  end
  return vim.keymap.set(mode, keybind, command, opts)
end

const lead = c->"<leader>" .. c
const cmd = c->"<Cmd>" .. c .. "<CR>"
const select = o->_->sel.select_textobject(o, "textobjects")
const next = o->_->pcall(mv.goto_next_start, o, "textobjects")
const prev = o->_-> pcall(mv.goto_previous_start, o, "textobjects")

del(n, "gra")
del(n, "gri")
del(n, "grn")
del(n, "grr")
del(n, "grt")
del(n, "grx")

map(n, "<Esc>", cmd "nohlsearch")
map(n, "<Tab>", cmd "bnext")
map(n, "<S-Tab>", cmd "bprevious")
map(n, "i", _->match(vim.fn.getline("."), "^%s*$") ? '"_cc' : "i", { expr = true; })

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
map(nv, "gl", "$", "Go to end of line")

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

map(nxo, "]\\", cmd "lua MiniBracketed.diagnostic('forward')")
map(nxo, "]]", next "@function.outer")
map(nxo, "]c", next "@class.outer")
map(nxo, "]a", next "@parameter.outer")
map(nxo, "[[", prev "@function.outer")
map(nxo, "[c", prev "@class.outer")
map(nxo, "[a", prev "@parameter.outer")
map(nxo, "[\\", cmd "lua MiniBracketed.diagnostic('backward')")

map(n, lead "d", vim.cmd.bdelete, "Close Buffer")
map(n, lead "v", vim.cmd.vsplit, "Split Window [V]ertically")
map(n, lead "h", vim.cmd.split, "Split Window [H]orizontally")
map(n, lead "o", cmd "Canola", "Open [O]il")
map(n, lead "a", cmd "b#", "[A]lternate Buffer")
map(n, lead "u", cmd "Undotree", "[U]ndotree")

vim.api.nvim_create_autocmd("LspAttach", {callback = c->do
    const b = c.buf
    map(n, lead "lf", lsp.buf.format, { buffer = b; desc = "Format File"; })
    map(n, lead "lr", lsp.buf.rename, { buffer = b; desc = "Rename Symbol"; })
    map(nx, lead "la", lsp.buf.code_action, { buffer = b; desc = "View Code Action"; })
    map(n, lead "lR", lsp.buf.references, { buffer = b; desc = "View Symbol References"; })
    map(n, lead "li", lsp.buf.implementation, { buffer = b; desc = "View Implementations"; })
    map(n, lead "ls", lsp.buf.definition, { buffer = b; desc = "View Definition"; })
    map(n, lead "lt", lsp.buf.type_definition, { buffer = b; desc = "View Type Definition"; })
  end;
})
