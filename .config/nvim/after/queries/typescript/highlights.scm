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

"const" @keyword.const
["async" "await"] @keyword.operator
