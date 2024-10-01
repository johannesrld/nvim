(import-macros {: g!} "tau.macros")
(g! nvlime_config {:cmp {:enabled true}})
[{1 "johannesrld/parinfer-rust"
  :event "InsertEnter"
  :lazy true
  :branch "fix-undo-explosions"
  :build "cargo build --release"}
 {1 "Olical/conjure" :ft ["lisp" "scheme" "fennel" "clojure" "janet" "racket" "rust" "lua" "python" "julia"]}
 {1 "PaterJason/cmp-conjure" :ft ["lisp" "scheme" "fennel" "clojure" "janet" "racket" "rust" "lua" "python" "julia"]}]
;{1 "monkoose/nvlime"
; :ft ["lisp"]
; :dependencies ["https://github.com/monkoose/parsley"]}  
