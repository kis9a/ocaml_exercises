let check msg x = Alcotest.(check bool) msg true x

let test_max_list () =
  check
    "max_list function result is max number of list of number"
    (Src.Max_list.max [1; 43; 97; -4; 8] = 97)

let test_min_list () =
  check
    "max_list function result is min number of list of number"
    (Src.Min_list.min [1; 43; 97; -4; 8] = -4)

let tests =
  [("max_list", `Quick, test_max_list); ("min_list", `Quick, test_min_list)]
