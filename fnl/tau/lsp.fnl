(import-macros {: masonsetup! : autocmd!} "tau.macros")
(vim.lsp.set_log_level "OFF")
(local capabilities
 (let [client-capabilities (vim.lsp.protocol.make_client_capabilities)]
   ((-> (require :cmp_nvim_lsp) (. :default_capabilities)) client-capabilities)))
(set capabilities.textDocument.completion.completionItem.snippetSupport true)

(masonsetup! capabilities
  "emmet_language_server" {:init_options {:showAbbreviationSuggestions    true
                                               :showExpandedAbbreviation  "always"
                                               :showSuggestionsAsSnippets true}}
  "jsonls"                {:settings {:json {:schemas ((. (. (require "schemastore") :json) :schemas))
                                             :validate {:enable true}}}}
  "rust_analyzer"         :nosetup
  "ts_ls"                 :nosetup)
