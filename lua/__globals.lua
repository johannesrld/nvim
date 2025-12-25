local leader = vim.keycode('<leader>')
local defaults = { noremap = true, silent = true }

local function _fail(at)
  vim.api.nvim_echo(
    {
      { 'Failed to set globals: ' .. at .. ' is already set\n', 'ErrorMsg' },
      { 'Press any key to exit...' },
    }, true, {})
  vim.fn.getchar()
  os.exit()
end


---@param additional_defaults table?
---@return fun(mode: string | table, lsh: string, rhs: string | function, opts?: table)
local function mmap(additional_defaults)
  local default = vim.tbl_extend('force', defaults, additional_defaults or {})
  ---@param mode string | table
  ---@param lhs string
  ---@param rhs string | function
  ---@param opts? table
  return function(mode, lhs, rhs, opts)
    opts = opts or {}
    local ext_opts = vim.tbl_extend('force', default, opts)
    return vim.keymap.set(mode, lhs, rhs, ext_opts)
  end
end

local function Leader(code)
  return leader .. code
end

local function onLsp(fn)
  vim.api.nvim_create_autocmd('LspAttach', {
    callback = fn,
  })
end

local function lazy(pkg, fn)
  return function()
    return require(pkg)[fn]()
  end
end

local function isnil(a)
  return a == nil
end

---@param modes string | string[]
---@param lhs string
---@param opts? vim.keymap.del.Opts
_G.del       = isnil(_G.del) and function(modes, lhs, opts)
  pcall(vim.keymap.del, modes, lhs, opts)
end or _fail('_G.del')

--Other

_G.map       = isnil(_G.map)       and mmap() or _fail('_G.map')
_G.mmap      = isnil(_G.mmap)      and mmap   or _fail('_G.mmap')
_G.Leader    = isnil(_G.Leader)    and Leader or _fail('_G.Leader')
_G.onLsp     = isnil(_G.onLsp)     and onLsp  or _fail('_G.onLsp')
_G.lazy      = isnil(_G.lazy)      and lazy   or _fail('_G.lazy')
_G.leaderkey = isnil(_G.leaderkey) and leader or _fail('_G.leaderkey')
_G.mode      = isnil(_G.mode) and {
  n = 'n',
  x = 'x',
  v = 'v',
} or _fail('_G.mode')
_G.mode.nx   = { _G.mode.n, _G.mode.x }
_G.mode.nv   = { _G.mode.n, _G.mode.v }
_G.mode.xv   = { _G.mode.x, _G.mode.v }
