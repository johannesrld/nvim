local set = vim.keymap.set
---@type function
local hydra = require 'hydra'
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
  return function()
    require('telescope.builtin')[module]()
  end
end
set('n', '<leader>tf', Telescope 'fd', opts { desc = "Find Files" })
set('n', '<leader>tg', Telescope 'live_grep', opts { desc = "Live grep" })
set('n', '<leader>tb', Telescope 'buffers', opts { desc = "Current Buffers" })
set('n', '<leader>lf', vim.lsp.buf.format, opts { desc = 'Format File' })
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local opts = defaultSetting { buffer = ev.buf, silent = true, noremap = true }
    set('n', 'gd', vim.lsp.buf.definition, opts { desc = "goto symbol definition" })
    set('n', 'K', vim.lsp.buf.hover, opts { desc = 'Hover Info' })
    set('n', "[d", vim.diagnostic.goto_next, opts { desc = "Goto next issue" })
    set('n', "]d", vim.diagnostic.goto_prev, opts { desc = "Goto prev issue" })
    set('n', '<leader>lr', vim.lsp.buf.rename, opts { desc = 'Rename Symbol' })
    set('n', '<leader>la', vim.lsp.buf.code_action, opts { desc = 'Code Action' })
    set('n', '<leader>ls', vim.lsp.buf.signature_help, opts { desc = 'Symbol Signature' })
    -- set('n', '<leader>ct', vim.lsp.buf.type_definition, opts { desc = 'Jump to type definition' })
  end,
})
