let foo = 42
let return_foo () = foo
let foo = 24 ;;

Printf.printf "%d" (return_foo ())

let foo = ref 42
let return_foo () = !foo ;;

foo := 24 ;;
Printf.printf "%d" (return_foo ())
