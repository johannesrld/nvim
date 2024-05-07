local cmp = require 'cmp'
local snippet = require 'cmp.types'.lsp.CompletionItemKind.Snippet
local luasnip = require 'luasnip'
require('luasnip.loaders.from_vscode').lazy_load()
local cmp_border = vim.tbl_deep_extend('force', cmp.config.window.bordered(), {
  border = { '┌', '─', '┐', '│', '┘', '─', '└', '│' },
  scrollbar = false,
})
cmp.setup {
  window = { completion = cmp_border, documentation = cmp_border },
  view = { entries = { name = 'custom', selection_order = 'near_cursor' } },
  snippet = { expand = function(args) luasnip.lsp_expand(args.body) end },
  mapping = cmp.mapping.preset.insert {
    ['<c-j>'] = cmp.mapping.select_next_item(),
    ['<c-k>'] = cmp.mapping.select_prev_item(),
    ['<c-CR>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping({
      i = function(fallback)
        if not cmp.visible() then
          fallback()
          return
        end
        local entry = cmp:get_first_entry()
        if entry ~= nil and entry.completion_item.kind ~= snippet and entry.exact then
          cmp.close()
          fallback()
          return
        end
        cmp.confirm({ select = true })
      end
    }),
  },
  sources = cmp.config.sources({
    { name = 'luasnip',  max_item_count = 4 },
    { name = 'nvlime', max_item_count = 50 },
    -- { name = 'conjure',   max_item_count = 4 },
    { name = 'nvim_lsp', max_item_count = 10 },
    { name = 'html-css', max_item_count = 4 },
    { name = 'function', max_item_count = 4 },
    { name = 'buffer',   max_item_count = 0 },
  }),
  sorting = {
    comparators = {
      cmp.config.compare.exact,
      cmp.config.compare.score,
      cmp.config.compare.offset,
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
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({ { name = 'git' } }, { { name = 'buffer' } }),
})

cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = { { name = 'buffer' } },
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({ { name = 'path' } }, { { name = 'cmdline' } })
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

vim.api.nvim_create_autocmd('InsertEnter', {
  group = vim.api.nvim_create_augroup('Autopair_cmp', {}),
  callback = function(_)
    local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
    cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done {
      filetypes = { lisp = false }
    })
  end,
  once = true,
})
