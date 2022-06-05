let test_suites : unit Alcotest.test list =
  [ ("Main.Data", Test_data.tests); ("Main.List", Test_list.tests)
  ; ("Main.Sort", Test_sort.tests); ("Main.Record", Test_record.tests) ]

let () = Alcotest.run "src" test_suites
