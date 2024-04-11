return {
    {
        'MrcJkb/haskell-tools.nvim',
        version = "^3",
        ft = { 'haskell', 'lhaskell', 'cabal', 'cabalproject' }
    },
    { 'neovimhaskell/haskell-vim' },
    { 'itchyny/vim-haskell-indent' },
    {
        'mrcjkb/haskell-snippets.nvim',
        ft = { 'haskell', 'lhaskell', 'cabal', 'cabalproject' },
        lazy = true,
        init = function()
            local ls = require('luasnip')
            local haskell_snippets = require('haskell-snippets').all
            ls.add_snippets('haskell', haskell_snippets, { key = 'haskell' })
        end
    }
}
