let check msg x = Alcotest.(check bool) msg true x

(* sum list *)
let test_sum_list () =
  check "sum_list function result is total number of list of number"
    (Main.Sum_list.sum [1; 3; 4] = 8)

let test_sum_list_minus () =
  check "sum_list function result is total number of list of number"
    (Main.Sum_list.sum [1; 3; 4; -88] = -80)

(* max min list *)
let test_max_list () =
  check "max_list function result is max number of list of number"
    (Main.Max_list.max [1; 43; 97; -4; 8] = 97)

let test_min_list () =
  check "min function result is min number of list of number"
    (Main.Min_list.min [1; 43; 97; -4; 8] = -4)

(* reverse list *)
let test_reverse_list_int () =
  check "reverse_list function result is reversed list"
    (Main.Reverse_list.reverse [1; 3; 4] = [4; 3; 1])

let test_reverse_list_string () =
  check "reverse_list function result is reversed list"
    (Main.Reverse_list.reverse ["a"; "b"; "c"] = ["c"; "b"; "a"])

(* merge list *)
let test_merge_list () =
  check "merge_list function result is merged list"
    (Main.Merge_list.merge [3; 4; 1] [] = [3; 4; 1])

let test_merge_list2 () =
  check "merge_list function result is merged list"
    (Main.Merge_list.merge [] [3; 4; 1] = [3; 4; 1])

let test_merge_list3 () =
  check "merge_list function result is merged list"
    (Main.Merge_list.merge [1; 3; 4] [2; 5; 1] = [1; 2; 3; 4; 5; 1])

(* filter list *)
let test_filter_list () =
  check "list filter function, result is filter by argument function"
    (List.filter (fun a -> a < 3) [1; 2; 3; 4] = [1; 2])

(* find all list *)
let test_find_list () =
  check "list find all function, result is find all by argument function"
    (List.find_all (fun a -> a = 3) [1; 2; 3; 3; 4; 3] = [3; 3; 3])

let tests =
  [ ("sum_list", `Quick, test_sum_list)
  ; ("sum_list_minus", `Quick, test_sum_list_minus)
  ; ("max_list", `Quick, test_max_list); ("min_list", `Quick, test_min_list)
  ; ("reverse_list_int", `Quick, test_reverse_list_int)
  ; ("reverse_list_string", `Quick, test_reverse_list_string)
  ; ("merge_list", `Quick, test_merge_list)
  ; ("merge_list_2", `Quick, test_merge_list2)
  ; ("merge_list_3", `Quick, test_merge_list3)
  ; ("filter_list", `Quick, test_filter_list)
  ; ("find_list", `Quick, test_find_list) ]
