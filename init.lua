vim.loader.enable(true)
vim.opt.shada = "'100,<50,s10,:1000,/100,@100,h"
local bootstrapped = pcall(require, '__bootstrap')
if not bootstrapped then
  print('ERROR, failed to require lua/__bootstrap, unrecovereable')
  return
end
vim.g.no_plugin_maps = true
vim.o.mouse = ''
local space = vim.keycode('<Space>')
local nop = vim.keycode('<Nop>')
vim.g.mapleader = space
vim.g.maplocalleader = space
vim.keymap.set({ 'n', 'v' }, space, nop)

require('__globals')
require('lam.options')

vim.g.rustaceanvim = {
  server = {
    default_settings = {
      ['rust-analyzer'] = {}
    }
  }
}
local disabled_built_ins = {
  '2html_plugin',
  'getscript',
  'getscriptPlugin',
  'gzip',
  'logipat',
  'matchit',
  'matchparen',
  'netrw',
  'netrwFileHandlers',
  'netrwPlugin',
  'netrwSettings',
  'remote_plugins',
  'rrhelper',
  'shada_plugin',
  'spellfile_plugin',
  'tar',
  'tarPlugin',
  'tutor_mode_plugin',
  'vimball',
  'vimballPlugin',
  'zip',
  'zipPlugin',
  'gzip',
  'man',
  'matchit',
  'matchparen',
  'shada',
  'spellfile',
  'tarPlugin',
  'tohtml',
  'tutor',
  'fzf',
  'zipPlugin',
  'node_provider',
  'perl_provider',
  'python3_provider',
  'ruby_provider',
}

for _, plugin in pairs(disabled_built_ins) do
  vim.g['loaded_' .. plugin] = 0
end

vim.pack.add({
  'https://github.com/nvim-mini/mini.ai',
  'https://github.com/nvim-mini/mini.bracketed',
  'https://github.com/nvim-mini/mini.surround',
  'https://github.com/nvim-mini/mini.align',
  'https://github.com/nvim-mini/mini.bufremove',
  'https://github.com/nvim-mini/mini.tabline',
  'https://github.com/echasnovski/mini.statusline',
  'https://github.com/williamboman/mason.nvim',
  'https://github.com/stevearc/oil.nvim',
  'https://github.com/johannesrld/cold.nvim',
  { src = 'https://github.com/neovim/nvim-lspconfig' },
  { src = 'https://github.com/saghen/blink.cmp', version = 'v1.8.0' },
})
require('mini.bufremove').setup()
vim.defer_fn(function()
  require('mini.ai').setup()
  require('mini.bracketed').setup()
  require('mini.surround').setup()
  require('mini.align').setup()
  require('mini.tabline').setup({ use_icons = false })
  require('mini.statusline').setup({
    set_vim_settings = false,
    use_icons = false,
  })
end, 0)
require('oil').setup({
  columns = {
    'permissions',
  },
  view_options = {
    show_hidden = true,
    is_always_hidden = function(n, _) return n == '.git' end,
  },
  win_options = {
    signcolumn = 'no',
    foldcolumn = '0',
    colorcolumn = '',
    spell = false,
  },
  delete_to_trash = true,
  use_default_keymaps = false,
  keymaps = {
    ['<CR>'] = 'actions.select',
    ['P'] = { 'actions.preview', mode = 'n', opts = { horizontal = true } },
    ['q'] = { 'actions.close', mode = 'n' },
    ['r'] = 'actions.refresh',
    ['-'] = { 'actions.parent', mode = 'n' },
    ['_'] = { 'actions.open_cwd', mode = 'n' },
    ['`'] = { 'actions.cd', mode = 'n' },
    ['gs'] = { 'actions.change_sort', mode = 'n' },
    ['gx'] = 'actions.open_external',
    ['g.'] = { 'actions.toggle_hidden', mode = 'n' },
  },
})

require('lam.treesitter')
vim.defer_fn(function()
  vim.api.nvim_create_autocmd({ 'InsertEnter', 'CmdlineEnter' }, {
    callback = function()
      require('blink.cmp').setup({
        appearance = {
          kind_icons = {
            Function = 'λ',
            Method = 'ƛ',
            Constructor = 'ƛ',
            Field = '∈',
            Property = '∈',
            Variable = 'α',
            Snippet = '⍉',
            Class = 'C',
            Interface = 'I',
            Module = 'M',
            Enum = 'E',
            Keyword = 'K',
            Color = ' ',
            File = ' ',
            Reference = '*',
            Folder = ' ',
            EnumMember = 'E',
            Constant = 'α',
            Struct = 'S',
            Event = ' ',
            Operator = ' ',
            Text = ' ',
          },
        },
        completion = {
          ghost_text = { enabled = true },
        },
        sources = {
          per_filetype = {
            gitcommit = { 'conventional_commits' },
            markdown = { 'snippets', 'lsp', 'path' },
          },
          providers = {
            conventional_commits = {
              name = 'Conventional Commits',
              module = 'blink-cmp-conventional-commits',
            },
          },
        },
        keymap = {
          ['<CR>'] = { 'accept', 'fallback' },
          ['<c-CR>'] = { 'cancel', 'fallback' },
          ['<c-j>'] = { 'select_next', 'fallback' },
          ['<c-k>'] = { 'select_prev', 'fallback' },
        },
        fuzzy = { implementation = 'prefer_rust_with_warning' },
        signature = { enabled = true },
      })
    end,
  })
  require('mason').setup({
    ui = {
      icons = {
        package_installed = '+',
        package_pending = '#',
        package_uninstalled = '-',
      },
    },
  })
  require('lam.lsp')
end, 0)

require('lam.keymap')
vim.cmd.colorscheme('cold')
