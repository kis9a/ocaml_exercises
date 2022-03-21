let check msg x = Alcotest.(check bool) msg true x

let test_insert_sort () =
  check "Insert sort function result is sorted list by insert sort "
    (Src.Insert_sort.sort [5; 4; 9; 8; 2; 3] = [2; 3; 4; 5; 8; 9])

let test_quick_sort () =
  check "Quick sort function result is sorted list by insert sort "
    (Src.Quick_sort.sort [5; 4; 9; 8; 2; 3] = [2; 3; 4; 5; 8; 9])

let tests =
  [ ("Insert sort", `Quick, test_insert_sort)
  ; ("Quick sort", `Quick, test_quick_sort) ]
