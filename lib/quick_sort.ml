let rec partition n x y = function
  | [] -> (x, y)
  | first :: rest ->
      if first < n then partition n (first :: x) y rest
      else partition n x (first :: y) rest

let rec sort = function
  | [] -> []
  | first :: rest ->
      let m, n = partition first [] [] rest in
      sort m @ (first :: sort n)
