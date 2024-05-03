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


-- Stupid nonsense to get around which-keys #172 and/or #476,
-- remove at the earliest convenience
set('n', vim.g.maplocalleader, function() wk.show(vim.g.maplocalleader, { mode = 'n' }) end, opts())

set('n', '<leader>w', function() require 'nvim-window'.pick() end, opts { desc = 'Jump to window' })

set('n', '<leader>m', function() require('undotree').toggle() end, opts { desc = 'Toggle Undo Tree' })

set('n', '<leader>g', function() require('neogit').open {} end, opts { desc = 'Open Neogit' })


---@param module string
---@return function
local function Telescope(module)
  local teleopts = require('telescope.themes').get_ivy {
    layout_config = { height = 13 },
    borderchars = { preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└' } },
  }
  return function() require('telescope.builtin')[module](teleopts) end
end

set('n', '<leader>tf', Telescope 'find_files', opts { desc = "Find Files" })
set('n', '<leader>tg', Telescope 'live_grep', opts { desc = "Live grep" })
set('n', '<leader>tb', Telescope 'buffers', opts { desc = "Current Buffers" })
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
