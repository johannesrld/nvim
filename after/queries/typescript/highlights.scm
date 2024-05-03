;; extends

(literal_type (null) @p9.type)
(literal_type (undefined) @p9.type) ; unrelated but technically undefined isnt a keyword and is just a global variable, thanks Eich!

(template_type
  [
    "${"
    "}"
  ] @p9.template_literal)
