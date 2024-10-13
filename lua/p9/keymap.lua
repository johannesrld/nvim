local keybinds = require 'p9.keybinds.nastybits'
local wk = require 'which-key'
local function telescope(module)
  local opts = {
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
    layout_config = { height = 13 },
  }
  local function theme() return require('telescope.themes').get_ivy(opts) end
  return function() return require('telescope.builtin')[module](theme()) end
end
keybinds {
  { noremap = true, silent = true },
  ['<leader>v'] = { 'Split Window [V]ertically', vim.cmd.vsplit },
  ['<leader>x'] = { 'View Problems (Focus)', function()
    return require('trouble').toggle { mode = 'diagnostics', focus = true }
  end },
  ['<leader>X'] = { 'View Problems', function()
    return require('trouble').toggle { mode = 'diagnostics', focus = false }
  end },
  ['<leader>b'] = { 'Current [B]uffers', telescope 'buffers' },
  ['<leader>f'] = { '[F]ind Files', telescope 'find_files' },
  ['<leader>s'] = { 'Live Grep ([S]earch)', telescope 'live_grep' },
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
  end
})
