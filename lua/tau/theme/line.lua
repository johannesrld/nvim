local function gitBranch()
  if vim.loop.fs_stat(vim.loop.cwd() .. "/.git") then
    return "[" .. vim.trim(vim.fn.system({"git", "rev-parse", "--abbrev-ref", "HEAD"})) .. "]"
  end
  return ""
end
vim.opt.statusline = ("%t %h%w%m%r" .. gitBranch() .. "%=%(%l,%c%V %= %P%)")

