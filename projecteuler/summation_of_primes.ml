(* #load "nums.cma" *)

let ( *~ ) = Big_int.mult_big_int
let ( +~ ) = Big_int.add_big_int
let ( /~ ) = Big_int.div_big_int
let ( -~ ) = Big_int.sub_big_int
let ( ^~ ) = Big_int.mod_big_int

(* let summation_of_primes_big n = *)
(*   let is_prime n = *)
(*     match n with *)
(*     | n when n < Big_int.zero_big_int -> raise (Failure "Not nature") *)
(*     | n when n = Big_int.big_int_of_int 1 -> false *)
(*     | n when n = Big_int.big_int_of_int 2 -> true *)
(*     | n when n ^~ Big_int.big_int_of_int 2 = Big_int.zero_big_int -> false *)
(*     | n -> *)
(*         let s = (Big_int.sqrt_big_int n) in *)
(*         let rec r i acc = *)
(*           if i <= s then *)
(*             if n ^~ i = Big_int.zero_big_int then false *)
(*             else r (i +~ Big_int.big_int_of_int 2) true *)
(*           else true *)
(*         in *)
(*         r (Big_int.big_int_of_int 3) true *)
(*   in *)
(*   let rec sum_list lst = match lst with [] -> 0 | a :: b -> a + sum_list b in *)
(*   (1* let ns n = *1) *)
(*   (1*   let rec loop i = *1) *)
(*   (1*     if i > Big_int.zero_big_int then *1) *)
(*   (1*       if is_prime i then i :: loop (i - 1) else loop (i - 1) *1) *)
(*   (1*     else [] *1) *)
(*   (1*   in *1) *)
(*   (1*   loop n *1) *)
(*   (1* in *1) *)
(*   (1* sum_list (ns n) *1) *)

let summation_of_primes n =
  let is_prime n =
    match n with
    | n when n < 0 -> raise (Failure "Not nature")
    | n when n > Int.max_int -> raise (Failure "Big int not supported")
    | n when n = 1 -> false
    | n when n = 2 -> true
    | n when n mod 2 = 0 -> false
    | n ->
        let s = int_of_float (sqrt (float_of_int n)) in
        let rec r i acc =
          if i <= s then if n mod i = 0 then false else r (i + 2) true else true
        in
        r 3 true
  in
  let rec sum_list lst = match lst with [] -> 0 | a :: b -> a + sum_list b in
  let ns n =
    let rec loop i =
      if i > 0 then if is_prime i then i :: loop (i - 1) else loop (i - 1)
      else []
    in
    loop n
  in
  sum_list (ns n)
;;

Printf.printf "%d" (summation_of_primes 10)
(* summation_of_primes 10 *)
(* Printf.printf "%d" (summation_of_primes 2000000); *)
