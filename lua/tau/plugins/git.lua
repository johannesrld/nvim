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
    init = function()
      vim.cmd [[ autocmd FileType NeogitStatus,NeogitPopup lua vim.opt_local.spell = false; vim.opt_local.list = false; vim.opt_local.foldlevel = 1000 ]]
    end
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
  { 'lewis6991/gitsigns.nvim',   config = true },
  { 'akinsho/git-conflict.nvim', version = '*', config = true },
}
