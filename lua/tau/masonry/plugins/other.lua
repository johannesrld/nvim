return {
    --Plugins
    { "nvim-lua/plenary.nvim" },
    {"kdheepak/monochrome.nvim"},
    {"WIttyJudge/gruvbox-material.nvim"},
    {
    'AlexvZyl/nordic.nvim',
    lazy = false,
    priority = 1000,
    config = function()
        require 'nordic' .load()
    end
},
    {
        "jiaoshijie/undotree",
        lazy = true,
        event = "VeryLazy",
        opts = {
            float_diff = false,
        },
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = { triggers_nowait = { "<leader>", "<localleader>" } },
    },
    {
        "nvim-telescope/telescope.nvim",
        lazy = true,
        cmd = "Telescope",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function() require("todo-comments").setup { signs = false } end,
        lazy = true,
        event = "VeryLazy",
    },

    -- -- Secure modelines (at the start of files a comment like "#vim: ft=sh", similar to shebangs)
    { "vim-scripts/securemodelines", lazy = false, priority = 1 },
    -- -- LSP/DAP
    { "mfussenegger/nvim-dap",       lazy = true,  event = "VeryLazy" },
    {
        "mhartington/formatter.nvim",
        lazy = true,
        cmd = { "Format", "FormatWrite", "FormatLock", "FormatWriteLock" },
        config = function()
            require("formatter").setup {
                filetype = {
                    html = {
                        require("formatter.filetypes.html").prettierd,
                    },
                    css = {
                        require("formatter.filetypes.css").prettierd,
                    },
                    python = {
                        require("formatter.filetypes.python").black,
                    },
                },
            }
        end,
    },
    --Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
            "RRethy/nvim-treesitter-endwise",
        },
    },
    { "JoosepAlviste/nvim-ts-context-commentstring", lazy = true },
    {
        "echasnovski/mini.comment",
        event = "VeryLazy",
        opts = {
            options = {
                custom_commentstring = function()
                    return require("ts_context_commentstring.internal").calculate_commentstring()
                        or vim.bo.commentstring
                end,
            },
        },
    },
    { "andymass/vim-matchup",                        lazy = true, event = "VeryLazy" },
    {
        "RRethy/nvim-treesitter-textsubjects",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
    },
    { "windwp/nvim-ts-autotag" },
    {
        "nmac427/guess-indent.nvim",
        init = function() require("guess-indent").setup {} end,
    },
    {
        "folke/trouble.nvim",
        opts = {
            icons = false,
            fold_open = "v", -- icon used for open folds
            fold_closed = ">", -- icon used for closed folds
            indent_lines = false, -- add an indent guide below the fold icons
            signs = {
                error = "X",
                warning = "W",
                hint = "H",
                information = "?",
            },
            use_diagnostic_signs = false, -- enabling this will use the signs defined in your lsp client
        },
        lazy = true,
        cmd = "TroubleToggle",
    },
    { "anuvyklack/hydra.nvim" },
    {
        "jose-elias-alvarez/null-ls.nvim",
        init = function()
            local null_ls = require("null-ls")
            null_ls.setup {
                sources = {
                    null_ls.builtins.diagnostics.stylelint,
                    null_ls.builtins.diagnostics.mypy,
                    null_ls.builtins.diagnostics.markdownlint,
                    null_ls.builtins.formatting.dprint,
                    null_ls.builtins.formatting.stylua,
                    null_ls.builtins.diagnostics.markuplint,
                },
            }
        end,
    },
    -- Completion
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
        },
    },

    {
        "L3MON4D3/LuaSnip",
        version = "1.*",
        build = "make install_jsregexp",
    },
    "saadparwaiz1/cmp_luasnip",
    { "windwp/nvim-autopairs",        event = "InsertEnter", opts = {} },

    -- {
    --     "Jezda1337/nvim-html-css",
    --     config = function() require("html-css"):setup() end,
    --     ft = { "html", "css" },
    -- },

    -- Git
    -- Webdev
    {
        "pmizio/typescript-tools.nvim",
        dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
        lazy = true,
        ft = { "typescript", "javascript", "tsx", "jsx" },
        config = function()
            require("typescript-tools").setup {}
            require("lspconfig")["typescript-tools"].launch()
        end,
    },
    {
        "olrtg/nvim-emmet",
        config = function()
            vim.keymap.set(
                { "n", "v" },
                "<leader>lwa",
                require("nvim-emmet").wrap_with_abbreviation
            )
        end,
    },
    --python
    { "mfussenegger/nvim-dap-python", ft = "py" },
    {
        "chrisgrieser/nvim-puppeteer",
        dependencies = "nvim-treesitter/nvim-treesitter",
    },
    --Rust
    { "simrat39/rust-tools.nvim", lazy = true },
    { "Saecki/crates.nvim",       lazy = true },
    -- Haskell
    {
        "mrcjkb/haskell-tools.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function ()
            vim.g.haskell_tools = {
                hls = {
                    auto_attach = true,
                    on_attack = function (client, bufnr, ht)
                        vim.print("Hello Haskell")
                    end
                }
            }
        end,
        version = "2.x.x",
        ft = { "haskell", "lhaskell", "cabal", "cabalproject" },
    },
}
