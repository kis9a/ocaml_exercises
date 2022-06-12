open Big_int ;;

#load "nums.cma"

let ( *~ ) = Big_int.mult_big_int
let ( +~ ) = Big_int.add_big_int
let ( /~ ) = Big_int.div_big_int
let ( -~ ) = Big_int.sub_big_int
let ( ^~ ) = Big_int.mod_big_int
let ( =~ ) = Big_int.eq_big_int
let ( <~ ) = Big_int.lt_big_int
let ( <=~ ) = Big_int.le_big_int
let ( >=~ ) = Big_int.ge_big_int
let ( >~ ) = Big_int.gt_big_int

let largest_prime_factor_4 n =
  let nh =
    (Big_int.big_int_of_int n /~ Big_int.big_int_of_int 2)
    +~ Big_int.big_int_of_int 1
  in
  let is_prime n =
    let rec loop i =
      if i <~ n /~ Big_int.big_int_of_int 2 then
        if n ^~ i =~ Big_int.zero_big_int then false
        else loop (i +~ Big_int.big_int_of_int 1)
      else true
    in
    loop (Big_int.big_int_of_int 2)
  in
  let find lst =
    List.find
      (function
        | x ->
            Big_int.big_int_of_int n ^~ x =~ Big_int.zero_big_int && is_prime x)
      lst
  in
  let ns n =
    let rec loop i =
      if i >~ Big_int.zero_big_int then i :: loop (i -~ Big_int.big_int_of_int 1)
      else []
    in
    loop nh
  in
  find (ns n)
;;

Printf.printf "%s\n" (string_of_big_int (largest_prime_factor_4 13195)) ;;
Printf.printf "%s\n" (string_of_big_int (largest_prime_factor_4 129094))
