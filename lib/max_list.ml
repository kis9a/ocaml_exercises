let rec max list =
  match list with
  | [] -> raise Not_found
  | [a] -> a
  | [a; b] -> if a > b then a else b
  | first :: second :: rest ->
      if first > second then max (first :: rest) else max (second :: rest)
