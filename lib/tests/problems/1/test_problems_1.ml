let check msg x = Alcotest.(check bool) msg true x

(* 1 *)
let test_1_tail_of_a_list () =
  check "" (Problems.Tail_of_a_list.tail [5; 4; 9; 8; 2; 3] = Some 3)

let test_1_tail_function_of_a_list () =
  check "" (Problems.Tail_of_a_list.tail_function [5; 4; 9; 8; 2; 3] = Some 3)

let test_1_tail_of_a_list_2 () =
  check "" (Problems.Tail_of_a_list.tail ["b"; "c"; "a"] = Some "a")

let test_1_tail_function_of_a_list_2 () =
  check "" (Problems.Tail_of_a_list.tail_function ["b"; "c"; "a"] = Some "a")

(* 2 *)
let test_1_tail_2_of_a_list () =
  check "" (Problems.Tail_of_a_list.tail_2 [5; 4; 9; 8; 2; 3] = Some (2, 3))

let test_1_tail_2_function_of_a_list () =
  check ""
    (Problems.Tail_of_a_list.tail_2_function [5; 4; 9; 8; 2; 3] = Some (2, 3))

let test_1_tail_2_of_a_list_2 () =
  check "" (Problems.Tail_of_a_list.tail_2 ["b"; "c"; "a"] = Some ("a", "b"))

let test_1_tail_2_function_of_a_list_2 () =
  check ""
    (Problems.Tail_of_a_list.tail_2_function ["b"; "c"; "a"] = Some ("a", "b"))

let tests =
  [ ("test_1_tail_of_a_list", `Quick, test_1_tail_of_a_list)
  ; ("test_1_tail_of_a_list_2", `Quick, test_1_tail_of_a_list_2)
  ; ("test_1_tail_function_of_a_list", `Quick, test_1_tail_function_of_a_list)
  ; ( "test_1_tail_function_of_a_list_2"
    , `Quick
    , test_1_tail_function_of_a_list_2 )
  ; ("test_1_tail_2_of_a_list", `Quick, test_1_tail_2_of_a_list)
  ; ("test_1_tail_2_of_a_list_2", `Quick, test_1_tail_2_of_a_list_2)
  ; ("test_1_tail_2_of_a_list_2", `Quick, test_1_tail_2_of_a_list_2)
  ; ( "test_1_tail_2_function_of_a_list_2"
    , `Quick
    , test_1_tail_2_function_of_a_list_2 ) ]
