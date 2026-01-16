--- Startup times for process: Primary (or UI client) ---

times in msec
 clock   self+sourced   self:  sourced script
 clock   elapsed:              other lines

000.003  000.003: --- NVIM STARTING ---
000.778  000.775: event init
001.134  000.356: early init
001.504  000.370: locale set
001.747  000.243: init first window
003.974  002.227: inits 1
004.029  000.055: window checked
004.038  000.009: parsing arguments
006.112  000.160  000.160: require('vim._core.shared')
006.506  000.013  000.013: require('string.buffer')
006.808  000.382  000.368: require('vim.inspect')
007.060  000.201  000.201: require('vim._core.options')
007.093  000.965  000.382: require('vim._core.editor')
007.231  000.131  000.131: require('vim._core.system')
007.237  001.361  000.104: require('vim._init_packages')
007.243  001.844: init lua interpreter
014.230  006.987: nvim_ui_attach
016.495  002.265: nvim_set_client_info
016.514  000.019: --- NVIM STARTED ---

--- Startup times for process: Embedded ---

times in msec
 clock   self+sourced   self:  sourced script
 clock   elapsed:              other lines

000.003  000.003: --- NVIM STARTING ---
000.838  000.836: event init
001.340  000.502: early init
001.835  000.495: locale set
002.041  000.206: init first window
005.117  003.076: inits 1
005.168  000.050: window checked
005.177  000.009: parsing arguments
007.376  000.155  000.155: require('vim._core.shared')
007.734  000.012  000.012: require('string.buffer')
007.831  000.174  000.162: require('vim.inspect')
008.004  000.145  000.145: require('vim._core.options')
008.026  000.638  000.319: require('vim._core.editor')
008.132  000.103  000.103: require('vim._core.system')
008.137  001.010  000.114: require('vim._init_packages')
008.142  001.956: init lua interpreter
008.359  000.216: expanding arguments
008.459  000.100: inits 2
009.372  000.913: init highlight
009.379  000.007: waiting for UI
009.809  000.431: done waiting for UI
009.825  000.016: clear screen
010.252  000.043  000.043: require('vim.keymap')
013.803  000.655  000.655: sourcing nvim_exec2()
017.389  003.174  003.174: require('vim.termcap')
017.671  000.219  000.219: require('vim.text')
018.087  008.254  004.163: require('vim._core.defaults')
018.098  000.018: init default mappings & autocommands
018.440  000.182  000.182: sourcing /usr/share/nvim/runtime/ftplugin.vim
018.884  000.157  000.157: sourcing /usr/share/nvim/runtime/indent.vim
019.377  000.037  000.037: sourcing /usr/share/nvim/archlinux.vim
019.396  000.166  000.130: sourcing /etc/xdg/nvim/sysinit.vim
020.414  000.074  000.074: require('vim.fs')
022.374  001.946  001.946: require('vim.uri')
022.464  002.188  000.169: require('vim.loader')
023.879  001.153  001.153: require('__globals')
026.237  002.345  002.345: require('lam.000options')
029.232  000.806  000.806: require('vim._async')
029.667  000.407  000.407: require('vim.version')
032.581  006.007  004.793: require('vim.pack')
032.924  000.031  000.031: require('vim.F')
046.705  005.482  005.482: require('mini.bufremove')
048.054  001.302  001.302: require('mini.tabline')
048.357  000.036  000.036: sourcing nvim_exec2() called at /home/jrld/.config/nvim/init.lua:0
050.326  001.958  001.958: require('mini.statusline')
051.363  000.787  000.787: require('oil')
051.621  000.241  000.241: require('oil.ringbuf')
051.956  000.325  000.325: require('oil.config')
063.467  008.803  008.803: require('vim.filetype')
072.127  000.359  000.359: require('oil.log')
072.183  001.336  000.977: require('oil.fs')
073.182  000.203  000.203: require('oil.constants')
073.412  001.223  001.020: require('oil.util')
073.427  047.175  019.645: require('lam.001misc_plugins')
081.372  004.509  004.509: require('nvim-treesitter')
081.660  000.268  000.268: require('nvim-treesitter.config')
081.725  008.291  003.514: require('lam.002treesitter')
088.941  000.428  000.428: require('mason-core.path')
090.162  000.365  000.365: require('mason-core.functional.data')
090.469  000.290  000.290: require('mason-core.functional.function')
090.830  000.332  000.332: require('mason-core.functional.list')
091.099  000.234  000.234: require('mason-core.functional.relation')
091.269  000.157  000.157: require('mason-core.functional.logic')
091.423  000.144  000.144: require('mason-core.functional.number')
091.619  000.173  000.173: require('mason-core.functional.string')
091.826  000.193  000.193: require('mason-core.functional.table')
092.371  000.319  000.319: require('mason-core.functional.type')
092.389  003.000  000.793: require('mason-core.functional')
092.600  003.634  000.634: require('mason-core.platform')
093.217  000.524  000.524: require('mason.settings')
093.247  005.202  000.616: require('mason-core.installer.InstallLocation')
094.342  000.691  000.691: require('mason-core.log')
094.356  000.870  000.179: require('mason-core.EventEmitter')
094.740  000.378  000.378: require('mason-registry.sources')
094.789  001.535  000.288: require('mason-registry')
094.809  009.666  002.929: require('mason')
098.120  000.466  000.466: require('mason.api.command')
101.568  002.386  002.386: require('vim.lsp.protocol')
101.866  002.979  000.593: require('vim.lsp.log')
103.083  001.198  001.198: require('vim.lsp.util')
103.826  000.420  000.420: require('vim.lsp.sync')
103.871  000.769  000.350: require('vim.lsp._changetracking')
105.281  000.619  000.619: require('vim.lsp._transport')
105.326  000.030  000.030: require('vim._core.stringbuffer')
105.376  001.489  000.840: require('vim.lsp.rpc')
105.552  007.376  000.940: require('vim.lsp')
106.533  000.606  000.606: require('blink.cmp')
109.770  001.226  001.226: require('blink.cmp.lib.async')
110.685  000.552  000.552: require('blink.cmp.config.utils')
110.903  000.205  000.205: require('blink.cmp.config.keymap')
111.637  000.306  000.306: require('blink.cmp.config.completion.keyword')
112.617  000.970  000.970: require('blink.cmp.config.completion.trigger')
113.252  000.611  000.611: require('blink.cmp.config.completion.list')
113.863  000.594  000.594: require('blink.cmp.config.completion.accept')
114.687  000.807  000.807: require('blink.cmp.config.completion.menu')
115.306  000.599  000.599: require('blink.cmp.config.completion.documentation')
116.052  000.729  000.729: require('blink.cmp.config.completion.ghost_text')
116.074  004.956  000.340: require('blink.cmp.config.completion')
116.747  000.666  000.666: require('blink.cmp.config.fuzzy')
117.790  001.030  001.030: require('blink.cmp.config.sources')
118.880  001.078  001.078: require('blink.cmp.config.signature')
119.842  000.949  000.949: require('blink.cmp.config.snippets')
120.529  000.674  000.674: require('blink.cmp.config.appearance')
121.423  000.882  000.882: require('blink.cmp.config.modes.cmdline')
122.176  000.737  000.737: require('blink.cmp.config.modes.term')
122.194  012.404  000.674: require('blink.cmp.config')
125.763  003.562  003.562: require('blink.cmp.lib.utils')
126.848  001.052  001.052: require('blink.cmp.lib.event_emitter')
127.628  021.084  002.839: require('blink.cmp.sources.lib')
130.039  000.270  000.270: require('mason-core.async')
130.200  000.142  000.142: require('mason-core.async.uv')
130.224  001.017  000.606: require('mason-core.fs')
131.343  000.442  000.442: require('mason-core.result')
132.369  000.289  000.289: require('mason-core.process')
132.684  000.304  000.304: require('mason-core.spawn')
132.700  000.781  000.188: require('mason-core.installer.managers.powershell')
132.881  000.175  000.175: require('mason.version')
132.897  001.462  000.505: require('mason-core.fetch')
133.047  000.143  000.143: require('mason-core.providers')
133.315  000.133  000.133: require('mason-core.optional')
134.273  000.466  000.466: require('mason-core.purl')
134.523  000.231  000.231: require('mason-core.async.control')
134.550  000.981  000.284: require('mason-core.package.AbstractPackage')
135.603  000.163  000.163: require('mason-core.installer.compiler.expr')
135.640  000.396  000.233: require('mason-core.installer.compiler.link')
136.764  000.221  000.221: require('mason-core.installer.context.InstallContextCwd')
136.944  000.168  000.168: require('mason-core.installer.context.InstallContextFs')
137.244  000.293  000.293: require('mason-core.installer.context.InstallContextSpawn')
137.510  000.255  000.255: require('mason-core.receipt')
137.568  001.205  000.268: require('mason-core.installer.context')
137.574  001.385  000.179: require('mason-core.installer')
137.614  001.692  000.307: require('mason-core.installer.managers.std')
137.620  001.964  000.273: require('mason-core.installer.compiler.schemas')
137.943  000.319  000.319: require('mason-core.installer.compiler.util')
137.985  003.091  000.412: require('mason-core.installer.compiler')
138.284  000.289  000.289: require('mason-core.installer.linker')
138.310  003.754  000.374: require('mason-core.installer.InstallRunner')
138.636  000.313  000.313: require('mason-core.installer.UninstallRunner')
139.825  006.503  001.454: require('mason-core.package')
139.887  006.834  000.199: require('mason-registry.sources.util')
139.968  009.325  000.446: require('mason-registry.sources.github')
207.064  000.499  000.499: require('vim.iter')
207.172  125.440  075.400: require('lam.003ide_features')
210.394  003.212  003.212: require('lam.004keybinds')
215.148  003.837  003.837: require('lam.language_plugins.rust')
215.168  004.751  000.914: require('lam.language_plugins')
220.569  001.093  001.093: require('cold')
223.570  004.356  003.263: sourcing /home/jrld/.local/share/nvim/site/pack/core/opt/cold.nvim/colors/cold.lua
224.955  205.473  006.561: sourcing /home/jrld/.config/nvim/init.lua
225.031  000.956: sourcing vimrc file(s)
226.529  000.525  000.525: sourcing nvim_exec2() called at /usr/share/nvim/runtime/filetype.lua:0
226.548  000.846  000.321: sourcing /usr/share/nvim/runtime/filetype.lua
227.939  000.503  000.503: sourcing /usr/share/nvim/runtime/syntax/synload.vim
228.243  001.523  001.020: sourcing /usr/share/nvim/runtime/syntax/syntax.vim
234.595  004.373  004.373: sourcing /home/jrld/.local/share/nvim/site/pack/core/opt/blink.cmp/plugin/blink-cmp.lua
236.262  000.551  000.551: sourcing /home/jrld/.local/share/nvim/site/pack/core/opt/nvim-lspconfig/plugin/lspconfig.lua
240.977  000.416  000.416: require('vim.treesitter.language')
241.378  000.372  000.372: require('vim.func')
241.709  000.313  000.313: require('vim.treesitter._range')
242.069  000.326  000.326: require('vim.func._memoize')
242.241  002.329  000.902: require('vim.treesitter.query')
242.399  003.242  000.912: require('vim.treesitter.languagetree')
242.465  004.367  001.125: require('vim.treesitter')
243.145  005.783  001.417: sourcing /home/jrld/.local/share/nvim/site/pack/core/opt/nvim-treesitter/plugin/filetypes.lua
244.033  000.565  000.565: sourcing /home/jrld/.local/share/nvim/site/pack/core/opt/nvim-treesitter/plugin/nvim-treesitter.lua
244.465  000.231  000.231: sourcing /home/jrld/.local/share/nvim/site/pack/core/opt/nvim-treesitter/plugin/query_predicates.lua
247.178  000.323  000.323: sourcing /usr/share/nvim/runtime/plugin/gzip.vim
247.519  000.092  000.092: sourcing /usr/share/nvim/runtime/plugin/matchit.vim
247.739  000.084  000.084: sourcing /usr/share/nvim/runtime/plugin/matchparen.vim
247.994  000.061  000.061: sourcing /usr/share/nvim/runtime/plugin/netrwPlugin.vim
248.185  000.055  000.055: sourcing /usr/share/nvim/runtime/plugin/rplugin.vim
248.418  000.076  000.076: sourcing /usr/share/nvim/runtime/plugin/tarPlugin.vim
248.644  000.061  000.061: sourcing /usr/share/nvim/runtime/plugin/tutor.vim
248.890  000.105  000.105: sourcing /usr/share/nvim/runtime/plugin/zipPlugin.vim
249.515  000.496  000.496: sourcing /usr/share/nvim/runtime/plugin/editorconfig.lua
250.440  000.682  000.682: sourcing /usr/share/nvim/runtime/plugin/man.lua
251.429  000.823  000.823: sourcing /usr/share/nvim/runtime/plugin/nvim/net.lua
252.044  000.408  000.408: sourcing /usr/share/nvim/runtime/plugin/nvim/spellfile.lua
252.377  000.218  000.218: sourcing /usr/share/nvim/runtime/plugin/osc52.lua
252.654  000.180  000.180: sourcing /usr/share/nvim/runtime/plugin/shada.lua
252.992  000.163  000.163: sourcing /usr/share/nvim/runtime/plugin/tohtml.lua
253.886  000.110  000.110: sourcing /usr/share/vim/vimfiles/plugin/fzf.vim
253.922  011.082: loading rtp plugins
255.572  001.649: loading packages
255.626  000.054: loading after plugins
255.704  000.079: inits 3
256.623  000.918: opening buffers
257.080  000.457: BufEnter autocommands
257.099  000.019: editing files in windows
257.203  000.104: VimEnter autocommands
257.344  000.141: UIEnter autocommands
257.350  000.007: before starting main loop
260.554  003.204: first screen update
260.570  000.016: --- NVIM STARTED ---

