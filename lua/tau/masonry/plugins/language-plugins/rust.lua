return {
    {
        "simrat39/rust-tools.nvim",
        lazy = true,
        ft = { "rust" },
        config = function ()
            local rt = require "rust-tools"
            rt.setup {}
        end
    }
}
