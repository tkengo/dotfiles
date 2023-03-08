;; extends

((identifier) @keyword.rspec
 (#vim-match? @keyword.rspec "^(let!?|it|describe|context|before|after|double|instance_double|class_double|spy|instance_spy|class_spy|response|request)$"))

"nil" @variable.builtin

; (call
;   receiver: (constant)? @type
;   method: [
;            (identifier)
;            (constant)
;            ] @comment
;   )

(call
  receiver: [(identifier) (constant) (call) (integer) (string) (element_reference)]
  method: [(identifier)] @function.call.noargs
  )

(call
  receiver: [(identifier) (constant) (call) (integer) (string) (element_reference)]
  method: [(identifier)] @function.call
  arguments: [(argument_list)]
  )
