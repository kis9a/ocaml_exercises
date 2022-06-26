let primes =
  [ Int64.of_int 2;
    Int64.of_int 3;
    Int64.of_int 5;
    Int64.of_int 7;
    Int64.of_int 17;
    Int64.of_int 19;
    Int64.of_int 101;
    Int64.of_int 103 ]

let unprimes =
  [ Int64.of_int 1;
    Int64.of_int 4;
    Int64.of_int 6;
    Int64.of_int 9;
    Int64.of_int 14;
    Int64.of_int 20;
    Int64.of_int 108;
    Int64.of_int 77;
    Int64.of_int 21 ]

let big_ints =
  [Int64.of_int 111111234911111; Int64.of_string "12910294141484104"]

let ( *~ ) = Int64.mul
let ( +~ ) = Int64.add
let ( /~ ) = Int64.div
let ( -~ ) = Int64.sub
let ( ^~ ) = Int64.rem

let is_prime (n : int64) =
  match n with
  | n when n < Int64.zero -> raise (Failure "Not nature")
  | n when n > Int64.max_int -> raise (Failure "Big int not supported")
  | n when n = 1L -> false
  | n when n = 2L -> true
  | n when n ^~ 2L = Int64.zero -> false
  | n ->
      let s = Int64.of_float (sqrt (float_of_int (Int64.to_int n))) in
      let rec r i acc =
        if i <= s then if n ^~ i = Int64.zero then false else r (i +~ 2L) true
        else true
      in
      r 3L true

let test_is_prime =
  let rec test_primes lst acc =
    match lst with
    | [] -> acc
    | a :: b ->
        test_primes
          b
          (if is_prime a then acc
          else (
            Printf.printf "test_primes: %s\n" (Int64.to_string a) ;
            false))
  and test_unprimes lst acc =
    match lst with
    | [] -> acc
    | a :: b ->
        test_unprimes
          b
          (if is_prime a then (
           Printf.printf "test_unprimes: %s\n" (Int64.to_string a) ;
           false)
          else acc)
  in
  test_primes primes true && test_unprimes unprimes true
;;

Printf.printf "%b\n" test_is_prime

let time f =
  let start = Sys.time () in
  let _ = f () in
  let end_ = Sys.time () in
  end_ -. start

let time_average f n =
  let rec loop i acc = if i < n then loop (succ i) (time f +. acc) else acc in
  loop 1 (float_of_int 0) /. float_of_int n
;;

Printf.printf
  "%f\n"
  (time_average (fun () -> is_prime (Int64.of_int 111111234911111)) 10)
