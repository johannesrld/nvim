return {
  {
    'johannesrld/cold.nvim',
    priority = 1000,
    lazy = true,
    init = function ()
      vim.cmd('colorscheme cold')
    end
  },
  {
    'stevearc/oil.nvim',
    opts = {
      columns = {
        'permissions',
      },
      view_options = {
        show_hidden = true,
        is_always_hidden = function(n, _)
          return n == '.git'
        end,
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
    },
  },
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    init = function()
      vim.opt.timeout = true
      vim.opt.timeoutlen = 300
    end,
    opts = {
      preset = 'helix',
      win = {
        border = 'single',
      },
      icons = {
        breadcrumb = '-',
        separator = '->',
        mappings = false,
        colors = false,
        keys = {
          Up = '^',
          Down = 'v',
          Left = '<',
          Right = '>',
          C = 'C-',
          S = 'Shift',
          CR = 'CR',
          Esc = 'Esc',
          ScrollWheelDown = 'SWD',
          ScrollWheelUp = 'SWU',
          NL = 'NL',
          BS = 'BS',
          Space = 'SPC',
          Tab = 'Tab',
          F1 = 'F1',
          F2 = 'F2',
          F3 = 'F3',
          F4 = 'F4',
          F5 = 'F5',
          F6 = 'F6',
          F7 = 'F7',
          F8 = 'F8',
          F9 = 'F9',
          F10 = 'F10',
          F11 = 'F11',
          F12 = 'F12',
        },
      },
    },
  },
}
