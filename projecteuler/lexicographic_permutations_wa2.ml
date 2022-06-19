let lexicographic_permutations digits nst =
  let permutation lst =
    let rec p a b = function
      | [] -> a :: b
      | ls ->
          List.fold_left
            (fun x y -> p (y :: a) x (List.filter (( <> ) y) ls))
            b
            ls
    in
    p [] [] lst
  in
  let su lst = List.sort (fun x y -> if x < y then -1 else 1) lst in
  let rec to_string ll =
    let rec loop ll acc =
      match ll with [] -> acc | a :: b -> loop b (acc ^ a)
    in
    loop ll ""
  in
  to_string (List.nth (su (permutation digits)) (pred nst))
;;

Printf.printf
  "%s\n"
  (lexicographic_permutations
     ["0"; "1"; "2"; "3"; "4"; "5"; "6"; "7"; "8"; "9"]
     1000000)
