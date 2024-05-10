(import-macros {: autocmd! : ol!} "tau.macros")
[{1 "NeogitOrg/neogit"
  :cmd "Neogit"
  :lazy true
  :opts {:integrations {:diffview true}}
  :dependencies ["nvim-lua/plenary.nvim"]
  :init 
    #(autocmd! :FileType {:pattern ["NeogitStatus" "NeogitPopup" "NeogitCommitView" 
                                    "NeogitConsole" "NeogitLogView" "NeogitReflogView" 
                                    "NeogitCommitSelectView" "NeogitStatusNew" "NeogitRebaseTodo" 
                                    "NeogitPopup"]}
       (ol! spell false)
       (ol! list false)
       (ol! foldlevel 1000))}
 {1 "sindrets/diffview.nvim"
  :lazy true
  :opts 
    {:icons 
      {:folder_closed ">" 
       :folder_open "v"}
     :signs 
      {:done "✓" 
       :fold_closed ">" 
       :fold_open "v"}
     :use_icons false}}
 {1 "lewis6991/gitsigns.nvim" :config true}
 {1 "akinsho/git-conflict.nvim"
  :lazy true
  :cmd ["GitConflictChooseOurs" "GitConflictChooseTheirs"
        "GitConflictChooseBoth" "GitConflictChooseNone"
        "GitConflictNextConflict" "GitConflictPrevConflict"
        "GitConflictListQf"]
  :version "*"}]  
