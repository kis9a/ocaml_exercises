let rec duplicates lst lstn =
  List.find_all (fun i -> List.exists (fun j -> i = j) lst) lstn

let rec print_int_list = function
  | [] -> Printf.printf "\n"
  | a :: b ->
      Printf.printf "%d" a ;
      Printf.printf " " ;
      print_int_list b

let rec print_string_list = function
  | [] -> Printf.printf "\n"
  | a :: b ->
      Printf.printf "%s" a ;
      Printf.printf " " ;
      print_string_list b
;;

print_int_list (duplicates [1; 2; 3] [2; 4; 5; 7; 3]) ;;
print_string_list (duplicates ["12"; "34"; "string"] ["string"; "2"; "12"])
