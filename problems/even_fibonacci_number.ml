let rec fibonacci_even a b accu =
  let nv = a + b in
  if nv > 4000000 then accu
  else if nv mod 2 = 0 then fibonacci_even b nv (accu + nv)
  else fibonacci_even b nv accu
;;

Printf.printf "%d" (fibonacci_even 1 1 0)
