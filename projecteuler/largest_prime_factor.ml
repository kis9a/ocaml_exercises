let largest_prime_factor n =
  let is_prime n =
    let rec loop i =
      if i < n / 2 then if n mod i = 0 then false else loop (i + 1) else true
    in
    loop 2
  in
  let rec num lst acc =
    match lst with
    | [] -> acc
    | a :: b -> if is_prime a && n mod a = 0 then num b a else num b acc
  in
  let nums n =
    let rec loop i = if i < n then i :: loop (i + 1) else [] in
    loop 2
  in
  num (nums n) 0
;;

Printf.printf "%d\n" (largest_prime_factor 13195) ;;
Printf.printf "%d\n" (largest_prime_factor 129094)

let rec largest_prime_factor_2 n i =
  let is_prime n =
    let rec loop i =
      if i < n / 2 then if n mod i = 0 then false else loop (i + 1) else true
    in
    loop 2
  in
  match i with
  | i ->
      if is_prime i && n mod i = 0 then i else largest_prime_factor_2 n (pred i)
;;

Printf.printf "%d\n" (largest_prime_factor_2 13195 ((13195 / 2) + 1)) ;;
Printf.printf "%d\n" (largest_prime_factor_2 129094 ((129094 / 2) + 1))

let largest_prime_factor_3 n =
  let nh = (n / 2) + 1 in
  let is_prime n =
    let rec loop i =
      if i < n / 2 then if n mod i = 0 then false else loop (i + 1) else true
    in
    loop 2
  in
  let find lst = List.find (function x -> n mod x = 0 && is_prime x) lst in
  let ns n =
    let rec loop i = if i > 0 then i :: loop (i - 1) else [] in
    loop nh
  in
  find (ns n)
;;

Printf.printf "%d\n" (largest_prime_factor_3 13195) ;;
Printf.printf "%d\n" (largest_prime_factor_3 129094)
