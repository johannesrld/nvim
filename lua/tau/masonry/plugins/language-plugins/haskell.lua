return {
  {
    'mrcjkb/haskell-tools.nvim',
    version = '^3',
    ft = { 'haskell', 'lhaskell', 'cabal', 'cabalproject' },
  },
  {
    "itchyny/vim-haskell-indent",
    ft = { 'haskell', 'lhaskell', 'cabal', 'cabalproject' },
    lazy = true,
    event = "LspAttach"
  }
}
