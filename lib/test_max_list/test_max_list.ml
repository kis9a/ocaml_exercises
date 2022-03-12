let check msg x = Alcotest.(check bool) msg true x

let test_max_list () =
  check
    "max_list function result is max number of list of number"
    (Src.Max_list.max [1; 43; 97; -4; 8] = 97)

let tests = [("max_list", `Quick, test_max_list)]
