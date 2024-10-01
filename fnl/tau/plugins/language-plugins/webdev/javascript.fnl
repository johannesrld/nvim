[{1 "pmizio/typescript-tools.nvim"
  :dependencies ["nvim-lua/plenary.nvim" "neovim/nvim-lspconfig"]
  :lazy true
  :ft ["typescript" "javascript" "tsx" "jsx"]
  :config (fn []
            ((. (require :typescript-tools) :setup) {})
            ((. (. (require :lspconfig) :typescript-tools) :launch)))}]
