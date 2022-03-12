let rec sum lst = match lst with [] -> 0 | first :: rest -> first + sum rest
