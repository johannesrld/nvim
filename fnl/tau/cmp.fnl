(import-macros {: void! : autocmd!} "tau.macros")
(local cmp (require :cmp))
(local snippet (-> (require :cmp.types)
                   (. :lsp)
                   (. :CompletionItemKind)
                   (. :Snippet)))

(local cmp-ap (require :nvim-autopairs.completion.cmp))
(local luasnip (require :luasnip))
(local lspkind (require :lspkind))
((. (require :luasnip.loaders.from_vscode) :lazy_load))
(local cmp-border 
  (vim.tbl_deep_extend :force (cmp.config.window.bordered)
                       {:border ["┌" "─" "┐" "│" "┘" "─" "└" "│"] :scrollbar false}))
(fn select-incomplete-or-snippet [fallback]
  (if (cmp.visible)
    (let [entry (cmp:get_first_entry)
          entry-kind entry.completion_item.kind]
      (if (and (not= entry nil) 
               (or (= entry-kind snippet) (not entry.exact)))
          (cmp.confirm {:select true})
          (void! (fallback))))
    (void! (fallback))))
(cmp.setup 
  {:performance {:debounce 10 :throttle 20}
   :mapping (cmp.mapping.preset.insert {:<CR> (cmp.mapping.confirm {:select true})
                                        :<c-CR> (cmp.mapping.abort)
                                        :<c-j> (cmp.mapping.select_next_item)
                                        :<c-k> (cmp.mapping.select_prev_item)
                                        :<Tab> (cmp.mapping (fn [fallback]
                                                              (if (luasnip.jumpable 1)
                                                                  (void! (luasnip.jump 1))
                                                                  (void! (fallback)))) ["i" "s"])})
   :snippet {:expand (fn [args] (luasnip.lsp_expand args.body))}
   :sorting {:priority_weight 1.0
             :comparators [cmp.config.compare.offset  
                           cmp.config.compare.exact
                           cmp.config.compare.score
                           (fn [entry1 entry2]
                             (var (_ entry1-under) (entry1.completion_item.label:find "^_+"))
                             (var (_ entry2-under) (entry2.completion_item.label:find "^_+"))
                             (set entry1-under (or entry1-under 0))
                             (set entry2-under (or entry2-under 0))
                             (if (< entry1-under entry2-under) true false))
                           cmp.config.compare.recently_used
                           cmp.config.compare.order
                           cmp.config.compare.locality
                           cmp.config.compare.length]}
   :sources (cmp.config.sources [{:max_item_count 25 :name "nvim_lsp" :priority 8}
                                 {:max_item_count 10 :name "luasnip" :priority 9}
                                 {:max_item_count 10 :name "html-css" :priority 10}])
   :view {:entries {:name "custom" 
                    :selection_order "near_cursor"}}
   :formatting 
     {:fields ["abbr" "kind"]
      :format 
        (lspkind.cmp_format 
          {:mode "symbol" 
           :maxwidth 30
           :symbol_map {:Function "λ" :Method     "ƛ" :Constructor "ƛ"
                        :Field    "∈" :Property   "∈" :Variable    "α"
                        :Snippet  "⍉" :Class      "C" :Interface   "I"
                        :Module   "M" :Enum       "E" :Keyword     "K"
                        :Color    " " :File       " " :Reference   "*"
                        :Folder   " " :EnumMember "E" :Constant    "α"
                        :Struct   "S" :Event      " " :Operator    " "
                        :Text     " "} 
           :before (fn [_ item]
                     (tset item :abbr (string.sub item.abbr 1 30))
                     (tset item :menu "")
                     item)})}
                           
                                                       
   :window {:completion cmp-border 
            :documentation cmp-border}})
(cmp.setup.filetype 
  "gitcommit" {:sources (cmp.config.sources [{:name "git"}] [{:name "buffer"}])})
(cmp.setup.filetype 
  "lisp" {:sources [{:name "nvlime"}]})
(cmp.setup.cmdline 
  ["/" "?"] {:mapping (cmp.mapping.preset.cmdline) :sources [{:name "buffer"}]})

(cmp.setup.cmdline 
  ":" {:mapping (cmp.mapping.preset.cmdline)
       :sources (cmp.config.sources [{:name "async_path"}] [{:name "cmdline"}])})

(local border [["┌" :FloatBorder] ["─" :FloatBorder] 
               ["┐" :FloatBorder] ["│" :FloatBorder]
               ["┘" :FloatBorder] ["─" :FloatBorder] 
               ["└" :FloatBorder] ["│" :FloatBorder]])
(cmp.event:on "confirm_done" (cmp-ap.on_confirm_done))
(local __open-floating-preview vim.lsp.util.open_floating_preview)
(fn vim.lsp.util.open_floating_preview [contents syntax opts ...]
  (local opts (or opts {}))
  (set opts.border (or opts.border border))
  (__open-floating-preview contents syntax opts ...))
