let primes = [2; 3; 5; 7; 17; 19; 101; 103]
let unprimes = [1; 4; 6; 9; 14; 20; 108; 77; 21]

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

let test_is_prime =
  let rec test_primes lst acc =
    match lst with
    | [] -> acc
    | a :: b ->
        test_primes
          b
          (if is_prime a then acc
          else (
            Printf.printf "test_primes: %d\n" a ;
            false))
  and test_unprimes lst acc =
    match lst with
    | [] -> acc
    | a :: b ->
        test_unprimes
          b
          (if is_prime a then (
           Printf.printf "test_unprimes: %d\n" a ;
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

Printf.printf "%f\n" (time_average (fun () -> is_prime 111111234911111) 10)

let is_prime_2 n =
  let rec loop i =
    if i < n then if n mod i = 0 then false else loop (succ i) else true
  in
  loop 2
;;

Printf.printf "%b" (is_prime_2 9) ;;
Printf.printf "%f\n" (time_average (fun () -> is_prime_2 111111234911111) 2)
