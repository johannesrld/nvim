;; extends
(_ (unit) @number)
(plain_value) @string
(id_selector) @type
(id_name) @type
(tag_name) @type
(nesting_selector) @keyword
((plain_value) @variable (#match? @variable "^--") (#set! "priority" 101))
(scope_statement ["@scope" "to"] @keyword)
((unit) @keyword (#set! "priority" 101))
