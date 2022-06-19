let abc081_a s =
  let str = string_of_int s in
  let rec loop str acc =
    match str with
    | str when str = "" -> acc
    | str ->
        let s = String.sub str 0 1 in
        let r = String.sub str 1 (String.length str - 1) in
        loop r (if s = "1" then succ acc else acc)
  in
  loop str 0
;;

Printf.printf "%d\n" (abc081_a 101)
