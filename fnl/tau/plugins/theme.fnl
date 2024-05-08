[ {:opts {:group_overrides {"@character.printf" {:link :SpecialChar}
                            "@constant.builtin.commonlisp" {:link "@constant"}
                            "@lsp.type.formatSpecifier" {:link "@keyword"}
                            "@lsp.type.function.clojure" {:link :none}
                            "@lsp.type.variable.clojure" {:link :none}
                            "@p9.commonlisp.special_var" {:fg "#D16969"}
                            "@p9.operator.arrow_func" {:link "@keyword"}
                            "@p9.tag.identifier" {:link "@variable"}
                            "@p9.template_literal" {:link "@keyword"}
                            "@p9.type" {:link "@type"}
                            "@string.escape" {:link "@stringEscape"}
                            "@string.special.symbol" {:link "@constant"}
                            "MatchParen" {:bg :none :bold true :fg "#18a2fe"}
                            "SpecialChar" {:link "@variable"}}
          :transparent false}
   :dir "~/projects/neovim/vscode.nvim"
   :init #(vim.cmd "colorscheme vscode")
   :priority 1000}
 {1 :uga-rosa/ccc.nvim
  :event :BufRead
  :lazy true
  :opts {:highlighter {:auto_enable true}}}
 {1 :echasnovski/mini.statusline
  :opts {:set_vim_settings false :use_icons false}
  :version false}]
