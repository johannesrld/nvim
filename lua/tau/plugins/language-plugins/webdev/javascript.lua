return {
  {
    'pmizio/typescript-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    lazy = true,
    ft = { 'typescript', 'javascript', 'tsx', 'jsx' },
    config = function()
      require('typescript-tools').setup {}
      require('lspconfig')['typescript-tools'].launch()
    end,
  },
  { 'xabikos/vscode-javascript', ft = { 'typescript', 'javascript', 'tsx', 'jsx' } }
}
