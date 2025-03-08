; extends
;(accumulation_verb) @keyword
;(for_clause ["for" "and" "as"] @keyword.repeat)
;(for_clause_word) @keyword.repeat
;(repeat_clause "repeat" @keyword.repeat)
;(while_clause ["while" "until"] @keyword.repeat)
;(do_clause "do" @keyword)
;(with_clause ["with" "="] @keyword.repeat)
;(condition_clause ["when" "if" "unless" "always" "thereis" "never" "else"] @keyword.conditional)
;(termination_clause ["finally" "return" "initially"] @keyword.return)
;(format_specifier) @string.special
;(format_modifiers (num_lit) @number)
;(format_specifier (format_directive_type "%")) @string.escape
;(format_specifier (format_directive_type "&")) @string.escape
;(format_specifier (format_directive_type "_")) @string.escape
;(format_specifier (format_directive_type "|")) @string.escape
;(format_specifier (format_directive_type "Newline")) @string.escape
;(format_specifier (format_directive_type) @keyword (#lua-match? @keyword "[{}]")) @keyword
;(format_specifier (format_directive_type) @keyword (#lua-match? @keyword "[()]")) @keyword
;(format_specifier (format_directive_type) @keyword (#lua-match? @keyword "[%[%]]")) @keyword
;(keyword_symbol (symbol) @constant)
((defun_keyword)
 @function.macro.commonlisp
 (#eq? @function.macro.commonlisp "lambda")
 (#set! conceal "λ"))
