(local keybinds (require :tau.keybinds.nastybits))
(import-macros {: autocmd! : lazy!} :tau.macros)
(local wk (require :which-key))
;(wk.register [{1 "<leader>l" :group "Language Actions"}
;              {1 "<leader>t" :group "Telescope"}])

(fn telescope [module]
  (let [opts {:borderchars   {:preview ["─" "│" "─" "│" "┌" "┐" "┘" "└"]} 
              :layout_config {:height 13}}
        theme (lazy! :telescope.themes :get_ivy opts)]
    (lazy! :telescope.builtin module (theme))))


(keybinds {1            {:noremap true :silent true}
           :<leader>v   ["Split Window [V]ertically" vim.cmd.vsplit]})

(keybinds {1            {:noremap true :silent true}
            :<leader>g  ["Open Neo[g]it"        (lazy! :neogit :open {})]
            :<leader>m  ["Toggle Undo Tree"     (lazy! :undotree :toggle)]
            :<leader>b  ["Current [B]uffers"    (telescope :buffers)]
            :<leader>f  ["[F]ind Files"         (telescope :find_files)]
            :<leader>s  ["Live Grep ([S]earch)" (telescope :live_grep)]})
            ;vim.g.maplocalleader                (wk.show vim.g.maplocalleader {:mode :n}))

(autocmd! :LspAttach {}
  (keybinds {1           {:buffer $1.buf :noremap true :silent true} 
             :<leader>x  ["View Problems"          (lazy! :trouble :toggle "diagnostics")]
             :K          ["Hover Info"             vim.lsp.buf.hover]
             :gd         ["Goto symbol definition" (telescope :lsp_definitions)]
             :gi         ["Goto implementation"    (telescope :lsp_implementation)]
             :<leader>lf ["Format File"            vim.lsp.buf.format]
             :<leader>la ["Code Action"            vim.lsp.buf.code_action]
             :<leader>lr ["Rename Symbol"          vim.lsp.buf.rename]
             :<leader>ls ["View Buffer Symbols"    (telescope :lsp_document_symbols)]
             :gr         ["Goto References"        (telescope :lsp_references)]}))
nil
