let abc086_a a b =
  let is_even_product a b =
    let is_even n = if n mod 2 = 0 then true else false in
    is_even (a * b)
  in
  if is_even_product a b then Printf.printf "Even" else Printf.printf "Odd"
;;

abc086_a 3 4 ;
Printf.printf "\n" ;
abc086_a 1 21
