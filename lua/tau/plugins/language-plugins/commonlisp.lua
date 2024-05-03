return {
  -- "theHamsta/nvim-treesitter-commonlisp",
  {
    'eraserhd/parinfer-rust',
    build = 'cargo build --release',
    lazy = true,
    event = 'InsertEnter',
    ft = { 'lisp' },
  },
}
