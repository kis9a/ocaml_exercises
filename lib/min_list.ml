let rec min list =
  match list with
  | [] -> raise Not_found
  | [a] -> a
  | [a; b] -> if a < b then a else b
  | first :: second :: rest ->
      if first < second then min (first :: rest) else min (second :: rest)
