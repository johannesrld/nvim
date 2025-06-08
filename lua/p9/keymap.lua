local function keybinds(keybinds)
  local default_opts = (keybinds[1] or {})
  table.remove(keybinds, 1)
  for keybind, spec in pairs(keybinds) do
    if type(spec) == 'function' then
      vim.keymap.set('n', keybind, spec, default_opts)
    else
      local desc
      if type(spec[1]) == 'string' then
        desc = spec[1]
      else
        desc = nil
      end
      local callback
      if type(spec[1]) == 'function' then
        callback = spec[1]
      else
        callback = spec[2]
      end
      local options = vim.tbl_extend('force', default_opts, {
        desc = (desc or default_opts.desc),
        silent = (spec.silent or default_opts.silent),
      })
      vim.keymap.set((spec.mode or 'n'), keybind, callback, options)
    end
  end
  return nil
end
local function telescope(module)
  local function theme()
    return require('telescope.themes').get_ivy {
      borderchars = {
        preview = {
          '\226\148\128',
          '\226\148\130',
          '\226\148\128',
          '\226\148\130',
          '\226\148\140',
          '\226\148\144',
          '\226\148\152',
          '\226\148\148',
        },
      },
      layout_config = { height = 14 },
    }
  end
  return function() return require('telescope.builtin')[module](theme()) end
end
keybinds {
  { noremap = true, silent = true },
  ['<leader>v'] = { 'Split Window [V]ertically', vim.cmd.vsplit },
  ['<leader>x'] = {
    'View Problems (Focus)',
    function() return require('trouble').toggle { mode = 'diagnostics', focus = true } end,
  },
  ['<leader>X'] = {
    'View Problems',
    function() return require('trouble').toggle { mode = 'diagnostics', focus = false } end,
  },
  ['<leader>b'] = { 'Current [B]uffers', telescope 'buffers' },
  ['<leader><leader>'] = { '[F]ind Files', telescope 'find_files' },
  ['<leader>/'] = { 'Live Grep ', telescope 'live_grep' },
}
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(c)
    return keybinds {
      { buffer = c.buf, noremap = true, silent = true },
      K = { 'Hover Info', vim.lsp.buf.hover },
      gd = { 'Goto symbol definition', telescope 'lsp_definitions' },
      gi = { 'Goto implementation', telescope 'lsp_implementation' },
      ['<leader>lf'] = { 'Format File', vim.lsp.buf.format },
      ['<leader>la'] = { 'Code Action', vim.lsp.buf.code_action },
      ['<leader>lr'] = { 'Rename Symbol', vim.lsp.buf.rename },
      ['<leader>ls'] = { 'View Buffer Symbols', telescope 'lsp_document_symbols' },
      gr = { 'Goto References', telescope 'lsp_references' },
    }
  end,
})
