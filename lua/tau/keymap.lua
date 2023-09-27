local set = vim.keymap.set
local hydra = require("hydra")
local wk = require("which-key")

local opts = { silent = true, noremap = true }
local mode = "force"
local optMap = vim.tbl_extend

set(
  "n",
  "<leader>x",
  function()
    require("trouble").toggle()
  end,
  optMap(mode, opts, { desc = "View Probelms" })
)

set(
  "n",
  "<leader>z",
  function ()
    require("zen-mode").toggle()
  end,
  optMap(mode, opts, { desc = "Zen Mode" })
)

set(
  "n",
  "<leader>m",
  function() require("undotree").toggle() end,
  optMap(mode, opts, { desc = "Toggle Undo Tree" })
)

wk.register {
  ["<leader>f"] = {
    name = "+formatting",
  },
}

set(
  "n",
  "<leader>fw",
  "<cmd>FormatWrite<cr>",
  optMap(mode, opts, { desc = "Format & write file" })
)

set(
  "n",
  "<leader>g",
  function() require("neogit").open {} end,
  optMap(mode, opts, { desc = "Open Neogit" })
)

local function slew_hydra() print("Hercules slew the Hydra.") end
hydra {
  name = "Window resizing",
  mode = "n",
  body = "<C-W>",
  heads = {
    { "+", "<C-W>+", { timeout = false } },
    { "-", "<C-W>-", { timeout = false } },
    { ">", "<C-W>>", { timeout = false } },
    { "<", "<C-W><", { timeout = false } },
    { "=", "<C-W>=", { exit = true, timeout = false } },
  },
  config = {
    hint = false,
    on_enter = function() vim.bo.modifiable = false end,
    on_exit = slew_hydra,
  },
}
hydra {
  name = "Swap params",
  mode = "n",
  body = "<leader>",
  heads = {
    {
      "a",
      "<cmd>TSTextobjectSwapNext @parameter.inner<cr>",
      { desc = "Swap to next param" },
    },
    {
      "A",
      "<cmd>TSTextobjectSwapPrevious @parameter.inner<cr>",
      { desc = "Swap to previous param" },
    },
  },
  config = {
    hint = false,
    on_exit = slew_hydra,
  },
}
local builtin = function() return require("telescope.builtin") end
wk.register {
  ["<leader>t"] = {
    name = "+Telescope",
  },
}
set("n", "<leader>tf", builtin().fd)
set("n", "<leader>tg", builtin().live_grep)
set("n", "<leader>tb", builtin().buffers)
set("n", "<leader>th", builtin().help_tags)
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    local dap = require("dap")
    function FormatBuilder()
      local client = vim.lsp.get_active_clients({ bufnr = 0 })[1]
      if client and client.supports_method("textDocument/formatting") then
        return function()
          vim.lsp.buf.format()
          print("Formatter: LSP")
        end
      else
        return function()
          vim.cmd("Format")
          print("Formatter: Other")
        end
      end
    end

    local Format = FormatBuilder()
    wk.register {
      ["<leader>l"] = {
        name = "+lsp",
      },
    }
    local lspopts = { buffer = ev.buf, silent = true, noremap = true }
    set(
      "n",
      "<leader>lD",
      vim.lsp.buf.declaration,
      optMap(mode, lspopts, { desc = "Jump to symbol declaration" })
    )
    set(
      "n",
      "<leader>lh",
      vim.lsp.buf.hover,
      optMap(mode, lspopts, { desc = "Hover Info" })
    )
    set(
      "n",
      "<leader>ls",
      vim.lsp.buf.signature_help,
      optMap(mode, lspopts, { desc = "Symbol Signature" })
    )
    set(
      "n",
      "<leader>lt",
      vim.lsp.buf.type_definition,
      optMap(mode, lspopts, { desc = "Jump to type definition" })
    )
    set(
      "n",
      "<leader>lr",
      vim.lsp.buf.rename,
      optMap(mode, lspopts, { desc = "Rename Symbol" })
    )
    set(
      { "n", "v" },
      "<space>la",
      vim.lsp.buf.code_action,
      optMap(mode, lspopts, { desc = "Code Action" })
    )
    set("n", "<F5>", dap.continue, { desc = "DAP: Continue" })
    set("n", "<F7>", dap.step_into, { desc = "DAP: Step Into" })
    set("n", "<F8>", dap.step_over, { desc = "DAP: Step Over" })
    set("n", "<F9>", dap.step_out, { desc = "DAP: Step Out" })
    set("n", "<F12>", dap.close, { desc = "DAP: Close" })
    set("n", "<leader>b", dap.toggle_breakpoint, { desc = "DAP: Toggle Breakpoint" })
    set("n", "<leader>ff", Format, optMap(mode, opts, { desc = "Format file" }))
  end,
})


