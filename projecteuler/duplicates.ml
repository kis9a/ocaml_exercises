let rec duplicates lst lstn =
  List.find_all (fun i -> List.exists (fun j -> i = j) lst) lstn
;;

print_list (duplicates [1; 2; 3] [2; 4; 5; 7; 3])
