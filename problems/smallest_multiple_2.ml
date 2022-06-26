let rec print_list = function
  | [] -> ()
  | e :: l ->
      print_int e ;
      print_string " " ;
      print_list l

let smallest_multiple n =
  let rec gcd a b = if b = 0 then a else gcd b (a mod b) in
  let rec lcm lst =
    match lst with
    | [] -> 0
    | [a] -> a
    | a :: b :: c -> lcm ((a * b / gcd a b) :: c)
  in
  let ns n =
    let rec loop i = if i > 0 then i :: loop (i - 1) else [] in
    loop n
  in
  lcm (ns n)
;;

Printf.printf "%d\n" (smallest_multiple 5) ;;
Printf.printf "%d\n" (smallest_multiple 7) ;;
Printf.printf "%d\n" (smallest_multiple 10) ;;
Printf.printf "%d\n" (smallest_multiple 20)
