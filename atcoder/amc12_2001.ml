let a = 3
let b = 4
let c = 5
let n = 2001

let rec totalf i k =
  match i with
  | i when i == n - 1 -> k
  | i when i mod a == 0 || i mod b == 0 ->
      if i mod c == 0 then totalf (i + 1) k else totalf (i + 1) (k + 1)
  | i -> totalf (i + 1) k

let rec totalf2 =
  let na = n / a in
  let nb = n / b in
  let nab = n / (a * b) in
  na + nb - nab - ((n / (c * a)) + (n / (c * b)) - (n / (c * a * b)))
;;

Printf.printf
  "例題1(AMC12/2001) 2001以下の正の整数であって，3もしくは4の倍数であるが，5の倍数でないようなものはいくつあるか。\n"

let _ = Random.self_init () ;;

Printf.printf "%d\n" (totalf 1 1) ;
Printf.printf "%d" totalf2
