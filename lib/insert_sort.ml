let rec insert lst n =
  match lst with
  | [] -> [n]
  | first :: rest ->
      if n <= first then n :: first :: rest else first :: insert rest n

let rec sort lst =
  match lst with [] -> [] | first :: rest -> insert (sort rest) first
