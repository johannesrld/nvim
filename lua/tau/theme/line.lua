local function gitBranch()
  if vim.loop.fs_stat(vim.loop.cwd() .. "/.git") then
    local git_str =
    "[" .. vim.trim(vim.fn.system({"git", "symbolic-ref", "--short", "HEAD"})) .. "]"
    if git_str ~= "[]" then
      return git_str
    end
  end
  return ""
end
vim.opt.statusline = ("%t %h%w%m%r" .. gitBranch() .. "%=%(%l,%c%V %= %P%)")

