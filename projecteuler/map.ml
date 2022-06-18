module IntMap = Map.Make (Int) ;;

IntMap.add 1 true

let m0 =
  List.fold_left
    (fun a (k, v) -> IntMap.add k v a)
    IntMap.empty
    [(1, 10); (2, 20); (3, 30)]

type map = int IntMap.t

let pp_map ppf (m : map) =
  IntMap.iter (fun k v -> Format.fprintf ppf "%d -> %d@\n" k v) m
;;

IntMap.mem 1 m0 ;;
IntMap.mem 10 m0 ;;
IntMap.find_opt 1 m0 ;;
IntMap.find_opt 10 m0 ;;
IntMap.find 1 m0 ;;
Format.printf "%a" pp_map m0

module IntMap2 = Map.Make (Int)

type map = string IntMap2.t

let pp_map ppf (m : map) =
  IntMap2.iter (fun k v -> Format.fprintf ppf "%d -> %s@\n" k v) m

let m = IntMap2.empty
let m = IntMap2.add 4 "hello" m
let m = IntMap2.add 2 "world" m ;;

Format.printf "%a" pp_map (IntMap2.add 3 "teh" m)
