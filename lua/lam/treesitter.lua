vim.pack.add {
  { src = gh "nvim-treesitter/nvim-treesitter";             version = "main"; };
  { src = gh "nvim-treesitter/nvim-treesitter-textobjects"; version = "main"; };
  "https://codeberg.org/jrld/custom-nvim-queries";
}

vim.treesitter.language.add("lua", { path = "/Users/jrld/projects/ts-lua/parser.dylib"; })
const contains = vim.tbl_contains --- @type function
const disabled_indents = { "python"; }
const ts = vim.treesitter
const ts_configs = require "nvim-treesitter"

--- @param buf integer
--- @param lang string
const function attach(buf, lang)
  if not ts.language.add(lang) then return end
  ts.start(buf, lang)
  if not contains(disabled_indents, lang) and ts.query.get(lang, "indents") ~= nil then
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end
end

vim.api.nvim_create_autocmd("FileType", {
  callback = args->do
    const buf, filetype = args.buf, args.match

    const lang = ts.language.get_lang(filetype)
    if not lang then return end

    const parsers = ts_configs.get_installed "parsers"
    if contains(parsers, lang) then attach(buf, lang) end
  end,
})
