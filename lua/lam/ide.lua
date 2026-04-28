vim.pack.add({
    'https://github.com/williamboman/mason.nvim',
    { src = 'https://github.com/neovim/nvim-lspconfig' },
    { src = 'https://github.com/saghen/blink.cmp',     version = 'v1.10.2' },
})


-- local function isIDSelector(node)
--     if not node then return false end
--     return node:type() == "id_name"
-- end
--
-- local function isClassSelectorName(name)
--     if name == "class_name" or name == "class_selector" then
--         return true
--     end
--     return false
-- end
--
-- local function isClassSelector(node)
--     if not node then return false end
--     local node_type = node:type()
--     if isClassSelectorName(node_type) then
--         return true
--     end
--     if node_type == "identifier" or node_type == "escape_sequence" then
--         local parent = node:parent()
--         if not parent then return false end
--         local parent_type = parent:type()
--         if isClassSelectorName(parent_type) then
--             return true
--         end
--     end
--     return false
-- end
--
--
-- local function unfuckCSSAutoCompleteDisplay()
--     local cursor = vim.api.nvim_win_get_cursor(0)
--     local row = cursor[1]
--     local col = cursor[2]
--     if col <= 0 then return true end
--     local char = vim.api.nvim_buf_get_text(0, row - 1, col - 1, row - 1, col, {})[1]
--     local char2 = vim.api.nvim_buf_get_text(0, row - 1, math.max(col - 2, 0), row - 1, math.max(col - 1, 0), {})[1]
--     if char == "#" or char == "." or char == "}" then return false end
--     if char2 == "#" or char2 == "." or char2 == "}" then return false end
--
--     -- Aggressive Tree sitter nonsense
--     local node = vim.treesitter.get_node()
--     local node_left = vim.treesitter.get_node({ pos = { row - 1, col - 1 } })
--     if isClassSelector(node) or isClassSelector(node_left) then return false end
--     if isIDSelector(node) or isIDSelector(node_left) then return false end
--     return true
-- end
--
-- local VARIABLE = 6
-- local VALUE = 12
-- local ENUM = 13
-- local KEYWORD = 14
-- local FUNCTION = 3
--
-- local function is_deprecated(item)
--     return (item.deprecated or vim.list_contains(item.tags or {}, 1))
-- end
--
-- local function unfuckCSSAutoCompleteItems(_, i)
--     local filtered = {}
--     for _, item in ipairs(i) do
--         local deprecated = item.deprecated or (item.tags and vim.tbl_contains(item.tags, 1))
--         if item.client_name == 'emmet_language_server' or deprecated then
--             goto cont
--         end
--         local label = item.label:lower()
--         if item.client_id then
--             local client = vim.lsp.get_client_by_id(item.client_id)
--             if client then item.source_name = client.name end
--         end
--         local prefixed = label:match("^%-") or label:match("^::?-")
--         if prefixed then
--             goto cont
--         end
--
--         if label:match('^initial$') or label:match('^inherit$') or
--             label:match('^unset$') or label:match('^revert') or
--             label:match('^var%(') then
--             item.score_offset = -1000
--         elseif item.kind == VALUE or item.kind == ENUM then
--             item.score_offset = 16
--         elseif item.kind == KEYWORD then
--             item.score_offset = 13
--         elseif item.kind == FUNCTION then
--             item.score_offset = 12
--         elseif item.kind == VARIABLE then
--             item.score_offset = 4
--         end
--         if label:match('^::') or label:match('^:') then
--             item.score_offset = item.score_offset - 6
--         end
--         table.insert(filtered, item)
--         ::cont::
--     end
--     return filtered
-- end
--
-- local function emmetNonsense()
--     local node = vim.treesitter.get_node()
--     if not node then return true end
--
--     local cur = node
--     local max_depth = 4
--     local current_depth = 0
--     local in_valid_scope = false
--
--     while cur and current_depth < max_depth do
--         local type = cur:type()
--         if type == "declaration" then return false end
--         if type == "block" or type == "rule_set" then
--             in_valid_scope = true
--         end
--         cur = cur:parent()
--         current_depth = current_depth + 1
--     end
--     if in_valid_scope then
--         local line = vim.api.nvim_get_current_line()
--         local col = vim.api.nvim_win_get_cursor(0)[2]
--         local before_cursor = line:sub(1, col)
--
--         if before_cursor:find(":[^%s]*%s+") then
--             return false
--         end
--     end
--
--     return in_valid_scope
-- end
--
require('blink.cmp').setup({
    completion = {
        accept = {
            auto_brackets = {
                blocked_filetypes = {
                    'css'
                }
            }
        },
        menu = {
            draw = {
                columns = {
                    { "kind_icon", "label",      gap = 1 },
                    { "kind",      "source_name" }
                },
            }
        }
    },
    sources = {
        -- per_filetype = { css = { 'snippets', 'lsp_css', 'emmet', } },
        -- providers = {
        --     snippets = {
        --         opts = {
        --             friendly_snippets = true,
        --         }
        --     },
        --     lsp = {
        --         name = 'lsp',
        --         module = 'blink.cmp.sources.lsp',
        --         transform_items = function(_, items)
        --             return vim.tbl_filter(function(item)
        --                 return not item.deprecated
        --             end, items)
        --         end
        --     },
        --     lsp_css = {
        --         name = 'LSP',
        --         module = 'blink.cmp.sources.lsp',
        --         enabled = unfuckCSSAutoCompleteDisplay,
        --         transform_items = unfuckCSSAutoCompleteItems
        --     },
        --     emmet = {
        --         name = 'emmet',
        --         module = 'blink.cmp.sources.lsp',
        --         enabled = emmetNonsense,
        --         transform_items = function(_, items)
        --             return vim.tbl_filter(function(item)
        --                 return item.client_name == 'emmet_language_server' or is_deprecated(item)
        --             end, items)
        --         end,
        --     }
        -- }
    },
    keymap = {
        ['<CR>'] = { 'accept', 'fallback' },
        ['<c-CR>'] = { 'cancel', 'fallback' },
        ['<c-j>'] = { 'select_next', 'fallback' },
        ['<c-k>'] = { 'select_prev', 'fallback' },
    },
    fuzzy = { implementation = 'prefer_rust_with_warning' },
    signature = { enabled = true },
})
--
require('mason').setup()
--
vim.api.nvim_create_autocmd('LspProgress', {
    callback = function(ev)
        local value = ev.data.params.value
        vim.api.nvim_echo({ { value.message or 'done' } }, false, {
            id = 'lsp.' .. ev.data.client_id,
            kind = 'progress',
            source = 'vim.lsp',
            title = value.title,
            status = value.kind ~= 'end' and 'running' or 'success',
            percent = value.percentage,
        })
    end,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('blink.cmp').get_lsp_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

vim.lsp.config('*', { capabilities = capabilities })

local installedPacks = require('mason-registry').get_installed_packages()
vim.lsp.enable(vim.iter(installedPacks):fold({}, function(acc, pack)
    table.insert(acc, pack.spec.neovim and pack.spec.neovim.lspconfig)
    return acc
end))
