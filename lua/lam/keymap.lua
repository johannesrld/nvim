---@type function
require('mini.bufremove')
local n = mode.n
local nx, xo = mode.nx, mode.xo
local esc = vim.keycode('<Esc>')
local cr = vim.keycode('<CR>')
local tab = vim.keycode('<Tab>')
local ctrltab = vim.keycode('<C-Tab>')

local function cmd(s) return '<Cmd>' .. s .. cr end

local function scratch_buffer()
  vim.api.nvim_win_set_buf(0, vim.api.nvim_create_buf(true, true))
end

local function delete_buf() MiniBufremove.delete(0, true) end
local function wipeout_buf() MiniBufremove.wipeout(0, true) end

local function select_textobject(to)
  return function()
    require('nvim-treesitter-textobjects.select').select_textobject(to, 'textobjects')
  end
end

nmap(Leader('v'), vim.cmd.vsplit, { desc = 'Split Window [V]ertically' })
nmap(Leader('o'), lazy('oil', 'open'), { desc = 'Open [O]il' })
nmap(Leader('a'), cmd('b#'), { desc = '[A]lternate Buffer' })
nmap(Leader('d'), MiniBufremove.delete, { desc = '[D]elete Buffer' })
nmap(Leader('bD'), delete_buf, { desc = 'Delete! Buffer' })
nmap(Leader('bs'), scratch_buffer, { desc = 'Scratch Buffer' })
nmap(Leader('bw'), MiniBufremove.wipeout, { desc = 'Wipeout Buffer' })
nmap(Leader('bW'), wipeout_buf, { desc = 'Wipeout! Buffer' })
nmap(tab, cmd 'bnext')
nmap(ctrltab, cmd 'bprevious')

map(nx, 'gy', '"+y', { desc = 'Copy to System Keyboard' })
nmap('gp', '"+p', { desc = 'Paste from System Keyboard' })
map(nx, 'gp', '"+p', { desc = 'Copy to System Keyboard' })
nmap('<C-H>', '<C-w>h', { desc = 'Focus on left window' })
nmap('<C-J>', '<C-w>j', { desc = 'Focus on below window' })
nmap('<C-K>', '<C-w>k', { desc = 'Focus on above window' })
nmap('<C-L>', '<C-w>l', { desc = 'Focus on right window' })

nmap('[p', cmd('exe "put! " . v:register'), { desc = 'Paste Above' })
nmap(']p', cmd('exe "put "  . v:register'), { desc = 'Paste Below' })
nmap('yc', 'yy<cmd>normal gcc<CR>p', { desc = 'Go to start of line' })
nmap(esc, '<Cmd>nohlsearch<CR>', { desc = 'Go to start of line' })
nvmap('gh', '_', { desc = 'Go to start of line' })
nvmap('gl', '$', { desc = 'Go to start of line' })

map(xo, 'am', select_textobject('@function.outer'))
map(xo, 'im', select_textobject('@function.inner'))
map(xo, 'ac', select_textobject('@class.outer'))
map(xo, 'ic', select_textobject('@class.inner'))

del(n, 'gr')
del(n, 'grn')
del(nx, 'gra')
del(n, 'grr')
del(n, 'gri')
del(n, 'grt')
del(n, 'gO')
del(nx, 'q:')

onLsp(function(c)
  local map = mmap({ buffer = c.buf })
  nmap(Leader('lf'), vim.lsp.buf.format, { desc = 'Format File' })
  nmap(Leader('lr'), vim.lsp.buf.rename, { desc = 'Rename Symbol' })
  map(nx, Leader('la'), vim.lsp.buf.code_action, { desc = 'View Code Action' })
  nmap(Leader('lR'), vim.lsp.buf.references, { desc = 'View Symbol References' })
  nmap(Leader('li'), vim.lsp.buf.implementation, { desc = 'View Implementations' })
  nmap(Leader('ls'), vim.lsp.buf.definition, { desc = 'View Definition' })
  nmap(Leader('lt'), vim.lsp.buf.type_definition, { desc = 'View Type Definition' })
end)
