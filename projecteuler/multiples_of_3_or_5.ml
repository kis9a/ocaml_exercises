let rec print_list = function
  | [] -> ()
  | e :: l ->
      print_int e ;
      print_string " " ;
      print_list l

let multiples_of_3_or_5 n =
  let rec add lst acc =
    match lst with
    | [] -> acc
    | a :: b ->
        if a mod 3 = 0 || a mod 5 = 0 then add b (acc + a) else add b acc
  in
  let nums n =
    let rec loop i = if i < n then i :: loop (i + 1) else [] in
    loop 2
  in
  add (nums n) 0
;;

Printf.printf "%d" (multiples_of_3_or_5 10) ;;
Printf.printf "%d" (multiples_of_3_or_5 1000)
