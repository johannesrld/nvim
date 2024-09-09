;; extends

;(template_substitution
;  [
;    "${"
;    "}"
;  ] @keyword)
["=>" "async" ] @keyword
(generator_function_declaration "*" @keyword)
(lexical_declaration "const" (variable_declarator name: (identifier) @constant))
;(regex "/" @vscLightRed)
;(regex "/" @vscLightRed)
(regex_flags) @keyword
;((string_fragment) @string
;  (#eq? @string "use strict")) 
;
;(program 
;  (comment)?
;  (hash_bang_line)?
;  .
;  (expression_statement 
;    . 
;    (string 
;      (string_fragment) @keyword.directive 
;        (#eq? @keyword.directive "use strict"))))
;(function_declaration 
;  body: 
;    (statement_block 
;      (comment)?
;      . 
;      (expression_statement 
;        (string
;          (string_fragment) @keyword.directive 
;            (#eq? @keyword.directive "use strict")))))
;(arrow_function 
;  body: 
;    (statement_block 
;      (comment)?
;      .
;      (expression_statement 
;        (string 
;          (string_fragment) @keyword.directive 
;            (#eq? @keyword.directive "use strict")))))
;
;(variable_declarator name: (identifier) @function
;                     value: (arrow_function))
;(variable_declarator name: (identifier) @function
;                     value: (function_expression))
;(function_expression
;  body: (statement_block
;          (comment)?
;          .
;          (expression_statement
;            (string
;              (string_fragment) @keyword.directive
;                (#eq? @keyword.directive "use strict")))))
;
;(ERROR "function" . (identifier) @function)
;(ERROR "class" . (identifier) @type)
;
