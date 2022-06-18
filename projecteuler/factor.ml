let rec factor n =
  let rec uniq_list lst =
    match lst with
    | [] -> []
    | h :: t -> h :: uniq_list (List.filter (fun x -> x <> h) t)
  in
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
    let lst = factor_gt 5 n in
    let rec map_factors lstn acc =
      match lstn with
      | [] -> acc
      | a :: b ->
          map_factors
            b
            (List.append
               acc
               [a; List.length (List.find_all (fun x -> x = a) lst)])
    in
    map_factors (uniq_list lst) []
