#load "nums.cma"

let ( *~ ) = Big_int.mult_big_int
let ( +~ ) = Big_int.add_big_int
let ( /~ ) = Big_int.div_big_int
let ( -~ ) = Big_int.sub_big_int
let ( ^~ ) = Big_int.mod_big_int

let primes =
  [ Big_int.big_int_of_int 2;
    Big_int.big_int_of_int 3;
    Big_int.big_int_of_int 5;
    Big_int.big_int_of_int 7;
    Big_int.big_int_of_int 17;
    Big_int.big_int_of_int 19;
    Big_int.big_int_of_int 101;
    Big_int.big_int_of_int 103 ]

let unprimes =
  [ Big_int.big_int_of_int 1;
    Big_int.big_int_of_int 4;
    Big_int.big_int_of_int 6;
    Big_int.big_int_of_int 9;
    Big_int.big_int_of_int 14;
    Big_int.big_int_of_int 20;
    Big_int.big_int_of_int 108;
    Big_int.big_int_of_int 77;
    Big_int.big_int_of_int 21 ]

let big_ints =
  [ Big_int.big_int_of_int 111111234911111;
    Big_int.big_int_of_string "11111123491129134091411" ]

let is_prime n =
  match n with
  | n when n < Big_int.zero_big_int -> raise (Failure "Not nature")
  | n when n = Big_int.big_int_of_int 1 -> false
  | n when n = Big_int.big_int_of_int 2 -> true
  | n when n ^~ Big_int.big_int_of_int 2 = Big_int.zero_big_int -> false
  | n ->
      let s = Big_int.sqrt_big_int n in
      let rec r i acc =
        if i <= s then
          if n ^~ i = Big_int.zero_big_int then false
          else r (i +~ Big_int.big_int_of_int 2) true
        else true
      in
      r (Big_int.big_int_of_int 3) true

let test_is_prime =
  let rec test_primes lst acc =
    match lst with
    | [] -> acc
    | a :: b ->
        test_primes
          b
          (if is_prime a then acc
          else (
            Printf.printf "test_primes: %s\n" (Big_int.string_of_big_int a) ;
            false))
  and test_unprimes lst acc =
    match lst with
    | [] -> acc
    | a :: b ->
        test_unprimes
          b
          (if is_prime a then (
           Printf.printf "test_unprimes: %s\n" (Big_int.string_of_big_int a) ;
           false)
          else acc)
  and test_big_ints lst acc =
    match lst with
    | [] -> acc
    | a :: b ->
        test_big_ints
          b
          (if is_prime a then (
           Printf.printf "test_big_ints: %s\n" (Big_int.string_of_big_int a) ;
           false)
          else acc)
  in
  test_primes primes true
  && test_unprimes unprimes true
  && test_big_ints big_ints true
