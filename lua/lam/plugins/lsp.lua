return {
  'neovim/nvim-lspconfig',
  {
    'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
    config = true,
  },

  {
    'windwp/nvim-autopairs',
    lazy = true,
    event = 'InsertEnter',
    config = true,
    opts = { check_ts = true },
    init = function()
      local np = require('nvim-autopairs')
      np.get_rules("'")[1].not_filetypes = { 'scheme', 'lisp', 'fennel' }
      np.get_rules('`')[1].not_filetypes = { 'scheme', 'lisp', 'fennel', 'lua' }
    end,
  },

  {
    'saghen/blink.cmp',
    dependencies = {
      { 'disrupted/blink-cmp-conventional-commits' },
    },
    version = '*',
    lazy = true,
    event = { 'InsertEnter', 'CmdlineEnter' },
    opts = {
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
    },
    opts_extended = { 'sources.default' },
  },
}
