(import-macros {: o! : autocmd!} "tau.macros")
(macro req! [lib func & var-args]
  `((. (require ,lib) ,func) ,(unpack var-args)))
[{1 "nvim-focus/focus.nvim"
  :event "VeryLazy"
  :opts {:commands false}
  :version "*"}
 {1 "vim-scripts/securemodelines" 
  :lazy false 
  :priority 1}
 {1 "windwp/nvim-autopairs"
  :config (fn []
            (local np (require :nvim-autopairs))
            (local cond (require :nvim-autopairs.conds))
            (local ts-cond (require :nvim-autopairs.ts-conds))
            (np.setup {:check_ts true :ts_config {:lisp ["comment" "block_comment"]}})
            (macro set-rule [rule method lst]
              `(tset (. (np.get_rules ,rule) 1) ,method ,lst))
            (set-rule "'" :not_filetypes ["scheme" "lisp" "fennel"])
            (set-rule "`" :not_filetypes ["scheme" "lisp" "fennel"]))}
 {1 "folke/which-key.nvim"
  :event "VeryLazy"
  :init (fn [] 
          (o! timeout true) 
          (o! timeoutlen 300))}
 {1 "nvim-telescope/telescope.nvim"
  :cmd "Telescope"
  :config (fn []
            (local action (require :telescope.actions))
            ((. (require :telescope) :setup) {:defaults {:mappings {:i {:<C-j> action.move_selection_next
                                                                        :<C-k> action.move_selection_previous}}}}))
  :dependencies [ "nvim-lua/plenary.nvim"]
  :lazy true}
 {1 "folke/trouble.nvim"
  :cmd "Trouble"
  :lazy true
  :opts {:icons {:indent {:fold_closed ">" :fold_open "v"}
                 :folder_closed "- "
                 :folder_open   "- "}}
  :config true}
 {1 "onsails/lspkind.nvim"}
 {1 "yioneko/nvim-cmp"
  :branch "perf"
  :dependencies ["hrsh7th/cmp-nvim-lsp"
                 "hrsh7th/cmp-buffer"
                 "hrsh7th/cmp-nvim-lsp"
                 "hrsh7th/cmp-buffer"
                 "FelipeLema/cmp-async-path"
                 "hrsh7th/cmp-cmdline"
                 "saadparwaiz1/cmp_luasnip"
                 {1 "L3MON4D3/LuaSnip" :build "make install_jsregexp" :version "1.*"}]}]
