local nv = mode.nv
return {
  {
    'olrtg/nvim-emmet',
    config = function()
      return map(nv, 'grw', require('nvim-emmet').wrap_with_abbreviation)
    end,
    ft = { 'html', 'css' },
  },
}
