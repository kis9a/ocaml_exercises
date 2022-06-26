let rec power (x, y) = if y = 0 then 1 else x * power (x, y - 1)

let rec uniq_list lst =
  match lst with
  | [] -> []
  | h :: t -> h :: uniq_list (List.filter (fun x -> x <> h) t)

let rec factors n =
  if n < 2 then []
  else if n mod 2 = 0 then 2 :: factors (n / 2)
  else if n mod 3 = 0 then 3 :: factors (n / 3)
  else
    let rec factor_gt d n =
      if n < d * d then [n]
      else if n mod d = 0 then d :: factor_gt d (n / d)
      else if n mod (d + 2) = 0 then (d + 2) :: factor_gt d (n / (d + 2))
      else factor_gt (d + 6) n
    in
    factor_gt 5 n

let rec power (x, y) = if y = 0 then 1 else x * power (x, y - 1)

let rec divisor_sum n =
  let lst = factors n in
  let rec o i x acc =
    match i with
    | i when i = 0 -> succ acc
    | i -> o (pred i) x (acc + power (x, i))
  in
  let rec loop lstn acc =
    match lstn with
    | [] -> acc
    | a :: b ->
        let len = List.length (List.find_all (fun x -> x = a) lst) in
        loop b (acc * o len a 0)
  in
  loop (uniq_list lst) 1 - n

let non_abundant_sum n =
  let ns n =
    let rec loop i = if i > 0 then i :: loop (i - 1) else [] in
    loop n
  in
  let n_lst = ns n in
  let abundants n = List.filter (fun x -> divisor_sum x > x) n_lst in
  let a_lst = abundants n in
  let arr_abundants_sums lst =
    let rec loop lst acc =
      match lst with [] -> acc | a :: b -> loop b (loop2 a lst acc)
    and loop2 an lst acc =
      match lst with
      | [] -> acc
      | a :: b ->
          let sum = a + an in
          loop2
            an
            b
            (if sum <= n then (
             acc.(sum) <- true ;
             acc)
            else acc)
    in
    loop lst (Array.make (succ n) false)
  in
  let arr = arr_abundants_sums a_lst in
  let sum n =
    let rec loop i acc =
      if i > 0 then loop (pred i) (if arr.(i) <> true then acc + i else acc)
      else acc
    in
    loop n 0
  in
  sum n
;;

(* 28 *)
Printf.printf "%d\n" (non_abundant_sum 28) ;;

(* 4179871 *)
Printf.printf "%d\n" (non_abundant_sum 28123)
