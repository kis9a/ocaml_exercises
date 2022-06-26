let ( *~ ) = Int64.mul
let ( +~ ) = Int64.add
let ( /~ ) = Int64.div
let ( -~ ) = Int64.sub
let ( ^~ ) = Int64.rem

let summation_of_primes_int64 n =
  let is_prime_int64 n =
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
  in
  let rec sum_list lst =
    match lst with [] -> Int64.zero | a :: b -> a +~ sum_list b
  in
  let ns n =
    let rec loop i =
      if i > Int64.zero then
        if is_prime_int64 i then i :: loop (i -~ 1L) else loop (i -~ 1L)
      else []
    in
    loop n
  in
  sum_list (ns n)
;;

Printf.printf
  "%s\n"
  (Int64.to_string (summation_of_primes_int64 (Int64.of_int 2000000)))

let time f =
  let start = Sys.time () in
  let _ = f () in
  let end_ = Sys.time () in
  end_ -. start
;;

Printf.printf
  "%f"
  (time (fun x -> summation_of_primes_int64 (Int64.of_int 2000000)))
