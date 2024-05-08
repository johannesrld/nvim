(import-macros {: o!} "tau.macros")
(macro req! [lib func & var-args]
  `((. (require ,lib) ,func) ,(unpack var-args)))

[{1 "folke/todo-comments.nvim"
  :opts {:highlight {:after "" :keyword "bg"}
         :signs false
         :keywords {"FIX"  {:icon ""}
                    "HACK" {:icon ""}
                    "NOTE" {:icon ""}
                    "PERF" {:icon ""}
                    "TEST" {:icon ""}
                    "TODO" {:icon ""}
                    "WARN" {:icon ""}}}}
 {1 "nvim-focus/focus.nvim"
  :event "VeryLazy"
  :opts {:commands false}
  :version "*"}
 ["nvim-lua/plenary.nvim"]
 {1 "vim-scripts/securemodelines" 
  :lazy false 
  :priority 1}
 {1 "windwp/nvim-autopairs"
  :opts {:check_ts true
         :ts_config {"lisp" [:comment :block_comment]}}
  :config (fn [opts]
            (local ap (require :nvim-autopairs))
            (ap.setup opts)
            (local rule (require :nvim-autopairs.rule))
            (macro r! [rule1 rule2 ft & rules]
              (var wrapped `(rule ,rule1 ,rule2 ,ft))
              (each [_# rule# (ipairs rules)]
                (set wrapped `(: ,wrapped :with_pair ,rule#)))
              wrapped)
            (local cond (require :nvim-autopairs.conds))
            (tset (. (ap.get_rules "'") 1) :not_filetypes ["scheme" "lisp"])
            (tset (. (ap.get_rules "`") 1) :not_filetypes ["scheme" "lisp"])
            (: (. (ap.get_rules "'") 1) :with_pair (cond.not_after_text "["))
            (local {: is_ts_node : is_not_ts_node} (require :nvim-autopairs.ts-conds))
            (ap.add_rules [(r! "*" "*"     ["lisp"] (is_not_ts_node [:str_lit :comment]))
                           (r! "#|" "|#"   ["lisp"] (is_not_ts_node [:str_lit :comment]))
                           (r! "~(" "~)"   ["lisp"] (is_ts_node     [:str_lit]))
                           (r! "~:(" "~)"  ["lisp"] (is_ts_node     [:str_lit]))
                           (r! "~@(" "~)"  ["lisp"] (is_ts_node     [:str_lit]))
                           (r! "~:@(" "~)" ["lisp"] (is_ts_node     [:str_lit]))
                           (r! "~{" "~}"   ["lisp"] (is_ts_node     [:str_lit]))
                           (r! "~:{" "~}"  ["lisp"] (is_ts_node     [:str_lit]))
                           (r! "~@{" "~}"  ["lisp"] (is_ts_node     [:str_lit]))
                           (r! "~:@{" "~}" ["lisp"] (is_ts_node     [:str_lit]))
                           (r! "~[" "~]"   ["lisp"] (is_ts_node     [:str_lit]))
                           (r! "~:[" "~]"  ["lisp"] (is_ts_node     [:str_lit]))
                           (r! "~@[" "~]"  ["lisp"] (is_ts_node     [:str_lit]))]))}
 {1 "jiaoshijie/undotree" 
   :event "VeryLazy" 
   :lazy true 
   :opts {:float_diff false}}
 {1 "folke/which-key.nvim"
  :event "VeryLazy"
  :init (fn [] 
          (o! timeout true) 
          (o! timeoutlen 300))
  :opts {:triggers_nowait ["<leader>" "<localleader>" "<LocalLeader>" "<Localleader>"]}}
 {1 "nvim-telescope/telescope.nvim"
  :cmd "Telescope"
  :config (fn []
            (local action (require :telescope.actions))
            ((. (require :telescope) :setup) {:defaults {:mappings {:i {:<C-j> action.move_selection_next
                                                                        :<C-k> action.move_selection_previous}}}}))
  :dependencies [ "nvim-lua/plenary.nvim"]
  :lazy true}
 {1 "echasnovski/mini.comment"
  :dependencies [{1 "JoosepAlviste/nvim-ts-context-commentstring" :lazy true}]
  :event "VeryLazy"}
 {1 "folke/trouble.nvim"
  :cmd "TroubleToggle"
  :lazy true
  :opts {:fold_closed          ">"
         :fold_open            "v"
         :icons                false
         :indent_lines         false
         :signs                {:error "X" :hint "H" :information "?" :warning "W"}
         :use_diagnostic_signs false}}

 {1 "johannesrld/nvim-cmp"
  :branch "expose-first-entry"
  :dependencies ["hrsh7th/cmp-nvim-lsp"
                 "hrsh7th/cmp-buffer"
                 "hrsh7th/cmp-nvim-lsp"
                 "hrsh7th/cmp-buffer"
                 "hrsh7th/cmp-path"
                 "hrsh7th/cmp-cmdline"
                 "saadparwaiz1/cmp_luasnip"
                 {1 "L3MON4D3/LuaSnip" :build "make install_jsregexp" :version "1.*"}]}]
