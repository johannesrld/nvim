vim.pack.add {
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects", version = "main" },
  "https://codeberg.org/jrld/custom-nvim-queries"
}
local contains = vim.tbl_contains ---@type function
local disabled_indents = { "python" }
local ts = vim.treesitter
local ts_configs = require "nvim-treesitter"

---@param buf integer
---@param lang string
local function attach(buf, lang)
  if not ts.language.add(lang) then return end
  ts.start(buf, lang)
  if not contains(disabled_indents, lang) and ts.query.get(lang, "indents") ~= nil then
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end
end

vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    local buf, filetype = args.buf, args.match

    local lang = ts.language.get_lang(filetype)
    if not lang then return end

    local parsers = ts_configs.get_installed "parsers"
    if contains(parsers, lang) then attach(buf, lang) end
  end,
})
