local parseKeybinds = require 'tau.keybinds.nastybits'
---@type function
local set = vim.keymap.set
---@type table
local wk = require 'which-key'
---@param defaultOpts table
---@return fun(customOpts: table?): table
local function createOpts(defaultOpts)
  return function(customOpts)
    if customOpts == nil then return defaultOpts end
    return vim.tbl_extend('force', defaultOpts, customOpts)
  end
end

local opts = createOpts { silent = true, noremap = true }

wk.register({
  t = { name = '+Telescope', },
  l = { name = '+Language Actions' }
}, { prefix = "<leader>" })

---@param module string
---@return function
local function Telescope(module)
  local teleopts = require('telescope.themes').get_ivy {
    layout_config = { height = 13 },
    borderchars = { preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└' } },
  }
  return function() require('telescope.builtin')[module](teleopts) end
end

---@type keybindSpec
local keybinds = {
  { silent = true, noremap = true },
  [vim.g.maplocalleader] = function()
    wk.show(vim.g.maplocalleader, { mode = 'n' })
  end,
  ['<leader>w'] = {
    "Jump to window",
    with_leader = true,
    function()
      require('nvim-window').pick()
    end
  },
  ["<leader>m"] = {
    "Toggle Undo Tree",
    function()
      require("undotree").toggle()
    end
  },
  ["<leader>g"] = {
    "Open Neogit",
    function()
      require("neogit").open {}
    end
  },
  ["<leader>tf"] = {
    "Find Files",
    Telescope "find_files"
  },
  ["<leader>tg"] = {
    "Live Grep",
    Telescope "live_grep"
  },
  ["<leader>tb"] = {
    "Current Buffers",
    Telescope "buffers"
  },
}
parseKeybinds(keybinds)

-- Note that the +l prefix is for "language", not lsp
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    ---@diagnostic disable-next-line
    local opts = createOpts { buffer = ev.buf, silent = true, noremap = true }
    set('n', '<leader>x', function() require('trouble').toggle() end, opts { desc = 'View Probelms' })
    set('n', '<leader>lf', vim.lsp.buf.format, opts { desc = 'Format File' })
    set('n', 'K', vim.lsp.buf.hover, opts { desc = 'Hover Info' })
    set('n', 'gd', vim.lsp.buf.definition, opts { desc = "goto symbol definition" })
    set('n', 'gi', vim.lsp.buf.implementation, opts { desc = "goto implementation" })
    set('n', 'gr', Telescope 'lsp_references', opts { desc = "goto references" })
    set({ 'n', 'v' }, '<leader>la', vim.lsp.buf.code_action, opts { desc = 'Code Action' })
    set('n', '<leader>lr', vim.lsp.buf.rename, opts { desc = 'Rename Symbol' })
    set('n', '<leader>ls', Telescope 'lsp_document_symbols', opts { desc = 'View buffer symbols' })
  end,
})
local function with_leader(tbl) end



local keybinds = {
  K =  { "Hover Info",             vim.lsp.buf.hover },
  gd = { "Goto symbol definition", vim.lsp.buf.definition },
  gi = { "Goto implementation",    vim.lsp.buf.implementation },
  gr = { "goto References",        Telescope "lsp_references" },
}
