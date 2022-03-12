let test_suites : unit Alcotest.test list =
  [ ("Src.Even", Test_even.tests);
    ("Src.Sum_list", Test_sum_list.tests);
    ("Src.Max_list", Test_max_list.tests) ]

let () = Alcotest.run "src" test_suites
