vim.lsp.start {
  name = "superhtml",
  cmd = { "superhtml", "lsp" },
  root_dir = vim.fs.dirname(vim.fs.find({ ".git" }, { upward = true })[1])
}
