#load "nums.cma"

let power_digit_sum x y =
  let rec sum_digits str acc =
    match str with
    | s when s = "" -> acc
    | s ->
        sum_digits (String.sub str 1 (String.length str - 1)) acc
        + int_of_string (String.sub str 0 1)
  in
  sum_digits (Big_int.string_of_big_int (Big_int.power_int_positive_int x y)) 0
;;

Printf.printf "%d" (power_digit_sum 2 1000)
