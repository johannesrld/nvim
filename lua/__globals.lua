local defaults = { noremap = true, silent = true }

local function _fail(at)
  vim.api.nvim_echo({
    { 'Failed to set globals: ' .. at .. ' is already set\n', 'ErrorMsg' },
    { 'Press any key to exit...' },
  }, true, {})
  vim.fn.getchar()
  os.exit()
end

local function mmap(additional_defaults)
  local default = vim.tbl_extend('force', defaults, additional_defaults or {})
  return function(mode, lhs, rhs, opts)
    opts = opts or {}
    local ext_opts = vim.tbl_extend('force', default, opts)
    return vim.keymap.set(mode, lhs, rhs, ext_opts)
  end
end

local function Leader(code) return '<leader>' .. code end

local function lazy(pkg, fn)
  return function() return require(pkg)[fn]() end
end

local function isnil(a) return a == nil end

local function export(name, p)
  if isnil(_G[name]) then
    _G[name] = p
  else
    _fail('_G.' .. name)
  end
end

---@param modes string | string[]
---@param lhs string
---@param opts? vim.keymap.del.Opts
_G.del = isnil(_G.del)
    and function(modes, lhs, opts) pcall(vim.keymap.del, modes, lhs, opts) end
  or _fail('_G.del')

--Other

export('mmap', mmap)
export('map', mmap())
export('nmap', function(lhs, rhs, opts) return map('n', lhs, rhs, opts) end)
export('nvmap', function(lhs, rhs, opts) return map({ 'n', 'v' }, lhs, rhs, opts) end)
export('Leader', Leader)
export(
  'onLsp',
  function(fn)
    vim.api.nvim_create_autocmd('LspAttach', {
      callback = fn,
    })
  end
)
export('lazy', lazy)
export('leaderkey', leader)

export('mode', {
  n = 'n',
  x = 'x',
  v = 'v',
  o = 'o',
})

_G.mode.nx = { _G.mode.n, _G.mode.x }
_G.mode.nv = { _G.mode.n, _G.mode.v }
_G.mode.xv = { _G.mode.x, _G.mode.v }
_G.mode.xo = { _G.mode.x, _G.mode.o }
