vim.pack.add({
    'https://github.com/nvim-mini/mini.ai',
    'https://github.com/nvim-mini/mini.bracketed',
    'https://github.com/nvim-mini/mini.surround',
    'https://github.com/nvim-mini/mini.bufremove',
    'https://github.com/nvim-mini/mini.tabline',
    'https://github.com/nvim-mini/mini.clue',
    'https://github.com/stevearc/oil.nvim',
})
require('mini.bufremove').setup()

local miniclue = require("mini.clue")
miniclue.setup({
    triggers = {
        { mode = { 'n', 'x' }, keys = '<Leader>' },
        { mode = 'n',          keys = '[' },
        { mode = 'n',          keys = ']' },
        { mode = 'i',          keys = '<C-x>' },
        { mode = { 'n', 'x' }, keys = 'g' },
        { mode = { 'n', 'x' }, keys = "'" },
        { mode = { 'n', 'x' }, keys = '`' },
        { mode = { 'n', 'x' }, keys = '"' },
        { mode = { 'i', 'c' }, keys = '<C-r>' },
        { mode = 'n',          keys = '<C-w>' },
        { mode = 'v',          keys = 'a' },
        { mode = { 'n', 'x' }, keys = 'z' },
    },
    clues = {
        miniclue.gen_clues.square_brackets(),
        miniclue.gen_clues.builtin_completion(),
        miniclue.gen_clues.g(),
        miniclue.gen_clues.marks(),
        miniclue.gen_clues.registers(),
        miniclue.gen_clues.windows(),
        miniclue.gen_clues.z(),
    },
    window = {
        delay = 1
    }
})

require('mini.tabline').setup({ use_icons = false })

vim.defer_fn(function()
    require('mini.ai').setup()
    require('mini.bracketed').setup()
    require('mini.surround').setup()
end, 0)

require('oil').setup({
    columns = {
        'permissions',
    },
    view_options = {
        show_hidden = true,
        is_always_hidden = function(n, _) return n == '.git' end,
    },
    win_options = {
        signcolumn = 'no',
        foldcolumn = '0',
        colorcolumn = '',
        spell = false,
    },
    delete_to_trash = true,
    use_default_keymaps = false,
    keymaps = {
        ['<CR>'] = 'actions.select',
        ['P'] = { 'actions.preview', mode = 'n', opts = { horizontal = true } },
        ['q'] = { 'actions.close', mode = 'n' },
        ['r'] = 'actions.refresh',
        ['-'] = { 'actions.parent', mode = 'n' },
        ['_'] = { 'actions.open_cwd', mode = 'n' },
        ['`'] = { 'actions.cd', mode = 'n' },
        ['gs'] = { 'actions.change_sort', mode = 'n' },
        ['gx'] = 'actions.open_external',
        ['g.'] = { 'actions.toggle_hidden', mode = 'n' },
    },
})
