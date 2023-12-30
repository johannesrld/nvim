require('lazy').setup {
  spec = {
    { import = 'tau.masonry.plugins' },
    { import = 'tau.masonry.plugins.language-plugins' },
    { import = 'tau.masonry.plugins.language-plugins.webdev' },
  },
  ui = {
    icons = {
      cmd = '$ ',
      config = 'c',
      event = '!',
      ft = 'ft:',
      init = 'in:',
      import = 'ip:',
      keys = 'ky',
      lazy = 'zz',
      loaded = '+',
      not_loaded = '-',
      plugin = '∈ ',
      runtime = 'V ',
      source = ':',
      start = '>',
      task = '||',
      list = {
        '<>',
        '->',
        '*',
        '‒',
      },
    },
  },
}

require 'tau.masonry.cmp'
require 'tau.masonry.lsp'
