let check msg x = Alcotest.(check bool) msg true x

let test_merge_list () =
  check
    "merge_list function result is merged list"
    (Src.Merge_list.merge [3; 4; 1] [] = [3; 4; 1])

let test_merge_list2 () =
  check
    "merge_list function result is merged list"
    (Src.Merge_list.merge [] [3; 4; 1] = [3; 4; 1])

let test_merge_list3 () =
  check
    "merge_list function result is merged list"
    (Src.Merge_list.merge [1; 3; 4] [2; 5; 1] = [1; 2; 3; 4; 5; 1])
;;

Src.Print_list.print_list (Src.Merge_list.merge [1; 3; 4] [2; 5; 1])

let tests =
  [ ("merge_list", `Quick, test_merge_list);
    ("merge_list_2", `Quick, test_merge_list2);
    ("merge_list_3", `Quick, test_merge_list3) ]
