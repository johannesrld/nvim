local cmp = require("cmp")
local snippet = require("cmp.types").lsp.CompletionItemKind.Snippet
local cmp_ap = require("nvim-autopairs.completion.cmp")
local luasnip = require("luasnip")
local lspkind = require("lspkind")
require("luasnip.loaders.from_vscode").lazy_load()
local cmp_border = vim.tbl_deep_extend("force", cmp.config.window.bordered(), {border = {"\226\148\140", "\226\148\128", "\226\148\144", "\226\148\130", "\226\148\152", "\226\148\128", "\226\148\148", "\226\148\130"}, scrollbar = false})
local function select_incomplete_or_snippet(fallback)
  if cmp.visible() then
    local entry = cmp:get_first_entry()
    local entry_kind = entry.completion_item.kind
    if ((entry ~= nil) and ((entry_kind == snippet) or not entry.exact)) then
      return cmp.confirm({select = true})
    else
      fallback()
      return nil
    end
  else
    fallback()
    return nil
  end
end
local function _3_(fallback)
  if luasnip.jumpable(1) then
    luasnip.jump(1)
    return nil
  else
    fallback()
    return nil
  end
end
local function _5_(args)
  return luasnip.lsp_expand(args.body)
end
local function _6_(entry1, entry2)
  local _, entry1_under = entry1.completion_item.label:find("^_+")
  local _0, entry2_under = entry2.completion_item.label:find("^_+")
  entry1_under = (entry1_under or 0)
  entry2_under = (entry2_under or 0)
  if (entry1_under < entry2_under) then
    return true
  else
    return false
  end
end
local function _8_(_, item)
  item["abbr"] = string.sub(item.abbr, 1, 30)
  item["menu"] = ""
  return item
end
cmp.setup({performance = {debounce = 10, throttle = 20}, mapping = cmp.mapping.preset.insert({["<CR>"] = cmp.mapping.confirm({select = true}), ["<c-CR>"] = cmp.mapping.abort(), ["<c-j>"] = cmp.mapping.select_next_item(), ["<c-k>"] = cmp.mapping.select_prev_item(), ["<Tab>"] = cmp.mapping(_3_, {"i", "s"})}), snippet = {expand = _5_}, sorting = {priority_weight = 1, comparators = {cmp.config.compare.offset, cmp.config.compare.exact, cmp.config.compare.score, _6_, cmp.config.compare.recently_used, cmp.config.compare.order, cmp.config.compare.locality, cmp.config.compare.length}}, sources = cmp.config.sources({{max_item_count = 25, name = "nvim_lsp", priority = 8}, {max_item_count = 10, name = "luasnip", priority = 9}, {max_item_count = 10, name = "html-css", priority = 10}}), view = {entries = {name = "custom", selection_order = "near_cursor"}}, formatting = {fields = {"abbr", "kind"}, format = lspkind.cmp_format({mode = "symbol", maxwidth = 30, symbol_map = {Function = "\206\187", Method = "\198\155", Constructor = "\198\155", Field = "\226\136\136", Property = "\226\136\136", Variable = "\206\177", Snippet = "\226\141\137", Class = "C", Interface = "I", Module = "M", Enum = "E", Keyword = "K", Color = " ", File = " ", Reference = "*", Folder = " ", EnumMember = "E", Constant = "\206\177", Struct = "S", Event = " ", Operator = " ", Text = " "}, before = _8_})}, window = {completion = cmp_border, documentation = cmp_border}})
cmp.setup.filetype("gitcommit", {sources = cmp.config.sources({{name = "git"}}, {{name = "buffer"}})})
cmp.setup.cmdline({"/", "?"}, {mapping = cmp.mapping.preset.cmdline(), sources = {{name = "buffer"}}})
cmp.setup.cmdline(":", {mapping = cmp.mapping.preset.cmdline(), sources = cmp.config.sources({{name = "async_path"}}, {{name = "cmdline"}})})
local border = {{"\226\148\140", "FloatBorder"}, {"\226\148\128", "FloatBorder"}, {"\226\148\144", "FloatBorder"}, {"\226\148\130", "FloatBorder"}, {"\226\148\152", "FloatBorder"}, {"\226\148\128", "FloatBorder"}, {"\226\148\148", "FloatBorder"}, {"\226\148\130", "FloatBorder"}}
cmp.event:on("confirm_done", cmp_ap.on_confirm_done({filetypes = {css = false, lisp = false}}))
local __open_floating_preview = vim.lsp.util.open_floating_preview
vim.lsp.util.open_floating_preview = function(contents, syntax, opts, ...)
  local opts0 = (opts or {})
  opts0.border = (opts0.border or border)
  return __open_floating_preview(contents, syntax, opts0, ...)
end
return vim.lsp.util.open_floating_preview