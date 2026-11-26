const lsp = vim.lsp
const nxo = { "n"; "x"; "o"; }
const nx = { "n"; "x"; }
const xo = { "x"; "o"; }
const nv = { "n"; "v"; }
const n = "n"

const sel = require "nvim-treesitter-textobjects.select"
const mv = require "nvim-treesitter-textobjects.move"

const map = |mode, keybind, command, useropts|->
  vim.keymap.set(mode, keybind, command, type(useropts) == "string"
    ? { noremap = true; silent = true; desc = useropts; }
    : vim.tbl_deep_extend("force", { noremap = true; silent = true; }, useropts ?? {}))

const lead = |c|->"<leader>" .. c
const cmd = |c|->"<Cmd>" .. c .. "<CR>"
const select = |o|->|_|->sel.select_textobject(o, "textobjects")
const tsnext = |o|->|_|->pcall(mv.goto_next_start, o, "textobjects")
const prev = |o|->|_|-> pcall(mv.goto_previous_start, o, "textobjects")

map(n, "<Esc>", cmd "nohlsearch")
map(n, "<Tab>", cmd "bnext")
map(n, "<S-Tab>", cmd "bprevious")

map(nx, "gy", '"+y', "Copy to System Keyboard")
map(nx, "gp", '"+p', "Paste from System Keyboard")

map(n, "[p", cmd 'exe "put! " . v:register', "Paste Above")
map(n, "]p", cmd 'exe "put "  . v:register', "Paste Below")
map(n, "yc", "yy<cmd>normal gcc<CR>p", "Duplicate line and comment")

vim.iter({
  ["a="] = "@assignment.outer";
  ["i="] = "@assignment.inner";
  ["[="] = "@assignment.lhs";
  ["]="] = "@assignment.rhs";
  ["am"] = "@function.outer";
  ["im"] = "@function.inner";
  ["aC"] = "@call.outer";
  ["iC"] = "@call.inner";
  ["ac"] = "@class.outer";
  ["ic"] = "@class.inner";
  ["aa"] = "@parameter.outer";
  ["ia"] = "@parameter.inner";
  ["at"] = "@type";
}):each(|k, v|->map(xo, k, select(v)))

map(nxo, "]\\", cmd "lua MiniBracketed.diagnostic('forward')")
map(nxo, "]]", tsnext "@function.outer")
map(nxo, "]c", tsnext "@class.outer")
map(nxo, "]a", tsnext "@parameter.outer")
map(nxo, "[[", prev "@function.outer")
map(nxo, "[c", prev "@class.outer")
map(nxo, "[a", prev "@parameter.outer")
map(nxo, "[\\", cmd "lua MiniBracketed.diagnostic('backward')")

map(n, lead "d", _->require("mini.bufremove").delete(), "Close Buffer")
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
