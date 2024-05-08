;; fennel-ls: macro-file
(fn void! [pred] `(do ,pred nil)) ; Hello Javascript!

(fn lsp! [name tbl]
  (if (not= tbl :nosetup)
      (do
         (tset tbl :capabilities `cmp-capabilities)
        `(fn [] ((. (. (require :lspconfig) ,name) :setup) ,tbl)))
      `(fn [])))
 
(fn lazy! [lib func & var-args]
  `(fn [] ((. (require ,lib) ,func) ,(unpack var-args))))

(fn autocmd! [event opts & callback]
  `(vim.api.nvim_create_autocmd ,event 
      (vim.tbl_extend :force ,opts {:callback (hashfn (do (do ,(unpack callback) nil)))})))

; warning, this macro will devour your newborn if you're not careful
(fn masonsetup! [& args]
  (local configs {})
  (tset configs 1 `#((-> (require :lspconfig) (. $1) (. :setup)) {}))
  (for [i 1 (length args) 2]
    (let [lsp_name (. args i)
          lsp_config (. args (+ i 1))]
      (tset configs lsp_name (lsp! lsp_name lsp_config))))
  `((-> (require :mason-lspconfig) (. :setup_handlers)) ,configs))



{: void! : masonsetup! : autocmd! : lazy!}
