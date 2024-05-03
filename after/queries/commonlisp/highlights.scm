;; extends
[
 "("
 ")"
 ] @tag.delimiter

(nil_lit) @boolean


((sym_lit) @boolean (#any-of? @boolean "NIL"))
(list_lit
  .
  value: (sym_lit) @keyword.conditional (#any-of? @keyword.conditional "if" "when" "unless" "cond" "case"))

(list_lit
  .
  value: (sym_lit) @keyword.repeat (#any-of? @keyword.repeat "dotimes" "dolist" "do" "do*" "loop-finish"))



((sym_lit) @constant.builtin
           (#any-of? @constant.builtin "single-float-negative-epsilon"
                     "single-float-epsilon" 
                     "short-float-negative-epsilon"
                     "short-float-epsilon"
                     "pi"
                     "multiple-values-limit"
                     "most-positive-single-float"
                     "most-positive-short-float"
                     "most-positive-long-float"
                     "most-positive-fixnum"
                     "array-dimension-limit"
                     "array-rank-limit"
                     "array-total-size-limit"
                     "boole-1"
                     "boole-2"
                     "boole-and"
                     "boole-andc1"
                     "boole-andc2"
                     "boole-c1"
                     "boole-c2"
                     "boole-clr"
                     "boole-eqv"
                     "boole-ior"
                     "boole-nand"
                     "boole-nor"
                     "boole-orc1"
                     "boole-orc2"
                     "boole-set"
                     "boole-xor"
                     "call-arguments-limit"
                     "char-code-limit"
                     "double-float-epsilon"
                     "double-float-negative-epsilon"
                     "internal-time-units-per-second"
                     "lambda-list-keywords"
                     "lambda-parameters-limit"
                     "least-negative-double-float"
                     "least-negative-long-float"
                     "least-negative-normalized-double-float"
                     "least-negative-normalized-long-float"
                     "least-negative-normalized-short-float"
                     "least-negative-normalized-single-float"
                     "least-negative-short-float"
                     "least-negative-single-float"
                     "least-positive-double-float"
                     "least-positive-long-float"
                     "least-positive-normalized-double-float"
                     "least-positive-normalized-long-float"
                     "least-positive-normalized-short-float"
                     "least-positive-normalized-single-float"
                     "least-positive-short-float"
                     "least-positive-single-float"
                     "long-float-epsilon"
                     "long-float-negative-epsilon"
                     "most-negative-double-float"
                     "most-negative-fixnum"
                     "most-negative-long-float"
                     "most-negative-short-float"
                     "most-negative-single-float"
                     "most-positive-double-float"))

(format_specifier) @string.special
(format_specifier (format_directive_type "%")) @string.escape
(format_specifier (format_directive_type "&")) @string.escape
(format_specifier (format_directive_type "_")) @string.escape
(format_specifier (format_directive_type "|")) @string.escape
(format_specifier (format_directive_type "Newline")) @string.escape
(accumulation_verb) @keyword
((for_clause) _*) @keyword.repeat
(for_clause_word _* @keyword.repeat) @keyword.repeat
((repeat_clause) _*) @keyword.repeat
((while_clause) _*) @keyword.repeat
((do_clause) _*) @keyword
((condition_clause) _*) @keyword.conditional
((termination_clause) _*) @keyword.return
((sym_lit) @p9.commonlisp.special_var (#lua-match? @p9.commonlisp.special_var "^[*].+[*]$"))
