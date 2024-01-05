return {
  {
    'olrtg/nvim-emmet',
    config = function()
      vim.keymap.set(
        { 'n', 'v' },
        '<leader>lwa',
        require('nvim-emmet').wrap_with_abbreviation
      )
    end,
    ft = { 'html', 'css' },
  },
  {
    'windwp/nvim-ts-autotag',
    ft = { 'html', 'typescript', 'javascript' },
  },
}
