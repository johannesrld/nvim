local indentWidth = 2
vim.opt.shiftwidth = indentWidth  -- Num spaces for commands like "<<" ">>" etc.
vim.opt.softtabstop = indentWidth -- Num of spaces that are used when performing tab ops like inserting tabs
vim.opt.tabstop = indentWidth     -- Num of spaces that a tab in the file counts for

require('iron.core').setup {
  config = {
    repl_definition = {
      haskell = {
        command = function(data)
          local file = vim.api.nvim_buf_get_name(data.current_bufnr)
          return require('haskell-tools').repl.mk_repl_cmd(file)
        end,
      },
    },
  },
}
