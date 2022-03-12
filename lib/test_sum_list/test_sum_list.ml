let check msg x = Alcotest.(check bool) msg true x

let test_sum_list () =
  check
    "sum_list function result is total number of list of number"
    (Src.Sum_list.sum [1; 3; 4] = 8)

let tests = [("sum_list", `Quick, test_sum_list)]
