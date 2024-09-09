;; extends

(table_constructor
  [
    "{"
    "}"
  ] @punctuation.bracket)
((identifier) @variable.builtin
  (#eq? @variable.builtin "self") (#set! priority 130))
