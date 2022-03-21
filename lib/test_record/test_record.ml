let check msg x = Alcotest.(check bool) msg true x

let test_enum_record () =
  check "enum record" (Src.Enum.check_enum Src.Enum.A = "A")

let tests = [("enum record", `Quick, test_enum_record)]
