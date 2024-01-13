---@type function
local set = vim.keymap.set
---@type function
local hydra = require 'hydra'
---@type function
local wk = require 'which-key'

wk.register({
  t = {
    name = '+Telescope',
  },
  l = {
    name = '+Code Actions'
  }
}, { prefix = "<leader>" })

---@param defaultOpts table
---@return fun(customOpts: table): table
local function defaultSetting(defaultOpts)
  return function(customOpts)
    customOpts = customOpts or {}
    return vim.tbl_extend('force', defaultOpts, customOpts)
  end
end

local opts = defaultSetting { silent = true, noremap = true }

set(
  'n',
  '<leader>x',
  function() require('trouble').toggle() end,
  opts { desc = 'View Probelms' }
)


set(
  'n',
  '<leader>m',
  function() require('undotree').toggle() end,
  opts { desc = 'Toggle Undo Tree' }
)


set(
  'n',
  '<leader>g',
  function() require('neogit').open {} end,
  opts { desc = 'Open Neogit' }
)

local function slew_hydra() print 'Hercules slew the Hydra.' end
hydra {
  name = 'Window resizing',
  mode = 'n',
  body = '<C-W>',
  heads = {
    { '+', '<C-W>+', { timeout = false } },
    { '-', '<C-W>-', { timeout = false } },
    { '>', '<C-W>>', { timeout = false } },
    { '<', '<C-W><', { timeout = false } },
    { '=', '<C-W>=', { exit = true, timeout = false } },
  },
  config = {
    hint = false,
    on_enter = function() vim.bo.modifiable = false end,
    on_exit = slew_hydra,
  },
}
hydra {
  name = 'Swap params',
  mode = 'n',
  body = '<leader>',
  heads = {
    {
      'a',
      '<cmd>TSTextobjectSwapNext @parameter.inner<cr>',
      { desc = 'Swap to next param' },
    },
    {
      'A',
      '<cmd>TSTextobjectSwapPrevious @parameter.inner<cr>',
      { desc = 'Swap to previous param' },
    },
  },
  config = {
    hint = false,
    on_exit = slew_hydra,
  },
}
---@param module string
---@return function
local function Telescope(module)
  local teleopts = require('telescope.themes').get_ivy {
    layout_config = {
      height = 13
    },
    borderchars = {
      preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
    },
  }
  return function()
    require('telescope.builtin')[module](teleopts)
  end
end
set('n', "[d", vim.diagnostic.goto_next, opts { desc = "Goto next issue" })
set('n', "]d", vim.diagnostic.goto_prev, opts { desc = "Goto prev issue" })
set('n', '<leader>tf', Telescope 'find_files', opts { desc = "Find Files" })
set('n', '<leader>tg', Telescope 'live_grep', opts { desc = "Live grep" })
set('n', '<leader>tb', Telescope 'buffers', opts { desc = "Current Buffers" })
-- Note that the +l prefix is for "language", not lsp
set('n', '<leader>lf', vim.lsp.buf.format, opts { desc = 'Format File' })
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local opts = defaultSetting { buffer = ev.buf, silent = true, noremap = true }

    set('n', 'K', vim.lsp.buf.hover, opts { desc = 'Hover Info' })
    set('n', 'gd', vim.lsp.buf.definition, opts { desc = "goto symbol definition" })
    set('n', 'gi', vim.lsp.buf.implementation, opts { desc = "goto implementation" })
    set('n', 'gr', vim.lsp.buf.references, opts { desc = "goto references" })
    set({ 'n', 'v' }, '<leader>la', vim.lsp.buf.code_action, opts { desc = 'Code Action' })
    set('n', '<leader>lr', vim.lsp.buf.rename, opts { desc = 'Rename Symbol' })
    set('n', '<leader>ls', Telescope 'lsp_document_symbols', opts { desc = 'View buffer symbols' })
    -- set('n', '<leader>ls', Telescope 'lsp_workspace_symbols', opts { desc = 'View project symbols' })
    -- set('n', '<leader>ls', vim.lsp.buf.signature_help, opts { desc = 'Symbol Signature' })
    -- set('n', '<leader>ct', vim.lsp.buf.type_definition, opts { desc = 'Jump to type definition' })
  end,
})
