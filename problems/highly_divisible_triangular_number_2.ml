let divisors n =
  let rec uniq_list lst =
    match lst with
    | [] -> []
    | h :: t -> h :: uniq_list (List.filter (fun x -> x <> h) t)
  in
  let rec factor n =
    if n < 2 then []
    else if n mod 2 = 0 then 2 :: factor (n / 2)
    else if n mod 3 = 0 then 3 :: factor (n / 3)
    else
      let rec factor_gt d n =
        if n < d * d then [n]
        else if n mod d = 0 then d :: factor_gt d (n / d)
        else if n mod (d + 2) = 0 then (d + 2) :: factor_gt d (n / (d + 2))
        else factor_gt (d + 6) n
      in
      factor_gt 5 n
  in
  let lst = factor n in
  let rec rle lstn acc =
    match lstn with
    | [] -> acc
    | a :: b ->
        rle b (acc * (List.length (List.find_all (fun x -> x = a) lst) + 1))
  in
  rle (uniq_list lst) 1

let highly_divisible_triangular_number n =
  let rec find i incr =
    if divisors i >= n then i else find (i + succ incr) (succ incr)
  in
  find 1 1
;;

Printf.printf "%d\n" (highly_divisible_triangular_number 500)

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
