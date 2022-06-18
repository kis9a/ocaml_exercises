let abc088_b lst =
  let sst = List.sort (fun x y -> if x > y then -1 else 1) lst in
  let rec loop lst ac bc =
    match lst with
    | [] -> ac - bc
    | [a] -> loop [] (ac + a) bc
    | a :: b :: c -> loop c (ac + a) (bc + b)
  in
  loop sst 0 0
;;

Printf.printf "%d\n" (abc088_b [2; 7; 4]) ;;
Printf.printf "%d\n" (abc088_b [20; 18; 2; 18])
