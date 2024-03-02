local cmp = require 'cmp'
local luasnips = require 'luasnip'
require('luasnip.loaders.from_vscode').lazy_load()
local cmp_border = vim.tbl_deep_extend('force', cmp.config.window.bordered(), {
  border = { '┌', '─', '┐', '│', '┘', '─', '└', '│' },
  scrollbar = false,
})
cmp.setup {
  window = { completion = cmp_border, documentation = cmp_border },
  view = { entries = { name = 'custom', selection_order = 'near_cursor' } },
  snippet = { expand = function(args) luasnips.lsp_expand(args.body) end },
  mapping = cmp.mapping.preset.insert {
    ['<c-j>'] = cmp.mapping.select_next_item(),
    ['<c-k>'] = cmp.mapping.select_prev_item(),
    ['<c-Space>'] = cmp.mapping.complete(),
    ['<c-e>'] = cmp.mapping.abort(),
    ['<cr>'] = cmp.mapping.confirm { select = true },
  },
  sources = cmp.config.sources({
    { name = 'luasnip',  max_item_count = 4 },
    { name = 'html-css', max_item_count = 4 },
    { name = 'nvim_lsp', max_item_count = 4, entry_filter = function(entry)
      return cmp.lsp.CompletionItemKind.Snippet ~= entry:get_kind()
    end },
    { name = 'function', max_item_count = 4 },
    -- { name = 'buffer' },
    -- { name = 'conjure' },
  }, { { name = 'buffer' } }),
  sorting = {
    comparators = {
      cmp.config.compare.exact,
      cmp.config.compare.offset,
      cmp.config.compare.score,

      function(entry1, entry2)
        local _, entry1_under = entry1.completion_item.label:find '^_+'
        local _, entry2_under = entry2.completion_item.label:find '^_+'
        entry1_under = entry1_under or 0
        entry2_under = entry2_under or 0
        if entry1_under > entry2_under then
          return false
        elseif entry1_under < entry2_under then
          return true
        end
      end,
      -- cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },
  experimental = { ghost_test = true },
}
vim.api.nvim_create_autocmd('InsertEnter', {
  group = vim.api.nvim_create_augroup('Autopair_cmp', {}),
  callback = function(_)
    local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
    cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
  end,
  once = true,
})
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'git' },
  }, {
    { name = 'buffer' },
  }),
})

cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = { { name = 'buffer' } },
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' },
  }, {
    { name = 'cmdline' },
  }),
})
local lsp_border = {
  { '┌', 'FloatBorder' },
  { '─', 'FloatBorder' },
  { '┐', 'FloatBorder' },
  { '│', 'FloatBorder' },
  { '┘', 'FloatBorder' },
  { '─', 'FloatBorder' },
  { '└', 'FloatBorder' },
  { '│', 'FloatBorder' },
}
local __open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or lsp_border
  return __open_floating_preview(contents, syntax, opts, ...)
end
