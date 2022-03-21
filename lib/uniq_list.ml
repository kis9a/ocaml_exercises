let rec uniq_list list =
  match list with
  | [] -> []
  | [a] -> [a]
  | a :: b :: c -> if a = b then uniq_list (b :: c) else a :: uniq_list (b :: c)
