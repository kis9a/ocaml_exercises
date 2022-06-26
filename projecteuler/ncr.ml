let ncr n x =
  let rec f n x = if n < x then 1 else n * f (n - 1) x in
  f n (n - x + 1) / f x 1
;;

(* 120 *)
Printf.printf "%d" (ncr 10 3)
