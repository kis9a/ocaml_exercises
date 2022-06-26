let rec print_int_list = function
  | [] -> Printf.printf "\n"
  | a :: b ->
      Printf.printf "%d" a ;
      Printf.printf " " ;
      print_int_list b

let () =
  let rec count = function [] -> 0 | x :: xs -> 1 + count xs
  and sum = function [] -> 0 | x :: xs -> x + sum xs
  and rev = function [] -> [] | x :: xs -> rev xs @ [x] in
  Printf.printf "%d\n" (count [2; 3; 4]) ;
  Printf.printf "%d\n" (sum [2; 3; 4]) ;
  print_int_list (rev [2; 3; 4])

let () =
  let count lst = List.fold_left (fun acc x -> 1 + acc) 0 lst
  and sum lst = List.fold_left (fun acc x -> x + acc) 0 lst
  and rev lst = List.fold_right (fun x acc -> acc @ [x]) lst []
  and rev2 lst = List.fold_left (fun acc x -> x :: acc) [] lst in
  Printf.printf "%d\n" (count [2; 3; 4]) ;
  Printf.printf "%d\n" (sum [2; 3; 4]) ;
  print_int_list (rev [2; 3; 4]) ;
  print_int_list (rev2 [2; 3; 4])

let () =
  let mmap f ls = List.fold_right (fun x acc -> f x :: acc) ls [] in
  print_int_list (mmap (fun x -> x + 2) [1; 2; 3; 4])

let permutation lst =
  let rec p a b = function
    | [] -> a :: b
    | ls ->
        List.fold_left
          (fun x y -> p (y :: a) x (List.filter (( <> ) y) ls))
          b
          ls
  in
  p [] [] lst

let rec print_int_list_list = function
  | [] -> Printf.printf "\n"
  | a :: b ->
      print_int_list a ;
      Printf.printf " " ;
      print_int_list_list b
;;

print_int_list_list (permutation [1; 2; 3])
