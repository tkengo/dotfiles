;; extends

(import_statement
  (import_clause
    (identifier) @type
    )
  )

(pair
  key: (property_identifier) @property.key
  )

(variable_declarator
  name: (identifier) @variable
  )

["const"] @keyword.const
["async" "await"] @keyword.operator
; (variable_declarator
;   name: (identifier) @variable
;   value: (arrow_function))
; (variable_declarator
;   name: (identifier) @variable
;   value: (function))
