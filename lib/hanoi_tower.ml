let print_hanoi (from, to_) =
  print_string ("fromt " ^ from ^ " to " ^ to_ ^ "\n")

let rec hanoi (n, from, to_, via) =
  if n = 1 then print_hanoi (from, to_)
  else (
    hanoi (n - 1, from, via, to_) ;
    print_hanoi (from, to_) ;
    hanoi (n - 1, via, to_, from))
