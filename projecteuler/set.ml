module IntSet = Set.Make (Int)

let s0 =
  List.fold_left
    (fun a x -> IntSet.add x a)
    IntSet.empty
    [5; 6; 4; 7; 3; 8; 2; 9; 1; 0]
;;

IntSet.mem 5 s0 ;;
IntSet.mem 50 s0 ;;
IntSet.find_opt 5 s0 ;;
IntSet.find_opt 50 s0 ;;
IntSet.min_elt s0 ;;
IntSet.max_elt s0
