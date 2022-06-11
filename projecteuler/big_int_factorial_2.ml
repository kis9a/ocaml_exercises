open Big_int
open Printf ;;

#load "nums.cma"

let ( *~ ) = mult_big_int
let ( +~ ) = add_big_int
let ( /~ ) = div_big_int
let ( -~ ) = sub_big_int

let factorialn n =
  let rec fac_big_int n acc =
    if n = 0 then acc
    else fac_big_int (pred n) (mult_big_int (big_int_of_int n) acc)
  in
  fac_big_int n unit_big_int

let falling_factorial n x =
  let rec falling nf xf acc =
    match xf with
    | xf when xf = 1 -> big_int_of_int nf *~ acc
    | xf when nf < 0 -> raise (Failure "nf must be positive")
    | xf when xf > n -> raise (Failure "xf can't be greater than n")
    | xf -> falling (pred nf) (pred xf) (big_int_of_int nf *~ acc)
  in
  falling n x unit_big_int

let probability_of_duplicate_x_in_n n x =
  1.0
  -. float_of_big_int (falling_factorial n x)
     /. float_of_big_int (power_int_positive_int n x)
;;

Printf.printf "%s\n" (string_of_big_int (falling_factorial 365 30)) ;;
Printf.printf "%s\n" (string_of_big_int (power_int_positive_int 365 30)) ;;

Printf.printf
  "%s\n"
  (string_of_big_int
     (falling_factorial 365 30 /~ power_int_positive_int 365 30))
;;

Printf.printf
  "%f"
  (1.0
  -. float_of_big_int (falling_factorial 365 30)
     /. float_of_big_int (power_int_positive_int 365 30))

let rec falling_factorial n x =
  match x with
  | x when x = 0 ->
      Printf.printf "x = 0\n" ;
      1
  | x when n < 0 -> raise (Failure "n must be positive")
  | x when x > n -> raise (Failure "x can't be greater than n")
  | x ->
      let r = n * falling_factorial (n - 1) (x - 1) in
      Printf.printf "%d: %d: %d\n" n x r ;
      r
;;

Printf.printf "%d\n" (falling_factorial 10 3)

let rec add n x = match n with n when n = 0 -> x | n -> n * add (pred n) x ;;

Printf.printf "%d\n" (add 3 2)

let rec add2 n x = match n with n when n = 0 -> x | n -> add2 (pred n) x ;;

Printf.printf "%d" (add2 3 49) ;;
Printf.printf "%f\n" (probability_of_duplicate_x_in_n 365 30) ;;
Printf.printf "%f\n" (probability_of_duplicate_x_in_n 10 5) ;;
Printf.printf "%f\n" (probability_of_duplicate_x_in_n 20 10) ;;
Printf.printf "%f\n" (probability_of_duplicate_x_in_n 365 23)
