let check msg x = Alcotest.(check bool) msg true x

let test_reverse_list_int () =
  check
    "reverse_list function result is reversed list"
    (Src.Reverse_list.reverse [1; 3; 4] = [4; 3; 1])

let test_reverse_list_string () =
  check
    "reverse_list function result is reversed list"
    (Src.Reverse_list.reverse ["a"; "b"; "c"] = ["c"; "b"; "a"])

let tests =
  [ ("reverse_list_int", `Quick, test_reverse_list_int);
    ("reverse_list_string", `Quick, test_reverse_list_string) ]
