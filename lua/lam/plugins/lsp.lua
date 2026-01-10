return {
  'neovim/nvim-lspconfig',
  {
    'saghen/blink.cmp',
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
