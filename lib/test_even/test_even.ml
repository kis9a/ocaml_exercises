let check msg x = Alcotest.(check bool) msg true x

let test_even () =
  check
    "even function result is list of even numbers"
    (Src.Even.even [1; 2; 3; 4] = [2; 4])

let tests = [("even", `Quick, test_even)]
