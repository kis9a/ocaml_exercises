let test_suites : unit Alcotest.test list =
  [ ("Src.Even", Test_even.tests);
    ("Src.Sum_list", Test_sum_list.tests);
    ("Src.Max_list", Test_max_list.tests);
    ("Src.Reverse_list", Test_reverse_list.tests);
    ("Src.Merge_list", Test_merge_list.tests) ]

let () = Alcotest.run "src" test_suites
