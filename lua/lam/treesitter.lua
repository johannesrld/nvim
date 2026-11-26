const contains = vim.tbl_contains --- @type function
const disabled_indents = { "python"; }
const ts = vim.treesitter
const ts_configs = require "nvim-treesitter"

--- @param buf integer
--- @param lang string
const attach = |buf, lang|->do
  if !ts.language.add(lang) then return end
  ts.start(buf, lang)
  if !contains(disabled_indents, lang) && ts.query.get(lang, "indents") then
    vim.bo[buf].indentexpr = ts_configs.indentexpr
  end
end

vim.api.nvim_create_autocmd("FileType", {
  callback = a->do
    const buf, filetype = a.buf, a.match

    const lang = ts.language.get_lang(filetype)
    if !lang then return end

    const parsers = ts_configs.get_installed "parsers"
    if contains(parsers, lang) then attach(buf, lang) end
  end,
})
