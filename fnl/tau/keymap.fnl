(local keybinds (require :tau.keybinds.nastybits))
(import-macros {: autocmd! : lazy!} :tau.macros)
(local wk (require :which-key))
(wk.register {:l {:name "+Language Actions"} 
              :t {:name "+Telescope"}}
             {:prefix "<leader>"})
; GRAAAA I LOVE THIS MACRO
(macro lazy! [lib func & var-args]
  `(fn [] ((. (require ,lib) ,func) ,(unpack var-args))))

(fn telescope [module]
  (let [opts {:borderchars   {:preview ["─" "│" "─" "│" "┌" "┐" "┘" "└"]} 
              :layout_config {:height 13}}
        theme ((. (require :telescope.themes) :get_ivy) opts)]
    (lazy! :telescope.builtin module theme)))

(keybinds {1            {:noremap true :silent true}
            :<leader>g  ["Open Neogit"       (lazy! :neogit :open {})]
            :<leader>m  ["Toggle Undo Tree"  (lazy! :undotree :toggle)]
            :<leader>tb ["Current Buffers"   (telescope :buffers)]
            :<leader>tf ["Find Files"        (telescope :find_files)]
            :<leader>tg ["Live Grep"         (telescope :live_grep)]
            :<leader>w  ["Jump to window"    (lazy! :nvim-window :pick)]
            vim.g.maplocalleader             (fn [] (wk.show vim.g.maplocalleader {:mode :n}))})

(autocmd! :LspAttach {:once true} 
  (keybinds {1           {:buffer $1.buf :noremap true :silent true} 
             :<leader>x  ["View Problems"          (lazy! :trouble :toggle)]
             :K          ["Hover Info"             vim.lsp.buf.hover]
             :gd         ["Goto symbol definition" vim.lsp.buf.definition]
             :gi         ["Goto implementation"    vim.lsp.buf.implementation]
             :<leader>lf ["Format File"            vim.lsp.buf.format]
             :<leader>la ["Code Action"            vim.lsp.buf.code_action]
             :<leader>lr ["Rename Symbol"          vim.lsp.buf.rename]
             :<leader>ls ["View Buffer Symbols"    (telescope :lsp_document_symbols)]
             :gr         ["Goto References"        (telescope :lsp_references)]}))
nil
