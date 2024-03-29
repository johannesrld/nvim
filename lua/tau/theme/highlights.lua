vim.opt.termguicolors = true
require('lspconfig.ui.windows').default_options.border = 'single'

require('nvim-treesitter.configs').setup {
  ensure_installed = {
    -- General Vim stuff
    'lua',
    'vim',
    'vimdoc',
    -- python
    'requirements',
    'python',
    -- Shell
    'bash',
    -- General Data formats
    'json',
    'json5',
    'jsonc',
    'jq',
    'yaml',
    'xml',
    'toml',
    'sql',
    -- Plain text documents
    'org',
    'markdown',
    'mermaid',
    -- Web Stuff
    'html',
    'javascript',
    'typescript',
    'css',
    -- Git
    'gitattributes',
    'gitcommit',
    'gitignore',
    'git_config',
    'git_rebase',
  },

  indent = { enable = true, disable = { 'html', 'ocaml' } },

  auto_install = true,
  highlight = { enable = true, additional_vim_regex_highlighting = { 'org' } },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      scope_incremental = '<c-s>',
      node_decremental = '<M-space>',
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ['aa'] = '@parameter.outer',
        ['ia'] = '@parameter.inner',
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
    swap = {
      enable = true,
    },
  },
  endwise = {
    enable = true,
  },
  autotag = {
    enable = true,
    enable_rename = true,
  },
}
