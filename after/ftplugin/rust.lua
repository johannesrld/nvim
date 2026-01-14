local bufnr = vim.api.nvim_get_current_buf()
local function rustacean(o)
  return function ()
    vim.cmd.RustLsp(o)
  end
end
nmap(Leader('la'), rustacean 'codeAction', {buffer = bufnr})
nmap("K", rustacean {'hover', 'actions'}, {buffer = bufnr})
