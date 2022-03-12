let rec even lst =
  match lst with
  | [] -> []
  | first :: rest -> if first mod 2 = 0 then first :: even rest else even rest
