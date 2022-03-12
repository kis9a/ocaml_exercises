let test_suites : unit Alcotest.test list = [("Src.even", Test_even.tests)]

let () = Alcotest.run "src" test_suites
