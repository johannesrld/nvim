local function keybinds(key)
  local default_opts = (key[1] or {})
  table.remove(key, 1)
  for keybind, spec in pairs(key) do
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

keybinds {
  { noremap = true, silent = true },
  ['<leader>v'] = { 'Split Window [V]ertically', vim.cmd.vsplit },
  ['<leader>x'] = {
    'View Problems (Focus)',
    function()
      return require('trouble').toggle {
        mode = 'diagnostics',
        focus = true
      }
    end,
  },
}


keybinds {
  { noremap = true, silent = true },
  ['<leader>b'] = { 'Current [B]uffers', FzfLua.buffers},
  ['<leader><leader>'] = { '[F]ind Files', FzfLua.files},
  ['<leader>/'] = { 'Live Grep ', FzfLua.live_grep},
}
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(c)
    return keybinds {
      { buffer = c.buf, noremap = true, silent = true },
      K = { 'Hover Info', vim.lsp.buf.hover },
      gd = { 'Goto symbol definition', FzfLua.lsp_definitions},
      gi = { 'Goto implementation', FzfLua.lsp_implementations},
      ['<leader>lf'] = { 'Format File', vim.lsp.buf.format },
      ['<leader>la'] = { 'Code Action', vim.lsp.buf.code_action },
      ['<leader>lr'] = { 'Rename Symbol', vim.lsp.buf.rename },
      ['<leader>ls'] = { 'View Buffer Symbols', FzfLua.lsp_document_symbols },
      gr = { 'Goto References',  FzfLua.lsp_references },
    }
  end,
})
