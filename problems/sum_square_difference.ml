let sum_square_difference n =
  let square n = n * n in
  let total_nature_n n = n * (n + 1) / 2 in
  let rec total_squares i acc =
    match i with
    | i when i < 0 -> acc
    | i -> total_squares (pred i) (acc + square i)
  in
  square (total_nature_n n) - total_squares n 0
;;

Printf.printf "%d" (sum_square_difference 10)
