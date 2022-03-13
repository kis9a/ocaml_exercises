let check msg x = Alcotest.(check bool) msg true x

let test_sum_list () =
  check
    "sum_list function result is total number of list of number"
    (Src.Sum_list.sum [1; 3; 4] = 8)

let test_sum_list_minus () =
  check
    "sum_list function result is total number of list of number"
    (Src.Sum_list.sum [1; 3; 4; -88] = -80)

let tests =
  [ ("sum_list", `Quick, test_sum_list);
    ("sum_list_minus", `Quick, test_sum_list_minus) ]
