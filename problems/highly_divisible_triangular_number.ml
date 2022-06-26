let divisors_count n =
  let rec count i acc =
    if i > 0 then
      if n mod i = 0 then count (pred i) (succ acc) else count (pred i) acc
    else acc
  in
  count n 0
;;

Printf.printf "%d\n" (divisors_count 15) ;;
Printf.printf "%d\n" (divisors_count 28)

let highly_divisible_triangular_number n =
  let rec find i incr =
    if divisors_count i >= n then i else find (i + succ incr) (succ incr)
  in
  find 1 1
;;

Printf.printf "%d\n" (highly_divisible_triangular_number 6)

let time f =
  let start = Sys.time () in
  let _ = f () in
  let end_ = Sys.time () in
  end_ -. start

let time_average f n =
  let rec loop i acc = if i < n then loop (succ i) (time f +. acc) else acc in
  loop 1 (float_of_int 0) /. float_of_int n
;;

Printf.printf "%d\n" (highly_divisible_triangular_number 150) ;;

Printf.printf
  "%f"
  (time_average (fun x -> highly_divisible_triangular_number 100) 10)

let ( *~ ) = Int64.mul
let ( +~ ) = Int64.add
let ( /~ ) = Int64.div
let ( -~ ) = Int64.sub
let ( ^~ ) = Int64.rem

let divisors_count_int64 n =
  let rec count i acc =
    if i > Int64.zero then
      if n ^~ i = Int64.zero then count (Int64.pred i) (Int64.succ acc)
      else count (Int64.pred i) acc
    else acc
  in
  count n Int64.zero
;;

Printf.printf "%s\n" (Int64.to_string (divisors_count_int64 15L)) ;;
Printf.printf "%s\n" (Int64.to_string (divisors_count_int64 28L))

let highly_divisible_triangular_number_int64 n =
  let rec find i incr =
    if divisors_count_int64 i >= n then i
    else find (i +~ Int64.succ incr) (Int64.succ incr)
  in
  find 1L 1L
;;

Printf.printf
  "%s\n"
  (Int64.to_string (highly_divisible_triangular_number_int64 6L))
