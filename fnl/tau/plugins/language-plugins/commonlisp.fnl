(import-macros {: g!} "tau.macros")
(g! nvlime_config {:cmp {:enabled true}})
[{1 "johannesrld/parinfer-rust"
  :event "InsertEnter"
  :lazy true
  :branch "fix-undo-explosions"
  :build "cargo build --release"}
  
 {1 "monkoose/nvlime"
  :config (fn [])
  :dependencies ["https://github.com/monkoose/parsley"]}]  
