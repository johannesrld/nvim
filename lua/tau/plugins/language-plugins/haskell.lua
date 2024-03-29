local ft = { 'haskell', 'lhaskell', 'cabal', 'cabalproject' }
return {
  {
    'neovimhaskell/haskell-vim',
    ft = ft
  },
  {
    'mrcjkb/haskell-tools.nvim',
    version = '^3',
    ft = ft
  },
  {
    'itchyny/vim-haskell-indent',
    ft = ft
  },
}
