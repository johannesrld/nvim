[{:config 
    (fn [opts]
      (tset (. (require :lspconfig.ui.windows) :default_options) :border
            :single)
      ((. (require :nvim-treesitter.configs) :setup) opts.opts))
  :dir "~/projects/neovim/nvim-treesitter"
  :opts 
    {:auto_install true
     :ensure_installed 
       [ ; vim/lua stuff
        "lua" "luadoc" "vim" "vimdoc" "fennel"
         ; python
        "requirements" "python"
         ; shell
        "bash"
         ; common data formats
        "json" "json5" "jsonc" "jq" "yaml" "xml" "toml" "sql" 
         ; markup
        "org" "markdown" "mermaid"
         ; webstuff
        "html" "javascript" "typescript" "css" "jsdoc"
         ; git files
        "gitattributes" "gitcommit" "gitignore" "git_config" "git_rebase" "diff"]
     :textobjects 
       {:move  {:enable true
                :set_jumps true
                :goto_next_end 
                  {"]M" "@function.outer" "][" "@class.outer"}
                :goto_next_start 
                  {"]]" "@class.outer" "]m" "@function.outer"}
                :goto_previous_end 
                  {"[M" "@function.outer" "[]" "@class.outer"}
                :goto_previous_start 
                  {"[[" "@class.outer" "[m" "@function.outer"}}
        :select {:enable true
                 :lookahead true
                 :keymaps 
                   {:aa "@parameter.outer" :ac "@class.outer" :af "@function.outer"
                    :ia "@parameter.inner" :ic "@class.inner" :if "@function.inner"}}}
     :incremental_selection 
       {:enable true 
        :keymaps {:init_selection   "<c-space>" :node_decremental  "<M-space>"
                  :node_incremental "<c-space>" :scope_incremental "<c-s>"}}
     :endwise   {:enable true}
     :swap      {:enable true}
     :autotag   {:enable true :enable_rename true}
     :highlight {:enable true :additional_vim_regex_highlighting ["org"]}
     :indent    {:enable true :disable ["ocaml"]}
     :refactor  {:highlight_current_scope {:enable true}}}}
        
 ["RRethy/nvim-treesitter-textsubjects"
  ;:dependencies ["nvim-treesitter/nvim-treesitter"]
  ]
 ["nvim-treesitter/nvim-treesitter-refactor"
  ;:dependencies ["nvim-treesitter/nvim-treesitter"]
  ]]
