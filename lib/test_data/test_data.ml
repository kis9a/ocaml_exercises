let check msg x = Alcotest.(check bool) msg true x

(* even *)
let test_even () =
  check "even function result is list of even numbers"
    (Src.Even.even [1; 2; 3; 4] = [2; 4])

(* factorial *)
let test_factorial () =
  check "factorial function, result is factorial of input number"
    (Src.Factorial.factorial 5 = 120)

let test_factorial2 () =
  check
    "factorial used pattern maching function, result is factorial of input \
     number"
    (Src.Factorial.factorial 6 = 720)

let test_factorial_minus () =
  check "factorial function, result is factorial of input number"
    (Src.Factorial.factorial (-3) = 1)

(* square *)
let test_square () =
  check "square function, result is area of input length"
    (Src.Square.square 2. = 4.)

let test_square_decimal () =
  check "square function, result is square of input length"
    (Printf.sprintf "%.4f" (Src.Square.square 0.2) = "0.0400")

let test_square_decimal_fail () =
  check "square function, check equal fail with float calculation"
    (Src.Square.square 0.2 <> 0.0400)

let test_square_minus () =
  check "square function, result is square of input length"
    (Src.Square.square (-6.) = 36.)

(* power *)
let test_power () =
  check "power function, result is power x power y"
    (Src.Power.power (2., 4) = 16.)

let test_power2 () =
  check "power2 function, result is power x power y"
    (Src.Power.power (2., 4) = 16.)

let test_power_decimal () =
  check "power function, result is power x power y"
    (Printf.sprintf "%.4f" (Src.Power.power (0.4, 2)) = "0.1600")

let test_power_minus () =
  check "power function, result is power x power y"
    (Src.Power.power (-2., 3) = -8.)

(* fibonacci *)
let test_fibonacci () =
  check "fibonacci function, result is fibonacci of input number"
    (Src.Fibonacci.fibonacci 11 = 89)

(* function arguments *)
let test_fun_label_arg () =
  check "function by label argument"
    (Src.Fun_args.label_arg ~first:1 ~last:4 = [1; 2; 3; 4])

(* Src.Print_list.print_list (range ~first:1 ~last:10) *)
let test_optional_arg () =
  check "function by optional argument"
    (Src.Fun_args.optional_arg 1 4 = [1; 2; 3; 4])

let test_optional_arg_serve () =
  check "function by optional argument"
    (Src.Fun_args.optional_arg 1 4 ~step:2 = [1; 3])

let tests =
  [ ("even", `Quick, test_even); ("factorial", `Quick, test_factorial)
  ; ("factorial pattern maching", `Quick, test_factorial2)
  ; ("factorial minus input", `Quick, test_factorial_minus)
  ; ("square", `Quick, test_square)
  ; ("square decimal input", `Quick, test_square_decimal)
  ; ("square decimal calculation compare", `Quick, test_square_decimal_fail)
  ; ("square minus input", `Quick, test_square_minus)
  ; ("power", `Quick, test_power); ("power", `Quick, test_power2)
  ; ("power decimal input", `Quick, test_power_decimal)
  ; ("power minus input", `Quick, test_power_minus)
  ; ("fibonacci", `Quick, test_fibonacci)
  ; ("function label arg", `Quick, test_fun_label_arg)
  ; ("function optional arg", `Quick, test_optional_arg)
  ; ("function optional arg serve", `Quick, test_optional_arg_serve) ]
