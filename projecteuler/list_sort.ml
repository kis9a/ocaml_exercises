let rec print_int_list = function
  | [] -> Printf.printf "\n"
  | a :: b ->
      Printf.printf "%d" a ;
      Printf.printf " " ;
      print_int_list b

let sd lst = List.sort (fun x y -> if x > y then -1 else 1) lst
let su lst = List.sort (fun x y -> if x < y then -1 else 1) lst ;;

print_int_list (sd [4; 2; 7]) ;;
print_int_list (su [4; 2; 7])
