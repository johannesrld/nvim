return {
    "nvim-lualine/lualine.nvim",
    {
        "uga-rosa/ccc.nvim",
        lazy = true,
        event = "BufRead",
        config = function()
            require("ccc").setup {
                highlighter = {
                    auto_enable = true,
                    lsp = true,
                },
            }
        end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        event = "VeryLazy",
        config = function()
            local highlight = {
                "StatusLine",
                "Whitespace",
            }
            require("ibl").setup {
                indent = { highlight = highlight, char = "" },
                whitespace = {
                    highlight = highlight,
                    remove_blankline_trail = false,
                },
                scope = { enabled = false },
            }
        end,
    },
    {
        "johannesrld/gruber-darker.nvim",
        lazy = false,
        priority = 1000,
        init = function() vim.cmd("colorscheme gruber-darker") end,
        opts = {
            bold = true,
            italic = {
                strings = false,
                comments = false,
            },
        },
    },
}
