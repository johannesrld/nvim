return {
  "rktjmp/hotpot.nvim",
  -- I *think* this fits better in init than config as we always want to run it.
  init = function()
    -- note we must require hotpot itself to trigger its self-compile bootstrap.
    -- calling require("hotpot.api.make") wont work yet as the files dont exist.
    local hotpot = require("hotpot")
    hotpot.setup({
      provide_require_fennel = true,
      macros = {
        env = "_COMPILER"
      }
    })
    -- hotpot lazy-proxies submodules anyway so we can grab make off it...
    local make = hotpot.api.make
    -- path we want to search for plugin-configs
    make.build(vim.fn.stdpath("config"),
      { verbose = false, atomic = false },
      {{"fnl/tau/plugins/**/*.fnl", true}})
  end
}
