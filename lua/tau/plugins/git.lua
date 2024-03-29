return {
  {
    'NeogitOrg/neogit',
    dependencies = { 'nvim-lua/plenary.nvim' },
    lazy = true,
    cmd = 'Neogit',
    opts = {
      integrations = {
        diffview = true,
      },
    },
  },
  {
    'sindrets/diffview.nvim',
    lazy = true,
    opts = {
      use_icons = false,
      icons = { -- Only applies when use_icons is true.
        folder_closed = '>',
        folder_open = 'v',
      },
      signs = {
        fold_closed = '>',
        fold_open = 'v',
        done = '✓',
      },
    },
  },
  { 'lewis6991/gitsigns.nvim', config = true },
  { 'akinsho/git-conflict.nvim', version = '*', config = true },
}
