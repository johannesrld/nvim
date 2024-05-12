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
        "lua" "luap" "luadoc" "vim" "vimdoc" "fennel"
         ; python
        "requirements" "python" "pymanifest"
         ; shell
        "bash" "awk" "readline"
         ; common data formats
        "json" "json5" "jsonc" "jq" "yaml" "xml" "toml" "sql" "tsv"
         ; markup
        "org" "markdown" "markdown_inline" "mermaid" "rst"
         ; webstuff
         "http" "html" "javascript" "typescript" "css" "jsdoc" "tsx"
         ; git files
        "gitattributes" "gitcommit" "gitignore" "git_config" "git_rebase" "diff"
         ; Misc
        "printf" "regex" "dockerfile" "llvm" "asm" "disassembly" "ini"]

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
     :indent    {:enable true :disable ["ocaml"]}}}]
        
 ;["RRethy/nvim-treesitter-textsubjects"]
 
  ;:dependencies ["nvim-treesitter/nvim-treesitter"]
  
