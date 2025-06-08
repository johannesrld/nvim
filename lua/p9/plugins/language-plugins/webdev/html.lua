local set = vim.keymap.set
return {
  {
    'olrtg/nvim-emmet',
    config = function()
      return set(
        { 'n', 'v' },
        '<leader>lw',
        require('nvim-emmet').wrap_with_abbreviation
      )
    end,
    ft = { 'html', 'css' },
  },
}
