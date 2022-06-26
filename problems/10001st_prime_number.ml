let nst_prime_number k n =
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
  let ns n =
    let rec loop i acc =
      if i < n then
        let is = is_prime i in
        if is then if acc = k then i else loop (i + 2) (succ acc)
        else loop (i + 2) acc
      else raise (Failure "a")
    in
    loop 3 2
  in
  ns n
;;

Printf.printf "%d\n" (nst_prime_number 6 200000) ;;
Printf.printf "%d\n" (nst_prime_number 10001 200000)
