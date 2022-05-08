let check msg x = Alcotest.(check bool) msg true x

let test_enum_record () =
  check "enum record" (Main.Enum.check_enum Main.Enum.A = "A")

let tests = [("enum record", `Quick, test_enum_record)]
