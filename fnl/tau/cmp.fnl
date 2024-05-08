(import-macros {: void!} "tau.macros")
(local {: autocmd} (require "tau._internal.funcs"))
(local cmp (require :cmp))
(local snippet (-> (require :cmp.types)
                   (. :lsp)
                   (. :CompletionItemKind)
                   (. :Snippet)))
(local luasnip (require :luasnip))
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
  {:experimental {:ghost_test true}
   :mapping (cmp.mapping.preset.insert {:<CR> (cmp.mapping {:i select-incomplete-or-snippet})
                                        :<c-CR> (cmp.mapping.abort)
                                        :<c-j> (cmp.mapping.select_next_item)
                                        :<c-k> (cmp.mapping.select_prev_item)})
   :snippet {:expand (fn [args] (luasnip.lsp_expand args.body))}
   :sorting {:comparators [cmp.config.compare.exact
                           cmp.config.compare.score
                           cmp.config.compare.offset
                           (fn [entry1 entry2]
                             (var (_ entry1-under) (entry1.completion_item.label:find "^_+"))
                             (var (_ entry2-under) (entry2.completion_item.label:find "^_+"))
                             (set entry1-under (or entry1-under 0))
                             (set entry2-under (or entry2-under 0))
                             (if (< entry1-under entry2-under) true false))
                           cmp.config.compare.sort_text
                           cmp.config.compare.length
                           cmp.config.compare.order]}
   :sources (cmp.config.sources [{:max_item_count 4  :name "luasnip"}
                                 {:max_item_count 50 :name "nvlime"}
                                 {:max_item_count 10 :name "nvim_lsp"}
                                 {:max_item_count 4  :name "html-css"}
                                 {:max_item_count 4  :name "function"}
                                 {:max_item_count 0  :name "buffer"}])
   :view {:entries {:name "custom" 
                    :selection_order "near_cursor"}}

   :window {:completion cmp-border 
            :documentation cmp-border}})

(cmp.setup.filetype 
  "gitcommit" {:sources (cmp.config.sources [{:name "git"}] [{:name "buffer"}])})

(cmp.setup.cmdline 
  ["/" "?"] {:mapping (cmp.mapping.preset.cmdline) :sources [{:name "buffer"}]})

(cmp.setup.cmdline 
  ":" {:mapping (cmp.mapping.preset.cmdline)
       :sources (cmp.config.sources [{:name "path"}] [{:name "cmdline"}])})

(local border [["┌" :FloatBorder] ["─" :FloatBorder] 
               ["┐" :FloatBorder] ["│" :FloatBorder]
               ["┘" :FloatBorder] ["─" :FloatBorder] 
               ["└" :FloatBorder] ["│" :FloatBorder]])

(local __open-floating-preview vim.lsp.util.open_floating_preview)
(fn vim.lsp.util.open_floating_preview [contents syntax opts ...]
  (local opts (or opts {}))
  (set opts.border (or opts.border border))
  (__open-floating-preview contents syntax opts ...))

(autocmd :InsertEnter 
  (fn []
    (local cmp-ap (require :nvim-autopairs.completion.cmp))
    (cmp.event:on :confirm_done (cmp-ap.on_confirm_done {:filetypes {:lisp false}}))))
