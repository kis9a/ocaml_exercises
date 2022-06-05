let test_suites : unit Alcotest.test list =
  [("Problems.problems_1", Test_problems_1.tests)]

let () = Alcotest.run "src" test_suites
