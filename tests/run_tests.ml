let test_suites : unit Alcotest.test list =
  [ ("Src.Data", Test_data.tests); ("Src.List", Test_list.tests)
  ; ("Src.Sort", Test_sort.tests); ("Src.Record", Test_record.tests) ]

let () = Alcotest.run "src" test_suites