times in msec
 clock   self+sourced   self:  sourced script
 clock   elapsed:              other lines

000.019  000.019: --- NVIM STARTING ---
000.195  000.176: event init
000.314  000.119: early init
000.628  000.314: locale set
000.705  000.077: init first window
001.241  000.536: inits 1
001.276  000.035: window checked
001.284  000.009: parsing arguments
002.204  000.181  000.181: require('vim.shared')
002.615  000.161  000.161: require('vim._meta')
002.626  000.405  000.244: require('vim._editor')
002.632  000.658  000.072: require('vim._init_packages')
002.638  000.695: init lua interpreter
002.866  000.228: expanding arguments
002.945  000.079: inits 2
003.434  000.490: init highlight
003.438  000.003: waiting for UI
003.625  000.188: done waiting for UI
003.632  000.007: clear screen
003.937  000.305: init default mappings & autocommands
004.913  000.167  000.167: sourcing /home/jrld/.local/bin/nvim-linux64/share/nvim/runtime/ftplugin.vim
005.763  000.788  000.788: sourcing /home/jrld/.local/bin/nvim-linux64/share/nvim/runtime/indent.vim
006.339  000.105  000.105: require('vim.loader')
006.545  000.044  000.044: require('vim.fs')
019.631  013.227  013.183: require('tau.options')
026.624  003.067  003.067: require('lazy')
026.753  000.036  000.036: require('ffi')
027.023  000.261  000.261: require('lazy.stats')
027.438  000.377  000.377: require('lazy.core.util')
027.684  000.240  000.240: require('lazy.core.config')
028.120  000.092  000.092: require('lazy.core.handler')
028.249  000.124  000.124: require('lazy.core.plugin')
028.260  000.570  000.355: require('lazy.core.loader')
033.300  000.154  000.154: require('lazy.core.handler.cmd')
033.517  000.205  000.205: require('lazy.core.handler.event')
033.655  000.131  000.131: require('lazy.core.handler.ft')
033.865  000.204  000.204: require('lazy.core.handler.keys')
035.372  000.539  000.539: sourcing /home/jrld/.local/bin/nvim-linux64/share/nvim/runtime/filetype.lua
037.407  000.522  000.522: require('guess-indent.utils')
037.543  000.128  000.128: require('guess-indent.config')
037.549  002.140  001.491: require('guess-indent')
040.900  000.287  000.287: require('null-ls.utils')
042.035  000.009  000.009: require('vim.F')
042.139  001.216  001.207: require('vim.diagnostic')
042.216  002.162  000.659: require('null-ls.config')
042.591  000.266  000.266: require('null-ls.helpers.cache')
042.787  000.191  000.191: require('null-ls.helpers.diagnostics')
042.996  000.205  000.205: require('null-ls.helpers.formatter_factory')
043.341  000.148  000.148: require('null-ls.logger')
043.458  000.113  000.113: require('null-ls.state')
043.463  000.462  000.201: require('null-ls.helpers.generator_factory')
043.608  000.071  000.071: require('null-ls.helpers.command_resolver')
043.612  000.147  000.076: require('null-ls.helpers.make_builtin')
043.827  000.213  000.213: require('null-ls.helpers.range_formatting_args_factory')
043.831  001.612  000.128: require('null-ls.helpers')
044.529  000.254  000.254: require('null-ls.methods')
044.544  000.477  000.222: require('null-ls.diagnostics')
044.555  000.722  000.245: require('null-ls.sources')
044.656  000.096  000.096: require('null-ls.builtins')
044.660  006.875  002.284: require('null-ls')
044.909  000.246  000.246: require('null-ls.builtins.diagnostics.stylelint')
045.086  000.171  000.171: require('null-ls.builtins.diagnostics.mypy')
045.279  000.188  000.188: require('null-ls.builtins.diagnostics.markdownlint')
045.417  000.134  000.134: require('null-ls.builtins.formatting.dprint')
048.427  000.193  000.193: require('vim.lsp.log')
049.015  000.573  000.573: require('vim.lsp.protocol')
049.944  000.440  000.440: require('vim.lsp._snippet')
050.286  000.318  000.318: require('vim.highlight')
050.316  001.292  000.534: require('vim.lsp.util')
050.341  002.532  000.473: require('vim.lsp.handlers')
050.517  000.173  000.173: require('vim.lsp.rpc')
050.586  000.065  000.065: require('vim.lsp.sync')
050.789  000.200  000.200: require('vim.lsp.semantic_tokens')
050.956  000.162  000.162: require('vim.lsp.buf')
051.043  000.084  000.084: require('vim.lsp.diagnostic')
051.440  000.165  000.165: require('vim.lsp.codelens')
051.584  005.458  002.078: require('vim.lsp')
051.595  005.627  000.169: require('null-ls.client')
057.016  000.169  000.169: require('gruber-darker.config')
057.029  001.611  001.442: require('gruber-darker')
057.965  000.116  000.116: require('gruber-darker.highlight')
058.121  000.070  000.070: require('gruber-darker.color')
058.180  000.208  000.138: require('gruber-darker.palette')
058.232  000.595  000.271: require('gruber-darker.highlights.colorscheme')
058.710  000.379  000.379: require('gruber-darker.highlights.vim')
058.730  000.496  000.116: require('gruber-darker.highlights.lsp')
058.896  000.164  000.164: require('gruber-darker.highlights.terminal')
059.180  000.279  000.279: require('gruber-darker.highlights.treesitter')
059.411  000.227  000.227: require('gruber-darker.highlights.cmp')
059.839  000.421  000.421: require('gruber-darker.highlights.telescope')
059.849  002.304  000.122: require('gruber-darker.highlights')
062.403  004.949  002.645: sourcing /home/jrld/.local/share/nvim/lazy/gruber-darker.nvim/colors/gruber-darker.lua
068.998  003.619  003.619: require('cmp.utils.api')
070.722  000.351  000.351: require('cmp.types.cmp')
072.319  000.280  000.280: require('cmp.utils.misc')
072.381  001.634  001.354: require('cmp.types.lsp')
072.543  000.160  000.160: require('cmp.types.vim')
072.548  003.523  001.378: require('cmp.types')
072.687  000.135  000.135: require('cmp.utils.highlight')
072.843  000.064  000.064: require('cmp.utils.debug')
072.860  000.169  000.105: require('cmp.utils.autocmd')
073.511  009.191  001.745: sourcing /home/jrld/.local/share/nvim/lazy/nvim-cmp/plugin/cmp.lua
077.904  000.059  000.059: require('vim.treesitter.language')
077.924  000.171  000.113: require('vim.treesitter.query')
077.985  000.058  000.058: require('vim.treesitter._range')
077.995  000.335  000.106: require('vim.treesitter.languagetree')
078.002  000.619  000.285: require('vim.treesitter')
078.006  000.682  000.063: require('nvim-treesitter.compat')
079.292  001.024  001.024: require('nvim-treesitter.parsers')
079.431  000.132  000.132: require('nvim-treesitter.utils')
079.443  001.369  000.213: require('nvim-treesitter.ts_utils')
079.451  001.443  000.075: require('nvim-treesitter.tsrange')
079.529  000.075  000.075: require('nvim-treesitter.caching')
079.552  002.342  000.142: require('nvim-treesitter.query')
079.575  003.303  000.961: require('nvim-treesitter.configs')
079.579  004.082  000.778: require('nvim-treesitter-textobjects')
079.978  000.133  000.133: require('nvim-treesitter.info')
080.141  000.159  000.159: require('nvim-treesitter.shell_command_selectors')
080.225  000.536  000.244: require('nvim-treesitter.install')
080.331  000.104  000.104: require('nvim-treesitter.statusline')
080.504  000.170  000.170: require('nvim-treesitter.query_predicates')
080.510  000.899  000.090: require('nvim-treesitter')
080.851  000.194  000.194: require('nvim-treesitter.textobjects.shared')
080.867  000.335  000.141: require('nvim-treesitter.textobjects.select')
081.203  000.142  000.142: require('nvim-treesitter.textobjects.attach')
081.370  000.163  000.163: require('nvim-treesitter.textobjects.repeatable_move')
081.405  000.485  000.180: require('nvim-treesitter.textobjects.move')
082.221  000.236  000.236: require('nvim-treesitter.textobjects.swap')
082.552  000.232  000.232: require('nvim-treesitter.textobjects.lsp_interop')
082.601  007.145  000.876: sourcing /home/jrld/.local/share/nvim/lazy/nvim-treesitter-textobjects/plugin/nvim-treesitter-textobjects.vim
083.882  000.768  000.768: require('nvim-treesitter-endwise')
083.894  000.884  000.116: sourcing /home/jrld/.local/share/nvim/lazy/nvim-treesitter-endwise/plugin/nvim-treesitter-endwise.lua
086.998  001.882  001.882: sourcing /home/jrld/.local/share/nvim/lazy/nvim-treesitter/plugin/nvim-treesitter.lua
089.297  000.352  000.352: sourcing /home/jrld/.local/share/nvim/lazy/nvim-puppeteer/plugin/puppeteer-autocmds.lua
091.643  000.265  000.265: require('luasnip.util.types')
091.792  000.117  000.117: require('luasnip.util.ext_opts')
092.706  000.483  000.483: require('luasnip.session')
092.758  000.773  000.290: require('luasnip.util.util')
092.787  000.991  000.219: require('luasnip.extras.filetype_functions')
093.430  003.169  001.795: require('luasnip.config')
093.565  003.497  000.328: sourcing /home/jrld/.local/share/nvim/lazy/LuaSnip/plugin/luasnip.vim
093.866  000.026  000.026: sourcing /home/jrld/.local/share/nvim/lazy/LuaSnip/ftdetect/snippets.vim
096.749  002.382  002.382: require('nvim-treesitter-textsubjects')
096.927  002.594  000.212: sourcing /home/jrld/.local/share/nvim/lazy/nvim-treesitter-textsubjects/plugin/nvim-treesitter-textsubjects.vim
099.490  000.535  000.535: sourcing /home/jrld/.local/share/nvim/lazy/hydra.nvim/plugin/hydra.lua
100.830  000.192  000.192: sourcing /home/jrld/.local/share/nvim/lazy/securemodelines/plugin/securemodelines.vim
103.365  000.178  000.178: sourcing /home/jrld/.local/bin/nvim-linux64/share/nvim/runtime/plugin/editorconfig.lua
103.635  000.189  000.189: sourcing /home/jrld/.local/bin/nvim-linux64/share/nvim/runtime/plugin/health.vim
104.028  000.286  000.286: sourcing /home/jrld/.local/bin/nvim-linux64/share/nvim/runtime/plugin/man.lua
104.895  000.752  000.752: sourcing /home/jrld/.local/bin/nvim-linux64/share/nvim/runtime/plugin/netrwPlugin.vim
105.111  000.111  000.111: sourcing /home/jrld/.local/bin/nvim-linux64/share/nvim/runtime/plugin/nvim.lua
105.373  000.207  000.207: sourcing /home/jrld/.local/bin/nvim-linux64/share/nvim/runtime/plugin/rplugin.vim
105.609  000.182  000.182: sourcing /home/jrld/.local/bin/nvim-linux64/share/nvim/runtime/plugin/shada.vim
105.711  000.036  000.036: sourcing /home/jrld/.local/bin/nvim-linux64/share/nvim/runtime/plugin/spellfile.vim
106.773  000.100  000.100: require('cmp.utils.char')
106.786  000.326  000.226: require('cmp.utils.str')
107.007  000.053  000.053: require('cmp.utils.buffer')
107.017  000.149  000.096: require('cmp.utils.keymap')
107.024  000.235  000.087: require('cmp.utils.feedkeys')
107.239  000.071  000.071: require('cmp.config.mapping')
107.292  000.050  000.050: require('cmp.utils.cache')
107.427  000.071  000.071: require('cmp.config.compare')
107.430  000.135  000.064: require('cmp.config.default')
107.450  000.348  000.092: require('cmp.config')
107.477  000.452  000.103: require('cmp.utils.async')
107.592  000.048  000.048: require('cmp.utils.pattern')
107.597  000.117  000.069: require('cmp.context')
107.891  000.056  000.056: require('cmp.matcher')
107.904  000.171  000.115: require('cmp.entry')
107.915  000.317  000.146: require('cmp.source')
108.037  000.049  000.049: require('cmp.utils.event')
108.211  000.047  000.047: require('cmp.utils.options')
108.218  000.118  000.071: require('cmp.utils.window')
108.221  000.181  000.063: require('cmp.view.docs_view')
108.314  000.091  000.091: require('cmp.view.custom_entries_view')
108.392  000.076  000.076: require('cmp.view.wildmenu_entries_view')
108.530  000.135  000.135: require('cmp.view.native_entries_view')
108.667  000.134  000.134: require('cmp.view.ghost_text_view')
108.678  000.761  000.096: require('cmp.view')
109.499  003.162  000.954: require('cmp.core')
109.787  000.114  000.114: require('cmp.config.sources')
109.895  000.102  000.102: require('cmp.config.window')
109.951  003.782  000.405: require('cmp')
110.034  000.080  000.080: require('cmp_luasnip')
110.122  004.081  000.219: sourcing /home/jrld/.local/share/nvim/lazy/cmp_luasnip/after/plugin/cmp_luasnip.lua
110.434  000.124  000.124: require('cmp_cmdline')
110.541  000.285  000.161: sourcing /home/jrld/.local/share/nvim/lazy/cmp-cmdline/after/plugin/cmp_cmdline.lua
110.863  000.152  000.152: require('cmp_path')
110.887  000.224  000.072: sourcing /home/jrld/.local/share/nvim/lazy/cmp-path/after/plugin/cmp_path.lua
111.330  000.049  000.049: require('cmp_buffer.timer')
111.336  000.115  000.065: require('cmp_buffer.buffer')
111.340  000.186  000.071: require('cmp_buffer.source')
111.342  000.244  000.057: require('cmp_buffer')
111.362  000.337  000.094: sourcing /home/jrld/.local/share/nvim/lazy/cmp-buffer/after/plugin/cmp_buffer.lua
111.642  000.056  000.056: require('cmp_nvim_lsp.source')
111.647  000.123  000.067: require('cmp_nvim_lsp')
111.669  000.188  000.065: sourcing /home/jrld/.local/share/nvim/lazy/cmp-nvim-lsp/after/plugin/cmp_nvim_lsp.lua
111.760  088.537  027.459: require('tau.plugins')
111.866  000.050  000.050: require('tau.theme.colourscheme')
112.712  000.129  000.129: require('lualine_require')
113.911  001.981  001.852: require('lualine')
117.645  000.467  000.467: require('lualine.highlight')
125.446  000.907  000.907: require('lualine.utils.mode')
129.131  017.262  013.907: require('tau.theme.line')
138.746  000.998  000.998: require('mason-core.functional')
140.250  001.491  001.491: require('mason-core.path')
140.655  000.378  000.378: require('mason.settings')
140.711  003.093  000.226: require('mason-core.log')
140.718  003.861  000.768: require('mason-core.EventEmitter')
140.856  000.135  000.135: require('mason-core.optional')
141.137  000.152  000.152: require('mason-core.async')
141.280  000.137  000.137: require('mason-core.async.uv')
141.295  000.435  000.147: require('mason-core.fs')
141.420  000.123  000.123: require('mason-registry.sources')
142.955  000.258  000.258: require('mason-core.functional.data')
143.137  000.169  000.169: require('mason-core.functional.function')
143.169  001.744  001.317: require('mason-core.functional.list')
143.236  010.729  004.431: require('mason-registry')
145.565  000.094  000.094: require('mason-core.functional.relation')
145.780  000.177  000.177: require('mason-core.functional.logic')
145.847  000.653  000.382: require('mason-core.platform')
146.819  000.968  000.968: require('mason-lspconfig.settings')
146.840  003.600  001.980: require('mason-lspconfig')
146.882  015.304  000.974: require('mason-tool-installer')
146.927  015.658  000.355: sourcing /home/jrld/.local/share/nvim/lazy/mason-tool-installer.nvim/plugin/mason-tool-installer.lua
147.044  017.686  002.027: require('mason-tool-installer')
147.645  000.259  000.259: require('mason')
148.987  000.592  000.592: require('mason-core.functional.string')
149.073  001.194  000.602: require('mason.api.command')
149.606  000.226  000.226: require('mason-lspconfig.notify')
149.613  000.483  000.257: require('mason-lspconfig.lspconfig_hook')
151.660  000.777  000.777: require('vim.version')
154.214  003.646  002.869: sourcing /home/jrld/.local/share/nvim/lazy/nvim-lspconfig/plugin/lspconfig.lua
154.819  005.203  001.557: require('lspconfig.util')
155.100  000.108  000.108: require('mason-core.functional.table')
155.341  000.510  000.402: require('mason-lspconfig.mappings.server')
155.604  000.247  000.247: require('mason-lspconfig.server_config_extensions')
157.187  000.748  000.748: require('lspconfig.async')
157.207  001.593  000.845: require('lspconfig.configs')
157.338  000.128  000.128: require('lspconfig.server_configurations.omnisharp')
159.147  000.108  000.108: require('mason-core.functional.number')
159.230  000.456  000.348: require('mason-lspconfig.api.command')
159.563  000.130  000.130: require('luasnip.session.snippet_collection')
160.594  000.897  000.897: require('luasnip.util._builtin_vars')
160.764  000.159  000.159: require('vim.inspect')
160.890  001.319  000.262: require('luasnip.util.environ')
160.982  000.088  000.088: require('luasnip.util.extend_decorator')
161.133  000.059  000.059: require('luasnip.loaders._caches')
161.223  000.086  000.086: require('luasnip.util.path')
161.263  000.276  000.131: require('luasnip.loaders')
161.370  000.090  000.090: require('luasnip.util.log')
161.398  002.163  000.260: require('luasnip')
161.583  000.073  000.073: require('luasnip.loaders.util')
162.174  000.129  000.129: require('luasnip.nodes.util')
162.237  000.057  000.057: require('luasnip.util.events')
162.252  000.275  000.089: require('luasnip.nodes.node')
162.382  000.128  000.128: require('luasnip.nodes.insertNode')
162.456  000.069  000.069: require('luasnip.nodes.textNode')
162.571  000.111  000.111: require('luasnip.util.mark')
162.700  000.098  000.098: require('luasnip.util.pattern_tokenizer')
162.753  000.049  000.049: require('luasnip.util.dict')
162.849  000.997  000.266: require('luasnip.nodes.snippet')
163.067  000.071  000.071: require('luasnip.util.parser.neovim_ast')
163.131  000.060  000.060: require('luasnip.util.str')
166.074  002.938  002.938: require('luasnip-jsregexp')
166.194  000.109  000.109: require('luasnip.util.directed_graph')
166.205  003.275  000.097: require('luasnip.util.parser.ast_utils')
167.309  001.101  001.101: require('luasnip.nodes.functionNode')
167.488  000.169  000.169: require('luasnip.nodes.choiceNode')
167.588  000.096  000.096: require('luasnip.nodes.dynamicNode')
167.651  000.059  000.059: require('luasnip.util.functions')
167.660  004.807  000.108: require('luasnip.util.parser.ast_parser')
167.875  000.213  000.213: require('luasnip.util.parser.neovim_parser')
167.890  006.121  000.104: require('luasnip.util.parser')
167.902  006.315  000.194: require('luasnip.nodes.snippetProxy')
167.919  006.517  000.129: require('luasnip.loaders.from_vscode')
172.112  000.535  000.535: require('lspconfig')
172.290  000.156  000.156: require('lspconfig.server_configurations.bashls')
176.057  001.032  001.032: require('lspconfig.manager')
176.261  000.161  000.161: require('lspconfig.server_configurations.elixirls')
176.706  000.145  000.145: require('mason-lspconfig.server_configurations.elixirls')
178.246  000.976  000.976: require('lspconfig.server_configurations.pyright')
181.486  000.118  000.118: require('lspconfig.server_configurations.ruff_lsp')
184.160  000.941  000.941: require('lspconfig.server_configurations.rust_analyzer')
186.293  000.941  000.941: require('lspconfig.server_configurations.cssls')
189.461  001.618  001.618: require('lspconfig.server_configurations.eslint')
195.675  001.983  001.983: require('lspconfig.server_configurations.jsonls')
198.045  001.271  001.271: require('lspconfig.server_configurations.emmet_language_server')
200.554  000.136  000.136: require('lspconfig.server_configurations.gopls')
201.247  000.115  000.115: require('lspconfig.server_configurations.lua_ls')
202.926  001.227  001.227: require('lspconfig.server_configurations.taplo')
203.677  074.536  026.744: require('tau.masonry.init')
204.034  000.166  000.166: require('lspconfig.ui.windows')
207.833  000.128  000.128: require('nvim-treesitter.locals')
207.849  000.318  000.190: require('nvim-treesitter.incremental_selection')
208.068  000.123  000.123: require('nvim-treesitter.endwise')
208.348  000.145  000.145: require('nvim-treesitter.highlight')
209.097  000.232  000.232: require('nvim-treesitter.indent')
209.193  005.501  004.516: require('tau.theme.highlights')
209.197  097.433  000.083: require('tau.term-conf')
210.661  204.590  005.288: sourcing /home/jrld/.config/nvim/init.lua
210.702  001.220: sourcing vimrc file(s)
211.284  000.297  000.297: sourcing /home/jrld/.local/bin/nvim-linux64/share/nvim/runtime/filetype.lua
214.333  001.387  001.387: sourcing /home/jrld/.local/bin/nvim-linux64/share/nvim/runtime/syntax/synload.vim
214.563  002.975  001.587: sourcing /home/jrld/.local/bin/nvim-linux64/share/nvim/runtime/syntax/syntax.vim
214.606  000.633: inits 3
218.555  003.950: reading ShaDa
219.010  000.322  000.322: require('luasnip.loaders.from_lua')
219.269  000.208  000.208: require('luasnip.loaders.from_snipmate')
219.322  000.236: opening buffers
219.528  000.206: BufEnter autocommands
219.532  000.005: editing files in windows
219.670  000.138: VimEnter autocommands
219.735  000.065: UIEnter autocommands
289.686  069.748  069.748: sourcing /home/jrld/.local/bin/nvim-linux64/share/nvim/runtime/autoload/provider/clipboard.vim
289.719  000.236: before starting main loop
4904.832  4615.113: first screen update
4904.839  000.008: --- NVIM STARTED ---


times in msec
 clock   self+sourced   self:  sourced script
 clock   elapsed:              other lines

000.094  000.094: --- NVIM STARTING ---
000.280  000.186: event init
000.465  000.185: early init
000.942  000.477: locale set
001.224  000.281: init first window
002.781  001.557: inits 1
002.806  000.025: window checked
002.814  000.008: parsing arguments
004.264  000.086  000.086: require('vim.shared')
004.420  000.057  000.057: require('vim._meta')
004.423  000.152  000.095: require('vim._editor')
004.425  000.314  000.075: require('vim._init_packages')
004.428  001.301: init lua interpreter
005.320  000.893: expanding arguments
005.417  000.096: inits 2
006.143  000.726: init highlight
