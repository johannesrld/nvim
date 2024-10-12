local function _1_()
  return vim.keymap.set(
    { 'n', 'v' },
    '<leader>lw',
    require('nvim-emmet').wrap_with_abbreviation
  )
end
return { { 'olrtg/nvim-emmet', config = _1_, ft = { 'html', 'css' } } }
