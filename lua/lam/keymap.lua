local n = mode.n
local nx = mode.nx
local function TS(module)
  local function theme()
    return require('telescope.themes').get_ivy {
      borderchars = {
        preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
      },
      layout_config = { height = 14 },
    }
  end
  return function()
    return require('telescope.builtin')[module](theme())
  end
end

map(n, Leader('v'),       vim.cmd.vsplit,              { desc = 'Split Window [V]ertically' })
map(n, Leader('x'),       lazy('lsp_lines', 'toggle'), { desc = 'View Problems' })
map(n, Leader('b'),       TS('buffers'),               { desc = 'Current [B]uffers' })
map(n, Leader(leaderkey), TS('find_files'),            { desc = 'Find Files' })
map(n, Leader('/'),       TS('live_grep'),             { desc = 'Live Grep' })
map(n, Leader('o'),       lazy('oil', 'open'),         { desc = 'Open [O]il' })

map(nx, 'gy',    '"+y',    { desc = 'Copy to System Keyboard' })
map(n,  'gp',    '"+p',    { desc = 'Paste from System Keyboard' })
map(nx, 'gp',    '"+p',    { desc = 'Copy to System Keyboard' })
map(n,  '<C-H>', '<C-w>h', { desc = 'Focus on left window' })
map(n,  '<C-J>', '<C-w>j', { desc = 'Focus on below window' })
map(n,  '<C-K>', '<C-w>k', { desc = 'Focus on above window' })
map(n,  '<C-L>', '<C-w>l', { desc = 'Focus on right window' })

del(n,  'gr')
del(n,  'grn')
del(nx, 'gra')
del(n,  'grr')
del(n,  'gri')
del(n,  'grt')
del(n,  'gO')

onLsp(function(c)
  local map = mmap { buffer = c.buf }
  map(n,  'gO',  vim.lsp.buf.document_symbol, { desc = 'View Document Symbols' })
  map(n,  'grf', vim.lsp.buf.format,          { desc = 'Format File' })
  map(n,  'grn', vim.lsp.buf.rename,          { desc = 'Rename Symbol' })
  map(nx, 'gra', vim.lsp.buf.code_action,     { desc = 'View Code Action' })
  map(n,  'grr', vim.lsp.buf.references,      { desc = 'View Symbol References' })
  map(n,  'gri', vim.lsp.buf.implementation,  { desc = 'View Symbol Implementations' })
  map(n,  'grd', vim.lsp.buf.definition,      { desc = 'View Definition' })
  map(n,  'grt', vim.lsp.buf.type_definition, { desc = 'View Type Definition' })
end)
