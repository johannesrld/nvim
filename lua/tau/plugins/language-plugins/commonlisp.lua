
vim.g.nvlime_config = {
  cmp = {
    enabled = true
  }
}
return {
  -- "theHamsta/nvim-treesitter-commonlisp",
  {
    'johannesrld/parinfer-rust',
    branch = "fix-undo-explosions",
    build = 'cargo build --release',
    lazy = true,
    event = 'InsertEnter',
  },
  {"monkoose/nvlime", dependencies = { "https://github.com/monkoose/parsley" }, config = function ()
  end}
  -- { 'Olical/conjure', ft = { 'lisp' } },
  -- { 'PaterJason/cmp-conjure'}
}
