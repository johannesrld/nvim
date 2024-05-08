(fn autocmd [event callback] (vim.api.nvim_create_autocmd event {:callback callback}))

{ :autocmd autocmd}
