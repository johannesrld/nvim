;; extends

(template_substitution
  [
    "${"
    "}"
  ] @p9.template_literal)
["=>" "async" ] @keyword
(generator_function_declaration "*" @keyword)
(lexical_declaration "const" (variable_declarator name: (identifier) @constant))
(regex "/" @vscLightRed)
(regex "/" @vscLightRed)
(regex_flags) @keyword
((string_fragment) @string
  (#eq? @string "use strict")) 

(program 
  . 
  (expression_statement 
    . 
    (string 
      (string_fragment) @keyword.directive 
        (#eq? @keyword.directive "use strict"))))
(function_declaration 
  body: 
    (statement_block 
      . 
      (expression_statement 
        (string 
          (string_fragment) @keyword.directive 
            (#eq? @keyword.directive "use strict")))))
(arrow_function 
  body: 
    (statement_block 
      . 
      (expression_statement 
        (string 
          (string_fragment) @keyword.directive 
            (#eq? @keyword.directive "use strict")))))

(variable_declarator name: (identifier) @function
                     value: (arrow_function))

(ERROR "function" . (identifier) @function)
(ERROR "class" . (identifier) @type)
