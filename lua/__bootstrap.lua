local required_cmds = {
  'git',
  'gcc',
  'g++',
  'make',
  'cargo',
  'npm',
  'rg',
  'node',
  'tar',
  'gzip',
  'unzip',
  'python3',
}

local missing_cmds = {}
for _, c in ipairs(required_cmds) do
  if vim.fn.executable(c) ~= 1 then table.insert(missing_cmds, c) end
end

if #missing_cmds ~= 0 then
  local out = {
    { 'Failed to Bootstrap: Missing Commands:\n', 'ErrorMsg' },
  }
  for _, cmd in ipairs(missing_cmds) do
    table.insert(out, { cmd .. '\n', 'WarningMsg' })
  end
  table.insert(out, { 'Press any key to exit...' })
  vim.api.nvim_echo(out, true, {})
  vim.fn.getchar()
  os.exit()
end

