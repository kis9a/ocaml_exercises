let rec merge lst1 lst2 =
  match (lst1, lst2) with
  | [], [] -> []
  | [], _ :: _ -> lst2
  | _ :: _, [] -> lst1
  | first1 :: rest1, first2 :: rest2 ->
      if first1 < first2 then first1 :: merge rest1 lst2
      else first2 :: merge lst1 rest2
