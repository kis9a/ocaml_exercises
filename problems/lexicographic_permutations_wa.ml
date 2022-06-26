let rec perm_insert x lst =
  match lst with
  | [] -> [[x]]
  | a :: b -> (x :: lst) :: List.map (fun el -> a :: el) (perm_insert x b)

let rec perm lst =
  match lst with
  | [] -> [lst]
  | a :: b -> List.flatten (List.map (perm_insert a) (perm b))

let rec print_int_list = function
  | [] -> ()
  | a :: b ->
      print_int a ;
      print_string " " ;
      print_int_list b

let rec list_of_int_list_to_list_of_string ll =
  let rec loop ll acc =
    match ll with [] -> acc | a :: b -> loop b (loop2 a "" :: acc)
  and loop2 lst acc =
    match lst with [] -> acc | a :: b -> loop2 b (acc ^ string_of_int a)
  in
  loop ll []

let rec print_list_of_int_list ll =
  match ll with
  | [] -> ()
  | a :: b ->
      print_int_list a ;
      Printf.printf "\n" ;
      print_list_of_int_list b

let rec print_string_list = function
  | [] -> ()
  | a :: b ->
      print_string a ;
      print_string " " ;
      print_string_list b

let rec insert lst n =
  match lst with
  | [] -> [n]
  | a :: b -> if n <= a then n :: a :: b else a :: insert b n

let rec sort lst = match lst with [] -> [] | a :: b -> insert (sort b) a ;;

print_list_of_int_list (perm [0; 1; 2]) ;;
Printf.printf "\n" ;;
print_string_list (list_of_int_list_to_list_of_string (perm [0; 1; 2])) ;;
Printf.printf "\n" ;;
print_string_list (sort (list_of_int_list_to_list_of_string (perm [0; 1; 2])))
;;
Printf.printf "\n"

let nst_lexicographic_permutations n r =
  let ns n =
    let rec loop i = if i <= n then i :: loop (succ i) else [] in
    loop 0
  in
  List.nth (sort (list_of_int_list_to_list_of_string (perm (ns r)))) n
;;

Printf.printf "%s\n" (nst_lexicographic_permutations 2 6)
