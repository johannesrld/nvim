return {
  {
    'monkoose/nvlime',
    dependencies = { 'monkoose/parsley' },
    config = function()
      -- fucking UGLY AS SHIT!
      vim.cmd [[
      let g:nvlime_cl_impl = "ros"
      function! NvlimeBuildServerCommandFor_ros(nvlime_loader, nvlime_eval)
        return ["ros", "run", "--load", a:nvlime_loader, "--eval", a:nvlime_eval]
      endfunction
      ]]
      vim.g.nvlime_config = {
        address = {
          host = '127.0.0.1',
          port = 7002
        },
        main_window = { position = 'bottom' },
        implementation = 'ros',
        cmp = { enabled = true }
      }
    end
  }
}
