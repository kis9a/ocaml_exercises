open Big_int
open Printf ;;

#load "nums.cma"

let ( *~ ) = mult_big_int
let ( +~ ) = add_big_int
let ( /~ ) = div_big_int
let ( -~ ) = sub_big_int
let ( ^~ ) = mod_big_int

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

let largest_prime_factor_4 n =
  let nh = (big_int_of_int n /~ big_int_of_int 2) +~ big_int_of_int 1 in
  let is_prime n =
    let rec loop i =
      if i < n /~ big_int_of_int 2 then
        if n ^~ i = zero_big_int then false else loop (i +~ big_int_of_int 1)
      else true
    in
    loop (big_int_of_int 2)
  in
  let find lst =
    List.find
      (function x -> big_int_of_int n ^~ x = zero_big_int && is_prime x)
      lst
  in
  let ns n =
    let rec loop i =
      if i > zero_big_int then i :: loop (i -~ big_int_of_int 1) else []
    in
    loop nh
  in
  find (ns n)
;;

Printf.printf "%s\n" (string_of_big_int (largest_prime_factor_4 13195)) ;;

Printf.printf
  "%s\n"
  (string_of_big_int (largest_prime_factor_4 (big_int_of_int 129094)))
