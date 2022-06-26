let quadratic_primes x =
  let is_prime n =
    match n with
    | n when n < 0 -> raise (Failure "Not nature")
    | n when n > Int.max_int -> raise (Failure "Big int not supported")
    | n when n = 1 -> false
    | n when n = 2 -> true
    | n when n mod 2 = 0 -> false
    | n ->
        let s = int_of_float (sqrt (float_of_int n)) in
        Printf.printf "%d\n" s ;
        let rec r i acc =
          if i <= s then if n mod i = 0 then false else r (i + 2) true else true
        in
        r 3 true
  in
  let rec loop lst = loop [] in
  loop []
