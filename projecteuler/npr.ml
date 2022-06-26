let npr n r =
  let rec f n r = if n < r then 1 else n * f (n - 1) r in
  f n (n - r + 1)
;;

(* 720 *)
Printf.printf "%d\n" (npr 10 3)
