let arc089_a ll =
  let is_even n = n mod 2 = 0 in
  let rec loop ll acc res =
    match ll with
    | [] -> res
    | a :: b ->
        let a0 = List.nth a 0 in
        let b0 = List.nth acc 0 in
        let a1 = List.nth a 1 in
        let b1 = List.nth acc 1 in
        let a2 = List.nth a 2 in
        let b2 = List.nth acc 2 in
        let d0 = a0 - b0 in
        let d1 = Int.abs (a1 - b1) in
        let d2 = Int.abs (a2 - b2) in
        let dd = d1 + d2 in
        if dd = 0 then if is_even d0 then loop b a "YES" else "NO"
        else if dd > d0 || d0 mod dd <> 0 then "NO"
        else loop b a "YES" in
  loop ll [0; 0; 0] "YES"
;;

(* YES *)
Printf.printf "%s\n" (arc089_a [[3; 1; 2]]) ;;
Printf.printf "%s\n" (arc089_a [[2; 0; 0]]) ;;
Printf.printf "%s\n" (arc089_a [[3; 1; 2]; [6; 1; 1]]) ;;

(* NO *)
Printf.printf "%s\n" (arc089_a [[3; 1; 4]]) ;;
Printf.printf "%s\n" (arc089_a [[3; 0; 0]]) ;;
Printf.printf "%s\n" (arc089_a [[5; 1; 1]; [100; 1; 1]])
