(import-macros {: masonsetup! : autocmd!} "tau.macros")
(local cmp-capabilities
 (let [client-capabilities (vim.lsp.protocol.make_client_capabilities)]
   ((-> (require :cmp_nvim_lsp) (. :default_capabilities)) client-capabilities)))
(set cmp-capabilities.textDocument.completion.completionItem.snippetSupport true)

(masonsetup!
  "emmet_language_server" {:init_options {:showAbbreviationSuggestions    true
                                               :showExpandedAbbreviation  "always"
                                               :showSuggestionsAsSnippets true}}
  "rust_analyzer"         :nosetup
  "tsserver"              :nosetup)

; (vim.api.nvim_create_autocmd :LspAttach
;                              {:callback (fn [args]
;                                           (when (not (and args.data
;                                                           args.data.client_id))
;                                             (lua "return "))
;                                           (local bufnr args.buf)
;                                           (local client
;                                                  (vim.lsp.get_client_by_id args.data.client_id))
;                                           ((. (require :lsp-inlayhints)
;                                               :on_attach) client
;                                                                                                                                   bufnr))
;                               :once true})  
;(local $1 1)
;(local autocmd! 1)
(autocmd! :LspAttach {:once true}
   (when (and $1.data $1.data.client_id)
     (local bufnr $1.buf)
     (local client (vim.lsp.get_client_by_id $1.data.client_id))
     ((-> (require :lsp-inlayhints) (. :on_attach)) client bufnr)))
