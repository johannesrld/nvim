return {
  {
    'olrtg/nvim-emmet',
    config = function()
      return vim.keymap.set(
        { 'n', 'v' },
        '<leader>lw',
        require('nvim-emmet').wrap_with_abbreviation
      )
    end,
    ft = { 'html', 'css' },
  },
}
