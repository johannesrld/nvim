(import-macros {: autocmd!} "tau.macros")
[{1 "williamboman/mason.nvim"
  :dependencies ["neovim/nvim-lspconfig"]
  :event "VeryLazy"
  :lazy true
  :build (fn [] ((. (require :mason.api.command) :MasonUpdate)))
  :opts 
    {:ui {:icons {:package_installed "+" 
                  :package_pending "#" 
                  :package_uninstalled "-"}}}}
 {1 "williamboman/mason-lspconfig.nvim"
  :dependencies ["williamboman/mason.nvim" "neovim/nvim-lspconfig"]
  :event "VeryLazy"
  :lazy true}
 {1 "WhoIsSethDaniel/mason-tool-installer.nvim"
  :dependencies ["williamboman/mason.nvim"]
  :event "VeryLazy"
  :lazy true
  :opts 
    {:auto_update false
     :run_on_start true
     :debounce_hours 5
     :start_delay 3000
     :ensure_installed 
       [; Shell
        "shellcheck" "shellharden" "shfmt" "bash-language-server"
        ; Lua
        "lua-language-server" "stylua"
        ; Python
        "basedpyright" "mypy" "debugpy" "ruff-lsp" "black"
        ; Webdev/JS
        "css-lsp" "stylelint" "html-lsp" "emmet-language-server" "typescript-language-server"
        ; Markup
        "json-lsp" "markuplint"
        ; Misc
        "dprint"]}}
     
 {1 "neovim/nvim-lspconfig"
    :event "VeryLazy" 
    :lazy true}
 {1 "stevearc/conform.nvim"
  :event "BufRead"
  :lazy true
  :opts 
    {:formatters_by_ft 
      {:javascript ["dprint"]
       :json       ["dprint"]
       :lua        [["stylua"]]
       :markdown   [["dprint" "markdownlint"]]
       :typescript ["dprint"]}}}
 {1 "mfussenegger/nvim-lint"
  :lazy true
  :event "VeryLazy"
  :config (fn []
            (tset (require :lint) :linters_by_ft {:html ["markuplint"]})
            (autocmd! :BufWritePost {}
                ((. (require :lint) :try_lint))))}
 {1 "ray-x/lsp_signature.nvim"
  :opts 
    {:handler_opts {:border "none"} 
     :hint_prefix "🦭 "}}
 {1 "lvimuser/lsp-inlayhints.nvim" 
  :event "LspAttach"}
 {1 "folke/neodev.nvim" :opts {}}]  
