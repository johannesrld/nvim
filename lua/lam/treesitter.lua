vim.pack.add({
  {
    src = 'https://github.com/nvim-treesitter/nvim-treesitter',
    version = 'main',
  },
  {
    src = 'https://github.com/nvim-treesitter/nvim-treesitter-textobjects',
    version = 'main',
  },
})
local ts = require('nvim-treesitter')
ts.setup()
vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('nvim-treesitter-start', {}),
  callback = function()
    pcall(vim.treesitter.start)
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})

-- local parsers = {
--   'asm',
--   'awk',
--   'bash',
--   'c',
--   'cmake',
--   'css',
--   'csv',
--   'desktop',
--   'diff',
--   'disassembly',
--   'dockerfile',
--   'editorconfig',
--   'fish',
--   'gitattributes',
--   'gitcommit',
--   'git_config',
--   'gitignore',
--   'git_rebase',
--   'html',
--   'http',
--   'hurl',
--   'ini',
--   'javascript',
--   'jsdoc',
--   'json',
--   'json5',
--   'jsonc',
--   'just',
--   'kdl',
--   'llvm',
--   'lua',
--   'luadoc',
--   'luap',
--   'markdown',
--   'markdown_inline',
--   'mermaid',
--   'passwd',
--   'printf',
--   'pymanifest',
--   'python',
--   'readline',
--   'regex',
--   'requirements',
--   'rust',
--   'sql',
--   'toml',
--   'tsv',
--   'tsx',
--   'typescript',
--   'vim',
--   'vimdoc',
--   'xml',
--   'yaml',
-- }
--
-- vim.defer_fn(function() ts.install(parsers):wait(300000) end, 0)
